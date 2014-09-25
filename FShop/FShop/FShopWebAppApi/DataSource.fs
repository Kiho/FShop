namespace FsWeb.Data

open Microsoft.FSharp.Data.TypeProviders

module DataSource =

    [<Literal>]
    let version = "1.0.0.0"
//    [<Literal>]    // You can use Server Explorer to build your ConnectionString. 
//    let connectionString = "Data Source=(LocalDb)\Projects;Initial Catalog=BalloonShop;Integrated Security=SSPI;AttachDBFilename=F:\FSharp\FShop\FShop\FShopWebApi\App_Data\BalloonShop.mdf"
//    type dbSchema = SqlDataConnection<connectionString>
    
    type dbSchema = SqlDataConnection<ConnectionStringName="ShopDbContext", StoredProcedures=true, Pluralize=false>

