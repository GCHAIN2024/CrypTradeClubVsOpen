module BizLogics.Init

open System
open System.Collections.Generic
open System.Collections.Concurrent
open System.Threading

open Util.Runtime
open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.Constants
open UtilWebServer.DbLogger
open UtilWebServer.Init

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types

open BizLogics.Common
open BizLogics.Ca
open BizLogics.Social
open BizLogics.Crawler
open BizLogics.Market

let init (runtime:Runtime) = 

    "Init ..."
    |> runtime.output

    conn <- runtime.host.conn

    dbLoggero <- 
        (fun log -> 
            let p = pLOG_empty()
            p.Content <- log.content
            p.Location <- log.location
            p.Sql <- log.sql
            p)
        |> createDbLogger LOG_metadata conn
        |> Some

    if runtime.host.updateDatabase then
        updateDbStructure runtime conn

    Shared.OrmMor.init()

    (fun (i:LANG) -> runtime.data.langs[i.p.Code2] <- i)
    |> loadAll runtime.output conn LANG_metadata

    freqLangCodes
    |> Array.iter(fun code ->
        if runtime.data.langs.ContainsKey code = false then
            match createLang code with
            | Some lang -> runtime.data.langs[code] <- lang
            | None -> halt runtime.output ("BizLogics.Init.createLang [" + code + "]") "")


    (fun (i:CUR) -> runtime.data.curs[i.p.Code] <- i)
    |> loadAll runtime.output conn CUR_metadata

    freqCurCodes
    |> Array.iter(fun code ->
        if runtime.data.curs.ContainsKey code = false then
            match createCur code with
            | Some cur -> runtime.data.curs[code] <- cur
            | None -> halt runtime.output ("BizLogics.Init.createCur [" + code + "]") "")

    runtime.data.curs["USD"].p.AnchorRate <- 1.0

    (fun (i:INS) -> runtime.data.ics[i.p.Code] <- {
        follows = new Dictionary<int64,FOLLOW>()
        ins = i })
    |> loadAll runtime.output conn INS_metadata

    (fun (i:EU) -> runtime.users[i.ID] <- { 
        arbitrages = new Dictionary<int64,ARBITRAGE>()
        follows = new Dictionary<int64,FOLLOW>()
        eu = i })
    |> loadAll runtime.output conn EU_metadata

    (fun (i:BIZ) -> 
        runtime.data.bcs[i.p.Code] <- {
            biz = i
            mcs = new Dictionary<int64,MomentComplex>() })
    |> loadAll runtime.output conn BIZ_metadata

    freqBizCodes
    |> Array.iter(fun code ->
        if runtime.data.bcs.ContainsKey code = false then
            match createBiz code with
            | Some biz -> 
                runtime.data.bcs[code] <- 
                    {   
                        biz = biz
                        mcs = new Dictionary<int64,MomentComplex>() }
            | None -> halt runtime.output ("BizLogics.Init.createBiz [" + code + "]") "")

    loadAllBulk<pMOMENT> runtime.output conn MOMENT_metadata
    |> Array.iter(fun m -> 

        let mc = { 
            m = m }
        runtime.data.mcs[m.ID] <- mc

        if m.p.BindType = momentBindTypeEnum.Biz then
            match runtime__id__bc runtime.data m.p.Bind with
            | Some bc -> bc.mcs[m.ID] <- mc
            | None -> ())

    (fun (i:ARBITRAGE) -> runtime.data.arbitrages[i.ID] <- i)
    |> loadAll runtime.output conn ARBITRAGE_metadata

    loadAllBulk<pFOLLOW> runtime.output conn FOLLOW_metadata
    |> Array.iter(fun i -> 

        match i.p.FollowType with
        | followFollowTypeEnum.Instrument -> 
            let ic = 
                runtime.data.ics.Values 
                |> Seq.find(fun ii -> ii.ins.ID = i.p.Followee)
            ic.follows.Add(i.ID,i)
        | _ -> ()

        let ec = runtime.users[i.p.EndUser]
        ec.follows.Add(i.ID,i)

        runtime.data.follows[i.ID] <- i)

    (fun (i:ARBITRAGE) -> 
        runtime.users[i.p.EndUser].arbitrages.Add(i.ID,i)
        runtime.data.arbitrages[i.ID] <- i)
    |> loadAll runtime.output conn ARBITRAGE_metadata

    //runtime.facts

    launchMarketCrawlers runtime            
    launchNewsCrawlers runtime            




