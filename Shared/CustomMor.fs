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

// [pMomentExt] Structure

let pMomentExt__bin (bb:BytesBuilder) (v:pMomentExt) =

    pMOMENT__bin bb v.p
    str__bin bb v.MarkdownA
    str__bin bb v.MarkdownB

let bin__pMomentExt (bi:BinIndexed):pMomentExt =
    let bin,index = bi

    {
        p =
            bi
            |> bin__pMOMENT
        MarkdownA =
            bi
            |> bin__str
        MarkdownB =
            bi
            |> bin__str
    }

let pMomentExt__json (v:pMomentExt) =

    [|  ("p",pMOMENT__json v.p)
        ("MarkdownA",str__json v.MarkdownA)
        ("MarkdownB",str__json v.MarkdownB)
         |]
    |> Json.Braket

let pMomentExt__jsonTbw (w:TextBlockWriter) (v:pMomentExt) =
    json__str w (pMomentExt__json v)

let pMomentExt__jsonStr (v:pMomentExt) =
    (pMomentExt__json v) |> json__strFinal


let json__pMomentExto (json:Json):pMomentExt option =
    let fields = json |> json__items

    let mutable passOptions = true

    let po =
        match json__tryFindByName json "p" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__pMOMENTo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let MarkdownAo =
        match json__tryFindByName json "MarkdownA" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__stro with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let MarkdownBo =
        match json__tryFindByName json "MarkdownB" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__stro with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            p = po.Value
            MarkdownA = MarkdownAo.Value
            MarkdownB = MarkdownBo.Value} |> Some
    else
        None

// [Album] Structure

let Album__bin (bb:BytesBuilder) (v:Album) =

    SBL__bin bb v.sbl
    
    List__bin (MOMENT__bin) bb v.items

let bin__Album (bi:BinIndexed):Album =
    let bin,index = bi

    {
        sbl =
            bi
            |> bin__SBL
        items =
            bi
            |> bin__List (bin__MOMENT)
    }

let Album__json (v:Album) =

    [|  ("sbl",SBL__json v.sbl)
        ("items",
        List__json (MOMENT__json) v.items)
         |]
    |> Json.Braket

let Album__jsonTbw (w:TextBlockWriter) (v:Album) =
    json__str w (Album__json v)

let Album__jsonStr (v:Album) =
    (Album__json v) |> json__strFinal


let json__Albumo (json:Json):Album option =
    let fields = json |> json__items

    let mutable passOptions = true

    let sblo =
        match json__tryFindByName json "sbl" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__SBLo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let itemso =
        match json__tryFindByName json "items" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__Listo (json__MOMENTo) with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            sbl = sblo.Value
            items = itemso.Value} |> Some
    else
        None

// [Error] Structure

let Error__bin (bb:BytesBuilder) (v:Error) =

    match v with
    | Error.ApiNotExists ->
        int32__bin bb 0
    | Error.InvalideParameter ->
        int32__bin bb 1
    | Error.Internal ->
        int32__bin bb 2

let bin__Error (bi:BinIndexed):Error =
    let bin,index = bi

    match bin__int32 bi with
    | 2 -> Error.Internal
    | 1 -> Error.InvalideParameter
    | _ -> Error.ApiNotExists

let Error__json (v:Error) =

    let items = new List<string * Json>()

    match v with
    | Error.ApiNotExists ->
        ("enum",int32__json 0) |> items.Add
    | Error.InvalideParameter ->
        ("enum",int32__json 1) |> items.Add
    | Error.Internal ->
        ("enum",int32__json 2) |> items.Add

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
            | 0 -> Error.ApiNotExists |> Some
            | 1 -> Error.InvalideParameter |> Some
            | 2 -> Error.Internal |> Some
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

// [Msg] Structure

let Msg__bin (bb:BytesBuilder) (v:Msg) =

    match v with
    | Msg.Heartbeat ->
        int32__bin bb 0
    | Msg.ApiRequest v ->
        int32__bin bb 1
        json__bin bb v
    | Msg.ApiResponse v ->
        int32__bin bb 2
        json__bin bb v
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
    | 2 -> bin__json bi |> Msg.ApiResponse
    | 1 -> bin__json bi |> Msg.ApiRequest
    | _ -> Msg.Heartbeat

let Msg__json (v:Msg) =

    let items = new List<string * Json>()

    match v with
    | Msg.Heartbeat ->
        ("enum",int32__json 0) |> items.Add
    | Msg.ApiRequest v ->
        ("enum",int32__json 1) |> items.Add
        ("ApiRequest", v) |> items.Add
    | Msg.ApiResponse v ->
        ("enum",int32__json 2) |> items.Add
        ("ApiResponse", v) |> items.Add
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
                match Some json with
                | Some v -> v |> Msg.ApiRequest |> Some
                | None -> None
            | 2 -> 
                match Some json with
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