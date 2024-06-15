module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Zmq

open Server.Common

let branch x =
    match x.service with
    | "public" -> 
        match x.api with
        | _ -> Fail(Error.ApiNotExists, x)
    | "admin" -> 
        match x.api with
        //| "sRK" -> setRolfKey |> bindOK x 
        | _ -> Fail(Error.ApiNotExists, x)
    | _ -> Fail(Error.ApiNotExists, x)


let wsHandler zweb wsp =

    "<< Client: " + wsp.client.ToString() + " << incoming " + wsp.bin.Length.ToString() + " bytes"
    |> output

    //wsp.bin |> binPushWsToAll zweb

    ">> Server Broadcast >> " + wsp.bin.Length.ToString() + " bytes"
    |> output

    None
