namespace FsWeb.Repositories

open System
open System.Linq
open FsWeb.Data.DataSource

module Repository =
    let withCacheKeyOf key = Some key 
    let doNotUseCache = None     
    let db = dbSchema.GetDataContext()

    let getPost (source:IQueryable<_>) queryFn cacheKey postFn = 
        let cacheResult = 
            match cacheKey with
            | Some key -> CacheAgent.get<'a list> key
            | None -> None

        match cacheResult, cacheKey with
        | Some result, _ -> result 
        | None, Some cacheKey -> 
                let result = queryFn source |> postFn |> Seq.toList                  
                CacheAgent.set cacheKey result
                result           
        | _, _ -> queryFn source |> Seq.toList 
    
    let get (source:IQueryable<_>) queryFn cacheKey =
        getPost source queryFn cacheKey (fun x -> x)

    let getAll fn =
        fun s -> query { for x in s do
                         yield fn x }
    
    let find filterPredFn =
        filterPredFn
        |> fun fn s -> query { for x in s do
                               where (fn()) }
    
    let getTop rowCount =
        rowCount
        |> fun cnt s -> query { for x in s do
                                take cnt } 
                                    
    let save =
        try
            db.DataContext.SubmitChanges()
            { IsValid=true; Message="Successfully Updated." }
        with
            | ex -> { IsValid=false; Message = String.concat "\n" ["Exception: "; ex.Message] }  