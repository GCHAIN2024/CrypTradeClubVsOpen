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

// [FactMediaPlayer] Structure

let FactMediaPlayer__bin (bb:BytesBuilder) (v:FactMediaPlayer) =

    MOMENT__bin bb v.moment
    
    array__bin (int64__bin) bb v.albumIDs
    DateTime__bin bb v.serverTimestamp

let bin__FactMediaPlayer (bi:BinIndexed):FactMediaPlayer =
    let bin,index = bi

    {
        moment =
            bi
            |> bin__MOMENT
        albumIDs =
            bi
            |> bin__array (bin__int64)
        serverTimestamp =
            bi
            |> bin__DateTime
    }

let FactMediaPlayer__json (v:FactMediaPlayer) =

    [|  ("moment",MOMENT__json v.moment)
        ("albumIDs",
        array__json (int64__json) v.albumIDs)
        ("serverTimestamp",DateTime__json v.serverTimestamp)
         |]
    |> Json.Braket

let FactMediaPlayer__jsonTbw (w:TextBlockWriter) (v:FactMediaPlayer) =
    json__str w (FactMediaPlayer__json v)

let FactMediaPlayer__jsonStr (v:FactMediaPlayer) =
    (FactMediaPlayer__json v) |> json__strFinal


let json__FactMediaPlayero (json:Json):FactMediaPlayer option =
    let fields = json |> json__items

    let mutable passOptions = true

    let momento =
        match json__tryFindByName json "moment" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__MOMENTo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let albumIDso =
        match json__tryFindByName json "albumIDs" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__arrayo (json__int64o) with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let serverTimestampo =
        match json__tryFindByName json "serverTimestamp" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__DateTimeo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            moment = momento.Value
            albumIDs = albumIDso.Value
            serverTimestamp = serverTimestampo.Value} |> Some
    else
        None

// [FactBroadcast] Structure

let FactBroadcast__bin (bb:BytesBuilder) (v:FactBroadcast) =

    match v with
    | FactBroadcast.MediaPlayer v ->
        int32__bin bb 0
        FactMediaPlayer__bin bb v

let bin__FactBroadcast (bi:BinIndexed):FactBroadcast =
    let bin,index = bi

    match bin__int32 bi with
    | _ -> bin__FactMediaPlayer bi |> FactBroadcast.MediaPlayer

let FactBroadcast__json (v:FactBroadcast) =

    let items = new List<string * Json>()

    match v with
    | FactBroadcast.MediaPlayer v ->
        ("enum",int32__json 0) |> items.Add
        ("MediaPlayer",FactMediaPlayer__json v) |> items.Add

    items.ToArray() |> Json.Braket

let FactBroadcast__jsonTbw (w:TextBlockWriter) (v:FactBroadcast) =
    json__str w (FactBroadcast__json v)

let FactBroadcast__jsonStr (v:FactBroadcast) =
    (FactBroadcast__json v) |> json__strFinal


let json__FactBroadcasto (json:Json):FactBroadcast option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> 
                match json__FactMediaPlayero json with
                | Some v -> v |> FactBroadcast.MediaPlayer |> Some
                | None -> None
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

// [Er] Structure

let Er__bin (bb:BytesBuilder) (v:Er) =

    match v with
    | Er.ApiNotExists ->
        int32__bin bb 0
    | Er.InvalideParameter ->
        int32__bin bb 1
    | Er.Internal ->
        int32__bin bb 2

let bin__Er (bi:BinIndexed):Er =
    let bin,index = bi

    match bin__int32 bi with
    | 2 -> Er.Internal
    | 1 -> Er.InvalideParameter
    | _ -> Er.ApiNotExists

let Er__json (v:Er) =

    let items = new List<string * Json>()

    match v with
    | Er.ApiNotExists ->
        ("enum",int32__json 0) |> items.Add
    | Er.InvalideParameter ->
        ("enum",int32__json 1) |> items.Add
    | Er.Internal ->
        ("enum",int32__json 2) |> items.Add

    items.ToArray() |> Json.Braket

let Er__jsonTbw (w:TextBlockWriter) (v:Er) =
    json__str w (Er__json v)

let Er__jsonStr (v:Er) =
    (Er__json v) |> json__strFinal


let json__Ero (json:Json):Er option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Er.ApiNotExists |> Some
            | 1 -> Er.InvalideParameter |> Some
            | 2 -> Er.Internal |> Some
            | _ -> None
        | None -> None
    | None -> None