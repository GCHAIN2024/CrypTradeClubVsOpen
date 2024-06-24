module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

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

open BizLogics.Common
open BizLogics.Social
open BizLogics.Api

let hash1,hash2 = 
    runtime.host.fsDir + "\\" + runtime.host.defaultHtml
    |> vueIndexFile__hashes

let ssrPageHome = {
    title = "GCHA.IN"
    desc = "GCHAIN is a revolutionary way to promote websites through a hierarchical referral program."
    image = "https://i.imgur.com/N3MaARt.jpg"
    url = "https:// /"
    noscript = "" }

let r1 = string__regex @"\w+"

//  https://cha.in/m/1234
let hMoment req = 
    let m = 
        req.pathline.Substring 3
        |> regex_match r1

    match try_parse_int64 m with
    | Some id ->
        if runtime.moments.ContainsKey id then
            runtime.moments[id]
            |> mc__ssrPage
            |> render (hash1,hash2)
            |> bin__StandardResponse "text/html"
        else

            {
                title = "GCHAIN Crypto Link"
                desc = ""
                image = ""
                url = ""
                noscript = "" }
            |> render (hash1,hash2)
            |> bin__StandardResponse "text/html"

            //rep404
    | None -> rep404

let checkSession = UtilWebServer.Auth.checkSession Er.Unauthorized runtime.sessions

let checkSessionEu (x:X) = 
    match x.sessiono.Value.identity with
    | SessionRole.EndUser eu -> Suc x
    | _ -> Fail(Er.Unauthorized,x)


let branching x = 

    let bindx p = 
        x.proco <- Some p
        Suc x

    match x.service with
    | "public" -> 
        match x.api with
        | "ping" -> bindx api_Public_Ping
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


let echo req = 

    if req.pathline.StartsWith "/ctc" then
        req.pathline <- req.pathline.Substring "/ctc".Length

    if req.pathline = "/" then
        ssrPageHome
        |> render (hash1,hash2)
        |> Some
    else if req.pathline.StartsWith "/m/" then
        hMoment req
        |> Some
    else if req.path.Length = 3 then
        if req.path[0] = "api" then
            echoApiHandler branch req
            |> Some
        else
            None
    else
        None

let wsHandlerZweb zweb wsp =

    "<< Client: " + wsp.client.ToString() + " << incoming " + wsp.bin.Length.ToString() + " bytes"
    |> output

    if wsp.bin.Length > 20 then 
        ()

    match
        (wsp.bin, ref 0)
        |> bin__Msg with
    | ApiRequest json ->
        ()
    | _ ->
        Console.WriteLine("None")
        ()

    //wsp.bin |> binPushWsToAll zweb

    ">> Server Broadcast >> " + wsp.bin.Length.ToString() + " bytes"
    |> output

    None

let wsHandler (incoming:byte[]) =

    "<< incoming " + incoming.Length.ToString() + " bytes"
    |> output

    match
        (incoming, ref 0)
        |> bin__Msg with
    | ApiRequest json ->
        ()
    | _ ->
        Console.WriteLine("None")
        ()

    //wsp.bin |> binPushWsToAll zweb

    //">> Server Broadcast >> " + incoming.Length.ToString() + " bytes"
    //|> output

    None
