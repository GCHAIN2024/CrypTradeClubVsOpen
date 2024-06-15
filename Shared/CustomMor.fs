module Shared.CustomMor

open LanguagePrimitives

open System
open System.Collections.Generic
open System.Text

open Util.Cat
open Util.Perf
open Util.Measures
open Util.Db
open Util.DbQuery
open Util.DbTx
open Util.Bin
open Util.Text
open Util.Json
open Util.Orm

open PreOrm

open Util.Bin
open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

// [Fact] Structure

let Fact__bin (bb:BytesBuilder) (v:Fact) =

    match v with
    | Fact.Moment v ->
        int32__bin bb 0
        MOMENT__bin bb v

let bin__Fact (bi:BinIndexed):Fact =
    let bin,index = bi

    match bin__int32 bi with
    | _ -> bin__MOMENT bi |> Fact.Moment

let Fact__json (v:Fact) =

    let items = new List<string * Json>()

    match v with
    | Fact.Moment v ->
        ("enum",int32__json 0) |> items.Add
        ("Moment",MOMENT__json v) |> items.Add

    items.ToArray() |> Json.Braket

let Fact__jsonTbw (w:TextBlockWriter) (v:Fact) =
    json__str w (Fact__json v)

let Fact__jsonStr (v:Fact) =
    (Fact__json v) |> json__strFinal


let json__Facto (json:Json):Fact option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> 
                match json__MOMENTo json with
                | Some v -> v |> Fact.Moment |> Some
                | None -> None
            | _ -> None
        | None -> None
    | None -> None

// [Api] Structure

let Api__bin (bb:BytesBuilder) (v:Api) =

    match v with
    | Api.Signup ->
        int32__bin bb 0

let bin__Api (bi:BinIndexed):Api =
    let bin,index = bi

    match bin__int32 bi with
    | _ -> Api.Signup

let Api__json (v:Api) =

    let items = new List<string * Json>()

    match v with
    | Api.Signup ->
        ("enum",int32__json 0) |> items.Add

    items.ToArray() |> Json.Braket

let Api__jsonTbw (w:TextBlockWriter) (v:Api) =
    json__str w (Api__json v)

let Api__jsonStr (v:Api) =
    (Api__json v) |> json__strFinal


let json__Apio (json:Json):Api option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Api.Signup |> Some
            | _ -> None
        | None -> None
    | None -> None

// [Msg] Structure

let Msg__bin (bb:BytesBuilder) (v:Msg) =

    match v with
    | Msg.Heartbeat ->
        int32__bin bb 0
    | Msg.ApiRequest v ->
        int32__bin bb 1
        Api__bin bb v
    | Msg.ApiResponse v ->
        int32__bin bb 2
        Api__bin bb v
    | Msg.SingleFact v ->
        int32__bin bb 3
        Fact__bin bb v
    | Msg.MultiFact v ->
        int32__bin bb 4
        
        array__bin (Fact__bin) bb v

let bin__Msg (bi:BinIndexed):Msg =
    let bin,index = bi

    match bin__int32 bi with
    | 4 -> bin__array (bin__Fact) bi |> Msg.MultiFact
    | 3 -> bin__Fact bi |> Msg.SingleFact
    | 2 -> bin__Api bi |> Msg.ApiResponse
    | 1 -> bin__Api bi |> Msg.ApiRequest
    | _ -> Msg.Heartbeat

let Msg__json (v:Msg) =

    let items = new List<string * Json>()

    match v with
    | Msg.Heartbeat ->
        ("enum",int32__json 0) |> items.Add
    | Msg.ApiRequest v ->
        ("enum",int32__json 1) |> items.Add
        ("ApiRequest",Api__json v) |> items.Add
    | Msg.ApiResponse v ->
        ("enum",int32__json 2) |> items.Add
        ("ApiResponse",Api__json v) |> items.Add
    | Msg.SingleFact v ->
        ("enum",int32__json 3) |> items.Add
        ("SingleFact",Fact__json v) |> items.Add
    | Msg.MultiFact v ->
        ("enum",int32__json 4) |> items.Add
        ("MultiFact",
        array__json (Fact__json) v) |> items.Add

    items.ToArray() |> Json.Braket

let Msg__jsonTbw (w:TextBlockWriter) (v:Msg) =
    json__str w (Msg__json v)

let Msg__jsonStr (v:Msg) =
    (Msg__json v) |> json__strFinal


let json__Msgo (json:Json):Msg option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Msg.Heartbeat |> Some
            | 1 -> 
                match json__Apio json with
                | Some v -> v |> Msg.ApiRequest |> Some
                | None -> None
            | 2 -> 
                match json__Apio json with
                | Some v -> v |> Msg.ApiResponse |> Some
                | None -> None
            | 3 -> 
                match json__Facto json with
                | Some v -> v |> Msg.SingleFact |> Some
                | None -> None
            | 4 -> 
                match json__arrayo (json__Facto) json with
                | Some v -> v |> Msg.MultiFact |> Some
                | None -> None
            | _ -> None
        | None -> None
    | None -> None