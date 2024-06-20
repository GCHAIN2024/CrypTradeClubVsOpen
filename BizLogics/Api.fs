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
    let list = 
        runtime.bcs.Values
        |> Seq.toArray
        |> Array.map(fun i -> i.biz)
        |> Array.map BIZ__json
        |> Json.Ary
    
    [|  ok
        ("list",list)   |]

let api_Public_ListCur json =
    let list = 
        runtime.curs.Values
        |> Seq.toArray
        |> Array.map CUR__json
        |> Json.Ary
    
    [|  ok
        ("list",list)   |]

let api_Public_HomepageMoments json =
    let list = 
        runtime.moments.Values
        |> Seq.toArray
        |> Array.map MomentComplex__json
        |> Json.Ary
    
    [|  ok
        ("list",list)   |]

let branch json api = 

    match api with
    | _ -> [|  er Er.ApiNotExists   |]
