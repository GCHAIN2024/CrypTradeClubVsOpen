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

// [MomentComplex] Structure

let MomentComplex__bin (bb:BytesBuilder) (v:MomentComplex) =

    MOMENT__bin bb v.m

let bin__MomentComplex (bi:BinIndexed):MomentComplex =
    let bin,index = bi

    {
        m =
            bi
            |> bin__MOMENT
    }

let MomentComplex__json (v:MomentComplex) =

    [|  ("m",MOMENT__json v.m)
         |]
    |> Json.Braket

let MomentComplex__jsonTbw (w:TextBlockWriter) (v:MomentComplex) =
    json__str w (MomentComplex__json v)

let MomentComplex__jsonStr (v:MomentComplex) =
    (MomentComplex__json v) |> json__strFinal


let json__MomentComplexo (json:Json):MomentComplex option =
    let fields = json |> json__items

    let mutable passOptions = true

    let mo =
        match json__tryFindByName json "m" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__MOMENTo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            m = mo.Value} |> Some
    else
        None

// [EuComplex] Structure

let EuComplex__bin (bb:BytesBuilder) (v:EuComplex) =

    EU__bin bb v.eu

let bin__EuComplex (bi:BinIndexed):EuComplex =
    let bin,index = bi

    {
        eu =
            bi
            |> bin__EU
    }

let EuComplex__json (v:EuComplex) =

    [|  ("eu",EU__json v.eu)
         |]
    |> Json.Braket

let EuComplex__jsonTbw (w:TextBlockWriter) (v:EuComplex) =
    json__str w (EuComplex__json v)

let EuComplex__jsonStr (v:EuComplex) =
    (EuComplex__json v) |> json__strFinal


let json__EuComplexo (json:Json):EuComplex option =
    let fields = json |> json__items

    let mutable passOptions = true

    let euo =
        match json__tryFindByName json "eu" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__EUo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            eu = euo.Value} |> Some
    else
        None

// [BizComplex] Structure

let BizComplex__bin (bb:BytesBuilder) (v:BizComplex) =

    BIZ__bin bb v.biz
    Dictionary__bin (int64__bin) (MomentComplex__bin) bb v.mcs

let bin__BizComplex (bi:BinIndexed):BizComplex =
    let bin,index = bi

    {
        biz =
            bi
            |> bin__BIZ
        mcs =
            bi
            |> (fun bi ->
                let v = new Dictionary<int64,MomentComplex>()
                bin__Dictionary (bin__int64) (bin__MomentComplex) v bi
                v)
    }

let BizComplex__json (v:BizComplex) =

    [|  ("biz",BIZ__json v.biz)
        ("moments",Dictionary__json (int64__json) (MomentComplex__json) v.mcs)
         |]
    |> Json.Braket

let BizComplex__jsonTbw (w:TextBlockWriter) (v:BizComplex) =
    json__str w (BizComplex__json v)

let BizComplex__jsonStr (v:BizComplex) =
    (BizComplex__json v) |> json__strFinal


let json__BizComplexo (json:Json):BizComplex option =
    let fields = json |> json__items

    let mutable passOptions = true

    let bizo =
        match json__tryFindByName json "biz" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__BIZo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let momentso =
        match json__tryFindByName json "moments" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> (fun json ->
                json__Dictionaryo (json__int64o) (json__MomentComplexo) (new Dictionary<int64,MomentComplex>()) json) with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            biz = bizo.Value
            mcs = momentso.Value} |> Some
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
    | Er.Unauthorized ->
        int32__bin bb 2
    | Er.Internal ->
        int32__bin bb 3

let bin__Er (bi:BinIndexed):Er =
    let bin,index = bi

    match bin__int32 bi with
    | 3 -> Er.Internal
    | 2 -> Er.Unauthorized
    | 1 -> Er.InvalideParameter
    | _ -> Er.ApiNotExists

let Er__json (v:Er) =

    let items = new List<string * Json>()

    match v with
    | Er.ApiNotExists ->
        ("enum",int32__json 0) |> items.Add
    | Er.InvalideParameter ->
        ("enum",int32__json 1) |> items.Add
    | Er.Unauthorized ->
        ("enum",int32__json 2) |> items.Add
    | Er.Internal ->
        ("enum",int32__json 3) |> items.Add

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
            | 2 -> Er.Unauthorized |> Some
            | 3 -> Er.Internal |> Some
            | _ -> None
        | None -> None
    | None -> None