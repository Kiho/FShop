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

type InventoryAccess() =

    let db = dbSchema.GetDataContext()
    let context = HttpContext.Current

    member x.GetProductSizeColor (p:CartInfo) = 
        query { for a in db.Lc_ProductInventory do
                         where (a.Color = p.Color && a.Size = p.Size && a.ProductID = p.ProductID)
                         select a }

    member x.InsertProductIntoInventory (p:CartInfo) sellerId = 
        let pr = new dbSchema.ServiceTypes.Lc_ProductInventory(
                        ProductID = p.ProductID,
                        Quantity = p.Quantity,
                        SellerID = sellerId,
                        Size = p.Size,
                        Color = p.Color )
        db.Lc_ProductInventory.InsertOnSubmit(pr)
        Repository.save

    member x.UpdateQuantity (p:CartInfo) = 
        let qry = x.GetProductSizeColor p        
        qry |> Seq.iter(fun x-> x.Quantity <- p.Quantity) 
        Repository.save
