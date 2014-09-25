namespace FsWeb.Controllers

open System.Web
open System.Web.Http
open System.Data
open System.Linq
open System.Data.Linq.SqlClient

open Model
open FsWeb.Data.DataSource
open FsWeb.Data.DataRecord
open FsWeb.Repositories
open Repository

type ProductsController() =
    inherit ApiController()

    let db = dbSchema.GetDataContext() 

    let find filterPredFn fn =
        filterPredFn
        |> fun fl s -> 
            let qry = query { 
                for p in db.Lc_Product do
                join l in db.Lc_ProductCategory on (p.ProductID = l.ProductID) 
                select (p, l)}
            query {
                for p in qry do
                where (fl p)
                yield fn (p) }

    let getProducts cat id fn =
        fun s -> query { 
            for p in db.Lc_Product do
            join l in db.Lc_ProductCategory on (p.ProductID = l.ProductID)      
            where ((id = 0 || (id > 0 && l.ProductID = id)) && (cat = 0 || (l.CategoryID = cat))) 
            yield fn (p, l) }  

    let getCatalogPromotion fn = 
        fun s -> query { 
            for p in db.Lc_Product do
            join l in db.Lc_ProductCategory on (p.ProductID = l.ProductID)
            where (p.OnCatalogPromotion)                             
            yield fn (p, l) }

    let findLike text fn = 
        fun s -> query { 
            for p in db.Lc_Product do
            join l in db.Lc_ProductCategory on (p.ProductID = l.ProductID)
            where (SqlMethods.Like(p.Name, text + "%"))                            
            yield fn (p, l) }

    let getDepartmentPromotion dept fn = 
        fun s -> query { 
            for p in db.Lc_Product do
            join l in db.Lc_ProductCategory on (p.ProductID = l.ProductID)
            join c in db.Lc_Category on (l.CategoryID = c.CategoryID)
            where (p.OnDepartmentPromotion = true && c.DepartmentID = dept)                             
            yield fn (p, l) }
           
    let prodRepository = db.Lc_Product |> Repository.get 
    let distinctRepository = db.Lc_Product |> Repository.getPost

    let Load cat id = 
        getProducts cat id toProductInfo |> prodRepository  
            <| withCacheKeyOf(String.concat "_" ["Product"; string cat; string id])

//    let OnCatalogPromotion = 
//        getCatalogPromotion toProductInfo |> prodRepository  
//            <| withCacheKeyOf("CatalogPromotionProducts")

//    let Load cat id =
//        find (fun (x, y) -> (id = 0 || (id > 0 && y.ProductID = id)) && (cat = 0 || (y.CategoryID = cat))) toProductInfo |> prodRepository  
//            <| withCacheKeyOf(String.concat "_" ["Product"; string cat; string id])

    let OnCatalogPromotion =
        find (fun (x, y) -> x.OnCatalogPromotion) toProductInfo |> distinctRepository             
            <| withCacheKeyOf("CatalogPromotionProduct") <| (fun z-> Seq.distinctBy (fun y -> y.ID) z)

    let OnDepartmentPromotion dept = 
        getDepartmentPromotion dept toProductInfo |> prodRepository 
            <| withCacheKeyOf(String.concat "_" ["DepartmentPromotion"; string dept])

//    let Search text = 
//        find (fun (x, y) -> SqlMethods.Like(x.Name, text + "%")) toProductInfo |> prodRepository  
//            <| withCacheKeyOf("Search_" + text)

//    let Search text = 
//        find (fun (x, y) -> x.Name.Contains(text)) toProductInfo |> prodRepository  
//            <| withCacheKeyOf("Search_" + text)
    let Search text = 
        findLike text toProductInfo |> prodRepository  
            <| withCacheKeyOf("SearchProduct" + text)

    // GET /api/products
    member x.Get() = OnCatalogPromotion
    // GET /api/products/5
    member x.Get (id:int) = Load 0 id
    // GET /api/products/0/5
    member x.Get (id:int, cat: int) = Load cat id
    // GET /api/products/0/0/2
    member x.Get (id:int, cat: int, dept: int) = OnDepartmentPromotion dept

    [<HttpGet>]
    member x.Find (text: string) = Search text

//    // POST /api/products
//    member x.Post ([<FromBody>] value:string) = ()
//    // PUT /api/products/5
//    member x.Put (id:int) ([<FromBody>] value:string) = ()
//    // DELETE /api/products/5
//    member x.Delete (id:int) = ()
    

    


