[<AutoOpen>]
module Model

open System
open Newtonsoft.Json
open System.Web.Mvc

let NullCheck = function 
                | v when v <> null -> Some v
                | _ -> None

let asActionResult result = result :> ActionResult

let (|NotNull|_|) v = 
  if obj.ReferenceEquals(v, null) then None 
  else Some()

[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type FeedBack = { Text:string; CssClass:string; Visible:bool }

[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type Result = {IsValid: bool; Message: string}

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type CategoryInfo = {
    ID : int
    Name : string
    Description : string
    DepartmentID : int }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type DepartmentInfo = {
    ID : int
    Name : string
    Description : string
    Categories: seq<CategoryInfo> }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type RecommendationInfo = {
    RecommendationID: int
    Title: string
    DateInserted: DateTime
    UserName: string
    Description: string
    Points: int }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type ProductInfo = {
    ID : int
    Name : string
    Description : string
    ImageFile1: string
    ImageFile2: string
    Price : System.Decimal
    CategoryID: int }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type CartInfo = {    
    mutable ProductID : int
    ApplyTo: int
    Quantity : int
    Price : decimal
    Size : string
    Color : string }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type OrderInfo = {
    UserName : string
    ProductID : int
    Quantity : int
    UnitCost : decimal
    ProductName : string
    CustomerEMail : string
    CustomerName : string 
    Comments : string }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type AddressInfo = {
    FirstName : string
    LastName : string
    MiddleName : string
    NickName : string
    OrderID : int
    Phone : string
    Prefix : string
    State : string 
    Zip : string }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type OrderDetailInfo = {
    ProductID : int
    ProductName : string
    Quantity : int
    UserName : string
    UnitCost : decimal }

[<CLIMutable>]
[<JsonObject(MemberSerialization=MemberSerialization.OptOut)>]
type CompleteOrderInfo = {
    OrderID : int
    Tax : double
    BillingState : string }