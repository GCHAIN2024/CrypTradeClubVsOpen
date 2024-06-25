﻿module BizLogics.Common

open System
open System.Collections.Generic
open System.Collections.Concurrent

open Util.Cat
open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.Common
open UtilWebServer.Db

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types


let defaultHost() = {
    zmq = true
    port = 80
    conn = "server=.; database=CTC; Trusted_Connection=True;"
    defaultHtml = "index.html"

    openDiscordAppId = 
        [|  "1254790111"
            "913181274" |]
        |> String.Concat
    openDiscordPubKey = 
        [|  "e0300e71e2dc"
            "94ec42425c"
            "eea8faed6b6"
            "172158dbbc1"
            "b882fa2750f"
            "b55dec22a" |]
        |> String.Concat
    openDiscordSecret = 
        [|  "YwZeJGUrR"
            "JwL3E7V"
            "cwlgtvJ_"
            "oeT01nom" |]
        |> String.Concat

    fsDir = @"C:\Dev\GCHAIN2024\CrypTradeClubVsOpen\Deploy" }

type Session = SessionTemplate<EuComplex,unit>
type Sessions = SessionsTemplate<EuComplex,unit>


type RuntimeData = {
mutable facts: Fact list
langs: ConcurrentDictionary<string,LANG>
curs: ConcurrentDictionary<string,CUR>
bcs: ConcurrentDictionary<string,BizComplex>
moments: ConcurrentDictionary<int64,MomentComplex> }

type Runtime = RuntimeTemplate<EuComplex,unit,RuntimeData>

type X = UtilWebServer.Api.ApiCtx<Runtime,Session,Er>

type CtxWrappedX = CtxWrapper<X,Er>

let runtime__id__bc runtime id = 
    runtime.bcs.Values
    |> Seq.tryFind(fun bc -> bc.biz.ID = id)

type HostEnum = 
| Prod
| RevengeDev

let hostEnum = 
    match Environment.MachineName with
    | "MAIN" -> RevengeDev
    | _ -> Prod

let host e = 

    let h = defaultHost()

    match e with
    | Prod -> 
        h.zmq <- true
    | RevengeDev -> 
        h.zmq <- false

    h

let runtime:Runtime = 
    let host = host hostEnum

    {
        host = host
        data = {
            facts = []      
            langs = new ConcurrentDictionary<string,LANG>()
            curs = new ConcurrentDictionary<string,CUR>()
            bcs = new ConcurrentDictionary<string,BizComplex>()
            moments = new ConcurrentDictionary<int64,MomentComplex>() }
        users = new ConcurrentDictionary<int64,EuComplex>()
        sessions = new ConcurrentDictionary<string,Session>()
        output = output }


let appendFact runtime fact = 
    lock runtime.facts (fun _ ->
        runtime.facts <- 
            runtime.facts
            |> List.append [fact])

let checkoutBizComplex runtime code = 
    if runtime.bcs.ContainsKey code then
        runtime.bcs[code] |> Some
    else

        let pretx = None |> opctx__pretx
    
        let rcd = 

            let p = pBIZ_empty()

            p.Code <- code

            p
            |> populateCreateTx pretx BIZ_metadata

        if pretx |> loggedPipeline "BizLogics.TinyLink.url__tinylink" conn then

            let bc = {
                biz = rcd
                moments = new Dictionary<int64,MomentComplex>() }
            runtime.bcs[code] <- bc

            Some bc
        else
            None
        



