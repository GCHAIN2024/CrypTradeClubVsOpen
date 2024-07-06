module BizLogics.SSR

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
open BizLogics.Branch


let hash1,hash2 = 
    runtime.host.fsDir + "\\" + runtime.host.defaultHtml
    |> vueIndexFile__hashes

let ssrPageHome = {
    title = "cpto.cc"
    desc = "Social trading. Portfolio. Aggregated news and market data."
    image = "https://i.imgur.com/hzWYQow.png"
    url = runtime.host.url
    noscript = "" }

let r1 = string__regex @"\w+"

//  https://cha.in/m/1234
let hMoment req = 
    let m = 
        req.pathline.Substring 3
        |> regex_match r1

    match try_parse_int64 m with
    | Some id ->
        if runtime.data.mcs.ContainsKey id then
            runtime.data.mcs[id]
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

let echo req = 

    let h1 x = 
        let req = x.req
        if req.pathline.StartsWith "/ctc" then
            req.pathline <- req.pathline.Substring "/ctc".Length
        Suc x

    match 
        { req = req; rep = None}
        |> Suc
        |> bind h1
        |> bind (hpattern "/m/" hMoment)
        |> bindFail (hHomepage (fun _ -> ssrPageHome |> render((hash1,hash2))))
        |> bindFail (hapi echoApiHandler branch) with
    | Suc x -> x.rep
    | Fail(x,e) -> None



