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

type OrderAccess() =
    
    let db = dbSchema.GetDataContext()
    let context = HttpContext.Current

    let SendCompleteEMail sendTo from orderId =
        let message = new MailMessage (new MailAddress(from), new MailAddress(sendTo))
        let sc = new SmtpClient()
        sc.Send message

    member x.InsertOrder (p:OrderInfo) =
        let od = new dbSchema.ServiceTypes.Lc_OrderDetail()
        od.ProductID <- p.ProductID
        od.ProductName <- p.ProductName
        od.Quantity <- p.Quantity
        od.UserName <- p.UserName
        od.UnitCost <- p.UnitCost
         
        let o = new dbSchema.ServiceTypes.Lc_Orders ()
        o.CustomerEmail <- p.CustomerEMail
        o.CustomerName <- p.CustomerName
        o.Verified <- true
        o.DateCreated <- DateTime.Now
        o.Comments <- p.Comments 
        o.Lc_OrderDetail.Add od

        db.Lc_Orders.InsertOnSubmit(o)
        Repository.save

    member x.InsertShipping (p:AddressInfo) =
        let bi = new dbSchema.ServiceTypes.Lc_ShippingInfoTable()
        bi.FirstName <- p.FirstName
        bi.LastName <- p.LastName
        bi.MiddleName <- p.MiddleName
        bi.NickName <- p.NickName
        bi.OrderID <- p.OrderID
        bi.Phone <- p.Phone
        bi.Prefix <- p.Prefix
        bi.State <- p.State
        bi.Zip <- p.Zip
            
        db.Lc_ShippingInfoTable.InsertOnSubmit (bi)
        Repository.save

    member x.InsertBilling (p:AddressInfo) =
        let bi = new dbSchema.ServiceTypes.Lc_ShippingInfoTable()
        bi.FirstName <- p.FirstName
        bi.LastName <- p.LastName
        bi.MiddleName <- p.MiddleName
        bi.NickName <- p.NickName
        bi.OrderID <- p.OrderID
        bi.Phone <- p.Phone
        bi.Prefix <- p.Prefix
        bi.State <- p.State
        bi.Zip <- p.Zip
            
        db.Lc_ShippingInfoTable.InsertOnSubmit (bi)
        Repository.save

    member x.GetAllBillingDetails orderId =
        query { for b in db.Lc_BillingInfoTable do
                where (b.OrderID = orderId)
                yield billToAddressInfo b }

    member x.GetAllShippingDetails orderId =
        query { for b in db.Lc_ShippingInfoTable do
                where (b.OrderID = orderId)
                yield shipToAddressInfo b }

    member x.GetOrderDetails orderId =
        query { for od in db.Lc_OrderDetail do
                where (od.OrderID = orderId)
                yield toOrderDetailInfo od }

