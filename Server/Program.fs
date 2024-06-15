﻿
module Server.Launching

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Zmq

open Server.Common
open Server.WebHandler


[<EntryPoint>]

let main argv =

    zweb.disconnector.Add(fun bin -> ())
    lauchWebServer 
        output 
        (httpHandler (httpEcho runtime.host.fsDir runtime.host.defaultHtml runtime branch))
        wsHandler 
        zweb

    Util.Runtime.halt output "" ""

    0