namespace FsWeb.Controllers

open System.Web
open System.Web.Mvc

[<HandleError>]
type DurandalController() =
    inherit Controller()
    member this.Index () =
        this.View() :> ActionResult
