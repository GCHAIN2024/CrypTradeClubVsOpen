module BizLogics.Api

open System
open System.Text
open System.Collections.Generic
open System.Threading

open Util.Text
open Util.Json
open Util.HttpClient

open Shared.OrmTypes
open Shared.Types

open UtilWebServer.Api
open UtilWebServer.Json

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

let api_Public_Homepage x =

    let curs = 
        runtime.data.curs.Values
        |> Seq.toArray
        |> Array.filter(fun i -> i.p.CurType = curCurTypeEnum.Crypto)
        |> Array.map CUR__json
        |> Json.Ary

    let mcs = 
        runtime.data.mcs.Values
        |> Seq.toArray
        |> Array.sortByDescending(fun i -> i.m.Createdat)
        |> Array.map MomentComplex__json
        |> Json.Ary

    [|  ok
        ("curs",curs)
        ("mcs",mcs) |]

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
