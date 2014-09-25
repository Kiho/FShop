namespace FsWeb.Repositories

open System
open System.Linq
open System.Web
open System.Web.Mvc
open System.Net.Http
open System.Web.Http
open System.Net.Mail
open System.Linq

open Model
open FsWeb.Data.DataSource
open FsWeb.Data.DataRecord
open Repository

type ProductAccess() =
    
    let db = dbSchema.GetDataContext()
    let context = HttpContext.Current

    let getProductInventory (p:CartInfo) = 
        query { for pr in db.Lc_ProductInventory do
                        join c in db.Lc_ColorTable on (pr.Color = c.Color)
                        join s in db.Lc_SizeTable on (pr.Size = s.Size)
                        where ( pr.ProductID = p.ProductID && pr.Color = p.Color && pr.Size = p.Size && pr.Quantity > 0 )
                        select pr }

    member x.GetProductInventory (p:CartInfo) =
        (getProductInventory p).Any()

    member x.QuantityInStock (p:CartInfo) =
        let r = (getProductInventory p).FirstOrDefault()
        match r with
        | NotNull -> r.Quantity                                        
        | _ -> 0 

    member x.IsProductInWishList (p:CartInfo) =
        let r = query { for wi in db.Lc_WishList do
                        join c in db.Lc_ColorTable on (wi.ColorID = c.ColorID)
                        join s in db.Lc_SizeTable on (wi.SizeID = s.SizeID)
                        where ( c.Color = p.Color && s.Size = p.Size && wi.ProductID = p.ProductID )
                        select wi }
        r.Any()
    
    member x.ProductRecommendations (p:CartInfo) =
        query { for q in db.Lc_Recommendation do
                        where (q.ProductID = p.ProductID && q.Approved)
                        select q }