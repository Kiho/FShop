namespace FsWeb.Repositories

open System
open System.Data
open System.Linq
open System.Web
open System.Web.Mvc
open System.Net.Http
open System.Web.Http

open Model
open FsWeb.Data.DataSource
open FsWeb.Data.DataRecord

type ShoppingCartAccess() =  
                            
    let db = dbSchema.GetDataContext()
    let context = HttpContext.Current

    let GetShoppingCartID =
        let withCacheKeyOf key = Some key 

        let makeNewCartID key =
                let cartId = string (Guid.NewGuid())
                let cookie = new HttpCookie(key, cartId)
                let howManyDays = 30 
                let currentDate = DateTime.Now
                let timeSpan = new TimeSpan(howManyDays, 0, 0, 0)
                let expirationDate = currentDate.Add(timeSpan)
                CacheAgent.set key cartId
                cartId

        let uid = if context.Request.IsAuthenticated then 
                        context.Request.LogonUserIdentity.Name
                  else  context.Request.AnonymousID
                    
        let cacheKey = withCacheKeyOf(String.concat "_" ["CartID"; uid])
        let cacheResult = 
            match cacheKey with
            | Some key -> CacheAgent.get<string> key
            | None -> None

        match cacheResult, cacheKey with
        | Some result, _ -> result 
        | None, Some key ->
                let r = context.Request.Cookies.[key]
                match r with
                | NotNull -> r.Value                                        
                | _ -> makeNewCartID key
        | _, _ -> ""
    
//    let ProductID = 
//        let r = context.Request.QueryString.["ProductID"]
//        match r with 
//        | NotNull -> int r
//        | _ -> 0

    let save fnSave =
        try
            fnSave()
            { IsValid=true; Message="Successfully Updated." }
        with
            | ex -> { IsValid=false; Message = String.concat "\n" ["Exception: "; ex.Message] }  

    let insertProductIntoCart (p:CartInfo) =
        let s = new dbSchema.ServiceTypes.Lc_ShoppingCart (
                        CartID = GetShoppingCartID,
                        ProductID = p.ProductID,
                        DateAdded = System.DateTime.Today,
                        Quantity = p.Quantity,
                        Price = p.Price,
                        Size = p.Size,
                        Color = p.Color )
        db.Lc_ShoppingCart.InsertOnSubmit(s)
        save db.DataContext.SubmitChanges

    let insertProductIntoWishList (p:CartInfo) =
        let userName = context.Request.LogonUserIdentity.Name
        let s = new dbSchema.ServiceTypes.Lc_WishList (
                        UserName = userName,
                        ProductID = p.ProductID,
                        DateAdded = System.DateTime.Today,
                        SizeID = 12,
                        ColorID = 10 )
        db.Lc_WishList.InsertOnSubmit(s)
        save db.DataContext.SubmitChanges

    member x.GetAllCartsByID = 
        query { for s in db.Lc_ShoppingCart do
                where (s.CartID = GetShoppingCartID)
                select s }

    member x.GetShoppingCartItemCount = 
        query { for s in db.Lc_ShoppingCart do
                where (s.CartID = GetShoppingCartID)
                count }

    member x.IsItemInCart productId size color = 
        let r = query { for s in db.Lc_ShoppingCart do
                        where (s.CartID = GetShoppingCartID &&
                            s.ProductID = productId &&
                            s.Size = size &&
                            s.Color = color )
                        select s }
        r.Any()

    member x.InsertProductIntoCart (p:CartInfo) =           
        if (x.IsItemInCart p.ProductID p.Size p.Color) then
            raise (System.ArgumentException("Item exists in cart!"))
        else
            insertProductIntoCart p

    member x.IsProductInCart (p:CartInfo) = 
        let r = query { for s in db.Lc_ShoppingCart do
                        where (s.ProductID = p.ProductID && s.CartID = GetShoppingCartID)
                        select s } 
        r.Any()

    member x.InsertProductIntoWishList (p:CartInfo) =           
        insertProductIntoWishList p