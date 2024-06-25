module BizLogics.Branch

open System
open System.Text
open System.Collections.Generic
open System.Threading

open Util.Cat
open Util.Text
open Util.Bin
open Util.Perf
open Util.Json
open Util.Http
open Util.HttpServer
open Util.Zmq

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open UtilWebServer.Common
open UtilWebServer.Api
open UtilWebServer.Json
open UtilWebServer.SSR

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common
open BizLogics.Social
open BizLogics.Auth
open BizLogics.Api


let branching x = 

    let bindx p = 
        x.proco <- Some p
        Suc x

    match x.service with
    | "public" -> 
        match x.api with
        | "ping" -> bindx api_Public_Ping
        | "auth" -> bindx auth
        | "listBiz" -> bindx api_Public_ListBiz
        | "listCur" -> bindx api_Public_ListCur
        | "homepageMoments" -> bindx api_Public_HomepageMoments
        | "loadMoment" -> bindx api_Public_LoadMoment
        | _ -> Fail(Er.ApiNotExists,x)
    | "eu" -> Fail(Er.ApiNotExists,x)
    | "admin" -> Fail(Er.ApiNotExists,x)
    | "open" -> Fail(Er.ApiNotExists,x)
    | _ -> Fail(Er.ApiNotExists,x)


let branch service api json = 

    use cw = new CodeWrapper("Server.WebHandler.branch")

    let mutable x = incoming__x runtime service api "" json
    
    match service with
    | "eu" ->
        x <- 
            x 
            |> bind checkSession
            |> bind checkSessionEu
    | "admin" ->
        x <- 
            x 
            |> bind checkSession
            |> bind checkSessionEu
    | "open" ->
        x <- 
            x 
            |> bind checkSession
            |> bind checkSessionEu

    | _ -> ()

    match
        x
        |> bind branching with
    | Suc x -> 
        use cw = new CodeWrapper("branch.exe")

        match x.proco with
        | Some p ->
            use cw = new CodeWrapper("Api." + x.api)
            p x
        | None -> [| ok |]
    | Fail(e,x) -> er e
