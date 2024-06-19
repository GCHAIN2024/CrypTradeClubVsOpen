module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Bin
open Util.Perf
open Util.Json
open Util.Zmq

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open UtilWebServer.Common
open UtilWebServer.Api

open BizLogics.Api

let plugin req = 

    [| |]
    |> Some

let req__rep json = 
    let bb = new BytesBuilder()
    apiHandler branch json (tryFindStrByAtt "api" json)
    |> Msg.ApiResponse
    |> Msg__bin bb
    bb.bytes()

let wsHandlerZweb zweb wsp =

    "<< Client: " + wsp.client.ToString() + " << incoming " + wsp.bin.Length.ToString() + " bytes"
    |> output

    if wsp.bin.Length > 20 then 
        ()

    match
        (wsp.bin, ref 0)
        |> bin__Msg with
    | ApiRequest json ->
        json
        |> req__rep
        |> binPushWs__conn zweb wsp.client
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
        json
        |> req__rep
        |> ignore
    | _ ->
        Console.WriteLine("None")
        ()

    //wsp.bin |> binPushWsToAll zweb

    //">> Server Broadcast >> " + incoming.Length.ToString() + " bytes"
    //|> output

    None
