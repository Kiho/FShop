namespace FsWeb.Controllers

open System.Web
open System.Web.Mvc

[<HandleError>]
type HomeController() =
    inherit Controller()

    member x.Index () =
        x.ViewData.["Message"] <- "Modify this template to jump-start your ASP.NET MVC application."
        x.View() :> ActionResult

    member x.Contact () =
        x.ViewData.["Message"] <- "Your contact page."
        x.View() :> ActionResult
                
    member x.About () =
        x.ViewData.["Message"] <- "Your app description page."
        x.View() :> ActionResult


