module MauiLogics.Home

open System
open System.Collections.Generic

open Util.Zmq
open Util.IA

open Shared.OrmTypes
open Shared.Types

open MauiLogics.Types
open MauiLogics.Runtime
open MauiLogics.Player
open MauiLogics.Album

open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls
open Microsoft.Maui.Layouts
open CommunityToolkit.Maui.Views
open CommunityToolkit.Maui.Core.Primitives


let initHome (children:IList<IView>) =
    
    Util.Concurrent.asyncCyclerInterval 300 (fun _ ->
        Device.BeginInvokeOnMainThread(fun _ -> 
            let e = runtime.player.mediaElement
            if e.CurrentState = MediaElementState.Playing then
                (e.Duration.Subtract e.Position).TotalSeconds.ToString("0.00") + " s " |> output
                if (e.Duration.Subtract e.Position).TotalSeconds < 1.0 then
                //if e.Position.Ticks >= e.Duration.Ticks then
                    onPlayEvent PlayEventInvoker.CurrentItemEnded null null))


    runtime.homeChildren <- children

    let playerModel = createPlayerUI ItemTemplateLocation.Home
    let playerLabel = runtime.homeView.PlayerLabel
    let playList = runtime.homeView.PlayList

    playList.ItemsSource <- runtime.player.playList.items

    //let itemTemplate = templatePlaylistBuilder


    playList.ItemTemplate <- templatePlaylistBuilder
        //ItemTemplateLocation.Home
        //|> templateAlbumBuilder
        //|> fun__DataTemplate



    AbsoluteLayout.SetLayoutFlags(playerModel, AbsoluteLayoutFlags.All)
    AbsoluteLayout.SetLayoutBounds(playerModel, Rect(0.0, 0.0, 1.0, 0.4))
    
    AbsoluteLayout.SetLayoutFlags(playerLabel, AbsoluteLayoutFlags.All)
    AbsoluteLayout.SetLayoutBounds(playerLabel, Rect(0.4,0.4, 1.0, 0.1))

    AbsoluteLayout.SetLayoutFlags(playList, AbsoluteLayoutFlags.All)
    AbsoluteLayout.SetLayoutBounds(playList, Rect(0.5, 0.5, 1.0, 0.5))

    playerModel |> Common.appendControl runtime.homeChildren |> ignore
    playerLabel |> Common.appendControl runtime.homeChildren |> ignore
    playList |> Common.appendControl runtime.homeChildren |> ignore
