﻿module BizLogics.Api

open System
open System.Text
open System.Collections.Generic
open System.Threading

open Util.ADT
open Util.Text
open Util.Json
open Util.HttpClient

open Shared.OrmTypes
open Shared.Types

open UtilWebServer.Db
open UtilWebServer.Api
open UtilWebServer.Json
open UtilWebServer.Cache

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common


let api_Public_Ping x =
    [|  ok
        ("timestamp",Json.Num (DateTime.UtcNow.Ticks.ToString()))   |]

let api_Public_ListBiz x =
    runtime.data.bcs.Values
    |> Seq.toArray
    |> Array.map(fun i -> i.biz)
    |> Array.map BIZ__json
    |> wrapOkAry

let api_Public_ListCur x =
    runtime.data.curs.Values
    |> Seq.toArray
    |> Array.map CUR__json
    |> wrapOkAry

let api_Public_ListArbitrage x =
    runtime.data.arbitrages.Values
    |> Seq.toArray
    |> Array.map ARBITRAGE__json
    |> wrapOkAry

let api_Public_CreateArbitrage (x:X) =
    
    let p = pARBITRAGE_empty()
    
    let fields = x.json |> json__items

    p.Ins <- checkfield fields "Ins" |> parse_int64
    p.Caption <- checkfield fields "Caption"

    match
        runtime.data.inss.Values
        |> Seq.tryFind(fun i -> i.ID = p.Ins) with
    | Some ins -> 
        match 
            p__createRcd p ARBITRAGE_metadata "api/public/createArbitrage" conn with
        | Some rcd -> rcd |> ARBITRAGE__json |> wrapOk "arbitrage"
        | None -> er Er.Internal
    | None -> er Er.InvalideParameter
      

let api_Public_UpdateArbitrage x =
    runtime.data.arbitrages.Values
    |> Seq.toArray
    |> Array.map ARBITRAGE__json
    |> wrapOkAry

let homepageCache = empty__CachedWithExpiry()

let api_Public_Homepage x =

    let curs = 
        runtime.data.curs.Values
        |> Seq.toArray
        |> Array.filter(fun i -> i.p.CurType = curCurTypeEnum.Crypto)
        |> Array.map CUR__json
        |> Json.Ary

    checkCache (fun _ -> 
        runtime.data.mcs.Values
        |> Seq.toArray
        |> Array.sortByDescending(fun i -> i.m.Createdat)) MomentComplex__json 20 homepageCache

    [|  ok
        ("curs",curs)
        ("mcs",homepageCache.json) |]

let api_Public_LoadMoment: X -> ApiReturn =
    tryLoadFromJsonIdWrapOK
        MomentComplex__json
        ("mc",Er.InvalideParameter)
        (fun id -> 
            if runtime.data.mcs.ContainsKey id then
                Some runtime.data.mcs[id]
            else
                None)

let branch json api = 

    match api with
    | _ -> er Er.ApiNotExists
