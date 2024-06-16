module MauiLogics.DataService

open System.Collections.Generic
open System.Text.Json

open Util.CollectionSortedAccessor
open Util.HttpClient
open Util.Json
open Util.Text
open Util.Bin
open Util.Zmq
open Util.IA

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open MauiLogics.Types
open MauiLogics.Common

let mutable remoteUrl = "https://" + server + "/api"

let album__playlist (album:Album) = 
    {
        id = album.sbl.ID
        items = album.items.ToArray() |> Array.map(fun i -> i.p)
        Caption = album.sbl.p.Caption
        Icon = album.sbl.p.Icon
        currentIndex = 
            if album.items.Count > 0 then
                Some 0
            else
                None
        volume = 0.5
        incomingPriority = true
        maxo = Some 500 }

let apiCall api postdata = 
    
    let apiUrl = remoteUrl + api
    try
        // 发送 POST 请求
        let (suc,res) =  HttpPost apiUrl postdata "application/json" 
        if suc then
            res 
        else
            res
    with
    | ex -> "Error: " + ex.Message 


let id__loadAlbumList id = 
    match
        apiCall "/public/albumList" ("{lpp: 200,\"Enduser\":" + id.ToString() + "}")
        |> str__root
        |> json__arySomeItems json__SBLo "list" with
    | Some items ->
        items
        |> Array.sortBy(fun i -> i.Sort)
        |> Array.map(fun i -> {
            sbl = i
            items = new List<MOMENT>() }) 
        |> Array.map album__playlist
        |> Some
    | None -> None
        




     