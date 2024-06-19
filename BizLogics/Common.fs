﻿module BizLogics.Common

open System
open System.Collections.Generic
open System.Collections.Concurrent

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
    fsDir = @"C:\Dev\GCHAIN2024\CrypTradeClubVsOpen\Deploy" }

type EuComplex = {
eu: EU }

type BizComplex = {
biz: BIZ
moments: Dictionary<int64,MOMENT> }


type Runtime = {
host: Host
mutable facts: Fact list
ecs: ConcurrentDictionary<int64,EuComplex>
bcs: ConcurrentDictionary<string,BizComplex>
output: string -> unit }

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
        h.zmq <- true

    h

let runtime = 
    let host = host hostEnum

    {
        host = host
        facts = []       
        ecs = new ConcurrentDictionary<int64,EuComplex>()
        bcs = new ConcurrentDictionary<string,BizComplex>()
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
                moments = new Dictionary<int64,MOMENT>() }
            runtime.bcs[code] <- bc

            Some bc
        else
            None
        



