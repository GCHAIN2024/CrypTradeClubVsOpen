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

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common


let api_Public_Ping json =
    [|  ok
        ("timestamp",Json.Num (DateTime.UtcNow.Ticks.ToString()))   |]

let api_Public_ListBiz json =
    runtime.bcs.Values
    |> Seq.toArray
    |> Array.map(fun i -> i.biz)
    |> Array.map BIZ__json
    |> wrapOkAry

let api_Public_ListCur json =
    runtime.curs.Values
    |> Seq.toArray
    |> Array.map CUR__json
    |> wrapOkAry

let api_Public_HomepageMoments json =
    runtime.moments.Values
    |> Seq.toArray
    |> Array.map MomentComplex__json
    |> wrapOkAry

let branch json api = 

    match api with
    | _ -> er Er.ApiNotExists
