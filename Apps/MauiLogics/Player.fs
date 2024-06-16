module MauiLogics.Player

open MauiLogics.Types
open MauiLogics.Common

open System
open System.Collections.Generic

open Util.Bin
open Util.Json
open Util.Text

open UtilMaui.Layout

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open MauiLogics.Common
open MauiLogics.DataService
open MauiLogics.Types
open MauiLogics.PlayList

open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls
open Microsoft.Maui.Layouts

open CommunityToolkit.Maui.Views
open CommunityToolkit.Maui.Core.Primitives

type ButtonSet = {
toggle:Button
prev:Button
next:Button
layout:StackLayout }

let runtime = Runtime.runtime

let playPrevNext prevOrNext = 

    let playList = Runtime.runtime.player.playList
    let playMode = Runtime.runtime.player.playMode

    if playList.items.Length = 0 then
        None
    else
        match playMode with
        | Once -> 
            match playList.currentIndex with
            | Some i ->
                if i < playList.items.Length - 1 then
                    let index = i + 1
                    playList.currentIndex <- index |> Some
                    Some(index,playList.items[index])
                else
                    None
            | None -> 
                playList.currentIndex <- 0 |> Some
                Some(0,playList.items[0])

        | CycleCurrent ->
            match playList.currentIndex with
            | Some i -> 
                let index = i
                playList.currentIndex <- index |> Some
                Some(index,playList.items[index])
            | None -> None

        | CyclePlayList -> 
            match playList.currentIndex with
            | Some i ->
                let index = 
                    if i < playList.items.Length - 1 then
                        i + 1
                    else
                        0
                playList.currentIndex <- index |> Some
                Some(index,playList.items[index])
            | None -> 
                playList.currentIndex <- 0 |> Some
                Some(0,playList.items[0])

        | Random -> 
            if playList.items.Length > 0 then
                let index = [| 0 .. playList.items.Length |] |> Util.Prob.array__rand
                playList.currentIndex <- index |> Some
                Some(index,playList.items[index])
            else
                None

let mediaElement = Runtime.runtime.player.mediaElement

let onPlayEvent invoker (sender : obj) (args : EventArgs) =
    match
        match invoker with
        | ButtonPrev -> true
        | ButtonNext -> false
        | CurrentItemEnded -> 
            false
        | CurrentAlbumChanged -> false
        |> playPrevNext with
    | Some (index,item) -> 
        runtime.player.playList.currentIndex <- Some index
        runtime.player.audioUrl <- item.AudioUrl
        [|  "Loading: "
            item.AudioUrl |]
        |> String.Concat
        |> output

        Runtime.applyAudioUrl runtime.player.audioUrl

        try
            if mediaElement.Duration.Ticks > 0L then
                runtime.homeView.PlayerLabel.Text <- item.AudioUrl
                mediaElement.Play()

        with
        | _ -> 
            [|  "Invalide AudioUrl: "
                item.AudioUrl |]
            |> String.Concat
            |> output
    | _ -> ()

let renderButtonSet loc = 


   

    let toggle = Button(Text = "▶️",FontSize = 30,BackgroundColor = Colors.Transparent, AutomationId="play" )  //⏸️
    let prev = Button(Text = "⏮️",FontSize = 30,BackgroundColor = Colors.Transparent, AutomationId="last")
    let next = Button(Text = "⏭️",FontSize = 30,BackgroundColor = Colors.Transparent, AutomationId="next")

    let toggleBtnClickedHandler (sender : obj) (args : EventArgs) =
        match mediaElement.CurrentState with
        | MediaElementState.Playing -> 
            toggle.Text <- "▶️"
            mediaElement.Pause()
        | _ -> 
            toggle.Text <- "⏸️"
            mediaElement.Play()

    let layout = StackLayout( Orientation = StackOrientation.Horizontal, HorizontalOptions = LayoutOptions.CenterAndExpand, Spacing = 10.0)

    layout.Children.Add(prev)
    layout.Children.Add(toggle)
    layout.Children.Add(next)

    let buttons = {
        toggle = toggle
        prev = prev
        next = next
        layout = layout }
    
    toggle.Clicked.AddHandler(new EventHandler(toggleBtnClickedHandler))
    prev.Clicked.AddHandler(new EventHandler(onPlayEvent PlayEventInvoker.ButtonPrev))
    next.Clicked.AddHandler(new EventHandler(onPlayEvent PlayEventInvoker.ButtonNext))

    buttons

let createPlayerUI loc = 

    let image = Image(Source = "")
    
    image.Source <- runtime.player.previewImgUrl
    let buttons = renderButtonSet loc

    Runtime.applyAudioUrl runtime.player.audioUrl
    mediaElement.MediaEnded.Add(fun e -> 
        onPlayEvent PlayEventInvoker.CurrentItemEnded null null)
    let frame = Frame( WidthRequest = 240.0, HeightRequest = 240.0, CornerRadius = 5.0f, Padding = Thickness(0.0),  HorizontalOptions = LayoutOptions.Center,  Content = image)

    let verticalStackLayout =  StackLayout( Spacing = 10.0, VerticalOptions = LayoutOptions.CenterAndExpand )

    

    verticalStackLayout.Add frame
    verticalStackLayout.Add(buttons.layout)
    verticalStackLayout.Add mediaElement

    let stackLayout = StackLayout( Orientation = StackOrientation.Vertical, Spacing = 10.0, Padding = Thickness(10.0))
    stackLayout.Children.Add verticalStackLayout

    stackLayout


