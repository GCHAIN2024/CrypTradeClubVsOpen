﻿module BizLogics.ApiPublic

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
    |> Seq.map(fun i -> i.biz)
    |> apiList BIZ__json

let api_Public_ListCur x =
    runtime.data.curs.Values
    |> apiList CUR__json

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
        ("mcs",homepageCache.cachedJson) |]

let api_Public_LoadMoment: X -> ApiReturn =
    tryLoadFromJsonIdWrapOK
        MomentComplex__json
        ("mc",Er.InvalideParameter)
        (fun id -> 
            if runtime.data.mcs.ContainsKey id then
                Some runtime.data.mcs[id]
            else
                None)
