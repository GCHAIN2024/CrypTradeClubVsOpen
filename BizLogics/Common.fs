module BizLogics.Common

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

type Host = {
conn: string
defaultHtml: string
fsDir: string }

type BizComplex = {
biz: BIZ
moments: Dictionary<int64,MOMENT> }


type Runtime = {
host: Host
mutable facts: Fact list
bcs: ConcurrentDictionary<string,BizComplex>
zweb: ZmqWeb
output: string -> unit }

let runtime = {
    host = {
        conn = "server=127.0.0.1; user=sa; database=CTC"
        defaultHtml = "index.html"
        fsDir = @"C:\Dev\GCHAIN2024\CrypTradeClubVsOpen\Deploy" }
    facts = []       
    bcs = new ConcurrentDictionary<string,BizComplex>()
    zweb = zweb
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
        



