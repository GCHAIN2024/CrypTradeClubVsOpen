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
open BizLogics.ApiPublic
open BizLogics.ApiEu


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

        | "homepage" -> bindx api_Public_Homepage
        | "loadMoment" -> bindx api_Public_LoadMoment
        | _ -> Fail(Er.ApiNotExists,x)
    | "eu" -> 
        match x.api with
        | "listArbitrage" -> bindx api_Eu_ListMyArbitrage
        | "createArbitrage" -> bindx api_Eu_CreateMyArbitrage
        | "updateArbitrage" -> bindx api_Eu_UpdateMyArbitrage

        | "listMyFollow" -> bindx api_Eu_ListMyFollow
        | "toggleMyFollow" -> bindx api_Eu_ToggleMyFollow
        | "updateMyFollow" -> bindx api_Eu_UpdateMyFollow

        | _ -> Fail(Er.ApiNotExists,x)
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

    runApi branching x
