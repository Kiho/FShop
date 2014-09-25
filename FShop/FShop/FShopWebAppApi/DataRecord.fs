namespace FsWeb.Data

open DataSource

module DataRecord =

    let toCategoryInfo (p: dbSchema.ServiceTypes.Lc_Category) = {   
                CategoryInfo.ID = p.CategoryID
                Name = p.Name 
                Description = p.Description
                DepartmentID = p.DepartmentID }

    let toDepartmentInfo (d: dbSchema.ServiceTypes.Lc_Department) categories = { 
                DepartmentInfo.ID = d.DepartmentID
                DepartmentInfo.Name = d.Name
                DepartmentInfo.Description = d.Description
                DepartmentInfo.Categories = seq { 
                    for a in categories do
                    if (a.DepartmentID = d.DepartmentID) then
                        yield a } }

    let toProductInfo (p: dbSchema.ServiceTypes.Lc_Product, l: dbSchema.ServiceTypes.Lc_ProductCategory) =  { 
                ProductInfo.ID = p.ProductID
                Name = p.Name 
                Description = p.Description
                ImageFile1 = p.Image1FileName
                ImageFile2 = p.Image2FileName
                Price = p.Price
                CategoryID = match l with 
                                | NotNull -> l.CategoryID
                                | _ -> 0 }

    let billToAddressInfo (p: dbSchema.ServiceTypes.Lc_BillingInfoTable) = {   
                FirstName = p.FirstName 
                LastName = p.LastName
                MiddleName = p.MiddleName
                NickName = p.NickName
                OrderID = p.OrderID
                Phone = p.Phone
                Prefix = p.Prefix
                State = p.State
                Zip = p.Zip }

    let shipToAddressInfo (p: dbSchema.ServiceTypes.Lc_ShippingInfoTable) = {   
                FirstName = p.FirstName 
                LastName = p.LastName
                MiddleName = p.MiddleName
                NickName = p.NickName
                OrderID = p.OrderID
                Phone = p.Phone
                Prefix = p.Prefix
                State = p.State
                Zip = p.Zip }

    let toOrderDetailInfo (p: dbSchema.ServiceTypes.Lc_OrderDetail) = {
                OrderDetailInfo.ProductID = p.ProductID
                ProductName = p.ProductName
                Quantity = p.Quantity
                UserName = p.UserName
                UnitCost = p.UnitCost }