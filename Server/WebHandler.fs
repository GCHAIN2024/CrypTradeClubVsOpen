module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
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

open BizLogics.Api

let branch service api json = 

    match service with
    | "public" -> 
        match api with
        | "ping" -> api_Public_Ping json
        | "listBiz" -> api_Public_ListBiz json
        | "listCur" -> api_Public_ListCur json
        | "homepageMoments" -> api_Public_HomepageMoments json
        | _ -> [|  er Er.ApiNotExists   |]
    | "eu" -> [|  er Er.ApiNotExists   |]
    | "admin" -> [|  er Er.ApiNotExists   |]
    | "open" -> [|  er Er.ApiNotExists   |]
    | _ -> [|  er Er.ApiNotExists   |]

let echo req = 

    if req.pathline.StartsWith "/m/" then
        None
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
