module BizLogics.ApiEu

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

let x__ec (x:X) = x.sessiono.Value.identity.Value

let api_Eu_ListMyArbitrage x =
    (x__ec x).arbitrages.Values
    |> apiList ARBITRAGE__json

let api_Eu_CreateMyArbitrage x =
    
    let ec = x__ec x
    let fields,o = apiCreate bin__pARBITRAGE x

    match
        o
        |> oPipeline (fun p -> 
            let code = checkfield fields "Ins"
            if runtime.data.ics.ContainsKey code then
                let ins = runtime.data.ics[code].ins
                p.EndUser <- ec.eu.ID
                p.Ins <- ins.ID
                p.Code <- ins.p.Code
                Some p
            else
                None) (fun _ -> None)
        |> oPipeline (fun p -> 
            if p.Stake <= 0.0 || p.Entry <= 0.0 || p.Exit <= 0.0 then
                None
            else
                Some p) (fun _ -> None) with
    | Some p -> 
        if p.Exit < p.Entry then
            p.Stake <- - p.Stake

        match 
            p__createRcd p ARBITRAGE_metadata "api/public/createArbitrage" conn with
        | Some rcd -> 
            ec.arbitrages[rcd.ID] <- rcd
            runtime.data.arbitrages[rcd.ID] <- rcd
            rcd 
            |> ARBITRAGE__json 
            |> wrapOk "arbitrage"
        | None -> er Er.Internal

    | None -> er Er.InvalideParameter

let api_Eu_UpdateMyArbitrage x =

    let ec = x__ec x

    x
    |> apiUpdate bin__ARBITRAGE
    |> oPipeline(fun rcd -> 
        if  ec.arbitrages.ContainsKey rcd.ID then
            Some rcd
        else
            None) (fun _ -> None)
    |> oPipeline (fun rcd -> 
        if 
            (rcd.ID,rcd.p)
            |> update "api/public/updateArbitrage" conn ARBITRAGE_metadata then
            runtime.data.arbitrages[rcd.ID] <- rcd
            [| ok |]
        else
            er Er.InvalideParameter)(fun _ -> er Er.InvalideParameter)

let api_Eu_ListMyFollow x =
    (x__ec x).follows.Values
    |> apiList FOLLOW__json

let api_Eu_ToggleMyFollow x =
    
    let ec = x__ec x
    let fields,o = apiCreate bin__pFOLLOW x

    match o with
    | Some p -> 
        p.EndUser <- ec.eu.ID
        match p.FollowType with
        | followFollowTypeEnum.Instrument -> 

            match
                ec.follows.Values
                |> Seq.tryFind(fun v -> v.p.FollowType = p.FollowType && v.p.Followee = p.Followee) with
            | Some rcd -> 
                
                if  "WHERE ID=" + rcd.ID.ToString()
                    |> delete "api/eu/toggleMyFollow" conn FOLLOW_metadata then
                    [| ok |]
                else
                    er Er.Internal

            | None -> 

                match 
                    p__createRcd p FOLLOW_metadata "api/eu/toggleMyFollow" conn with
                | Some rcd -> 
                    ec.follows[rcd.ID] <- rcd
                    runtime.data.follows[rcd.ID] <- rcd
                    rcd 
                    |> FOLLOW__json 
                    |> wrapOk "follow"
                | None -> er Er.Internal


        | _ -> er Er.InvalideParameter
    | None -> er Er.InvalideParameter


let api_Eu_UpdateMyFollow x =
    let ec = x__ec x

    x
    |> apiUpdate bin__FOLLOW
    |> oPipeline(fun rcd -> 
        if ec.follows.ContainsKey rcd.ID then
            Some rcd
        else
            None) (fun _ -> None)
    |> oPipeline (fun rcd -> 
        if 
            (rcd.ID,rcd.p)
            |> update "api/public/updateFollow" conn FOLLOW_metadata then
            ec.follows[rcd.ID] <- rcd
            [| ok |]
        else
            er Er.InvalideParameter)(fun _ -> er Er.InvalideParameter)
