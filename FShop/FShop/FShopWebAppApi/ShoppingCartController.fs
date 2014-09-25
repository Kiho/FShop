namespace FsWeb.Controllers

open System.Web
open System.Web.Mvc
open System.Net.Http
open System.Web.Http
open Model
open FsWeb.Data.DataSource
open FsWeb.Data.DataRecord
open FsWeb.Repositories
open Repository

type ShoppingCartController()  =
    inherit ApiController()
    
    let context = HttpContext.Current

    let addToCart (p: CartInfo) =
        let productAccess = new ProductAccess()
        if (productAccess.GetProductInventory p) then
            let quantityInStock = productAccess.QuantityInStock p
            if (p.Quantity <= quantityInStock) then
                let cartAccess= new ShoppingCartAccess()
                let res = cartAccess.InsertProductIntoCart p
                {Text= "Product added successfully!"; CssClass = "success"; Visible = true}
            else
                {Text= "<b>I'm sorry, but that quantity isn't available.</b>"; CssClass = "error"; Visible = true}
        else
            {Text= "<b>I'm sorry, but this product is out of stock.</b>"; CssClass = "error"; Visible = true}

    let addToWishList (p: CartInfo) = 
        if context.Request.IsAuthenticated then
            let productAccess = new ProductAccess()
            if not (productAccess.IsProductInWishList p) then
                let cartAccess= new ShoppingCartAccess()
                let res = cartAccess.InsertProductIntoWishList p
                if (res.IsValid)then
                    {Text= "Product added to your wish list!"; CssClass = "success"; Visible = true}
                else
                    {Text= res.Message; CssClass = "error"; Visible = true}
            else
                {Text= "This product already exists in your wish list"; CssClass = "error"; Visible = true}
        else
             {Text= "Please login to add products to your wish list."; CssClass = "error"; Visible = true}
                    
    // GET /api/values
    member x.Post ([<FromBody>] p: CartInfo) = 
        match p.ApplyTo with
        | 2 -> addToWishList p
        | _ -> addToCart p
       

//        match base.ModelState.IsValid  with
//        | false -> ()
//        | true -> addToCart value
            