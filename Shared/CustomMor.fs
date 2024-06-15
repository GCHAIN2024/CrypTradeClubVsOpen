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

// [Error] Structure

let Error__bin (bb:BytesBuilder) (v:Error) =

    match v with
    | Error.InvalideParameter ->
        int32__bin bb 0
    | Error.Internal ->
        int32__bin bb 1

let bin__Error (bi:BinIndexed):Error =
    let bin,index = bi

    match bin__int32 bi with
    | 1 -> Error.Internal
    | _ -> Error.InvalideParameter

let Error__json (v:Error) =

    let items = new List<string * Json>()

    match v with
    | Error.InvalideParameter ->
        ("enum",int32__json 0) |> items.Add
    | Error.Internal ->
        ("enum",int32__json 1) |> items.Add

    items.ToArray() |> Json.Braket

let Error__jsonTbw (w:TextBlockWriter) (v:Error) =
    json__str w (Error__json v)

let Error__jsonStr (v:Error) =
    (Error__json v) |> json__strFinal


let json__Erroro (json:Json):Error option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Error.InvalideParameter |> Some
            | 1 -> Error.Internal |> Some
            | _ -> None
        | None -> None
    | None -> None

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