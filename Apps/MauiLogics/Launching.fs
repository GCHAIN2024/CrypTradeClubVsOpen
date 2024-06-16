module MauiLogics.Launching

open System

open Util.Json
open Util.Text
open Util.Zmq
open Util.IA

open Shared.OrmTypes
open Shared.Types
open Shared.CustomMor

open MauiLogics.Common
open MauiLogics.DataService
open MauiLogics.Runtime
open MauiLogics.Player


let init() = 
    
    connect runtime.client

    runtime.client.incomingFacts.Add(fun facts -> 

        facts
        |> Array.iter(fun f -> 
        
            match f with
            | FactBroadcast.MediaPlayer f -> 

                [|  f.moment.p.AudioUrl 
                    " --- "
                    f.moment.p.Fulltext |]
                |> String.Concat
                |> output

                if f.moment.p.AudioUrl.Length > 0 then
                    f.albumIDs
                    |> Array.iter(MauiLogics.Album.onIncomingMoment f.moment)

            | _ -> ()))
