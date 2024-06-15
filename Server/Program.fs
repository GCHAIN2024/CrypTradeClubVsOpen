
module Server.Launching

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Zmq

open Server.Types

let since = DateTime.UtcNow

let output:string -> unit = 

    let assbly = System.Reflection.Assembly.GetCallingAssembly()
    let dir = Directory.GetCurrentDirectory()
    if dir.EndsWith "WebService" then
        Debug.WriteLine
    else if dir.EndsWith "WebApp" then
        fun s ->
            let elapse = DateTime.UtcNow.Subtract since
            [|
                elapse.Days.ToString("000") + "."
                elapse.Hours.ToString("00") + ":"
                elapse.Minutes.ToString("00") + ":"
                elapse.Seconds.ToString("00") + "."
                elapse.Milliseconds.ToString("000") + "> "
                s |]
            |> String.Concat
            |> Debug.WriteLine
    else
        Console.OutputEncoding <- Encoding.Unicode
        Console.WriteLine

[<EntryPoint>]

let main argv =
    
    let port = 12077

    let zweb = create__ZWeb 2 port LogLevel.All false [||]

    let runtime = {
        host = {
            defaultHtml = "index.html"
            fsDir = @"C:\Dev\GCHAIN2024\CrypTradeClubVsOpen\Deploy" }
        zweb = zweb
        output = output }

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

    zweb.disconnector.Add(fun bin -> ())
    lauchWebServer 
        output 
        (httpHandler (httpEcho runtime.host.fsDir runtime.host.defaultHtml runtime branch))
        wsHandler 
        zweb

    Util.Runtime.halt output "" ""

    0