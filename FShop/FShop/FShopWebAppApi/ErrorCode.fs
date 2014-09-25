module ErrorCode

open System.Web.Security
open WebMatrix.WebData

    let ErrorCodeToString createStatus =
        match createStatus with
        | MembershipCreateStatus.DuplicateUserName ->
            "User name already exists. Please enter a different user name."

        | MembershipCreateStatus.DuplicateEmail ->
            "A user name for that e-mail address already exists. Please enter a different e-mail address."

        | MembershipCreateStatus.InvalidPassword ->
            "The password provided is invalid. Please enter a valid password value."

        | MembershipCreateStatus.InvalidEmail ->
            "The e-mail address provided is invalid. Please check the value and try again."

        | MembershipCreateStatus.InvalidAnswer ->
            "The password retrieval answer provided is invalid. Please check the value and try again."

        | MembershipCreateStatus.InvalidQuestion ->
            "The password retrieval question provided is invalid. Please check the value and try again."

        | MembershipCreateStatus.InvalidUserName ->
            "The user name provided is invalid. Please check the value and try again."

        | MembershipCreateStatus.ProviderError ->
            "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator."

        | MembershipCreateStatus.UserRejected ->
            "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator."

        | _ ->
            "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator."
