module MauiLogics.Album

open Util.Json

open MauiLogics.Common
open MauiLogics.DataService
open MauiLogics.Types
open MauiLogics.Player
open MauiLogics.Runtime

open Shared.OrmTypes
open Shared.CustomMor

open System
open System.Collections.Generic

open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls
open Microsoft.Maui.Layouts

open Shared.Types


// "➕"
let templatePlaylistBuilder  = 
    DataTemplate(
        Func<obj>(fun _ ->
            let img = Image( WidthRequest = 50.0, HeightRequest = 50.0, Aspect = Aspect.AspectFill)
            img.SetBinding(Image.SourceProperty, "PreviewImgUrl")

            let label = Label( HorizontalOptions = LayoutOptions.StartAndExpand, VerticalOptions = LayoutOptions.Center, LineBreakMode = LineBreakMode.TailTruncation)

            label.SetBinding(Label.TextProperty, "Fulltext")

            let addButton = Button( Text = "P", WidthRequest = 50.0, HeightRequest = 50.0, Margin = Thickness(5.0) )

            let addBtnClickedHandler (sender : obj) (args : EventArgs) =
               ()

            addButton.Clicked.AddHandler(new EventHandler(addBtnClickedHandler))  

            let stackLayout = StackLayout(
                Orientation = StackOrientation.Horizontal,
                Padding = Thickness(10.0),
                HorizontalOptions = LayoutOptions.FillAndExpand
                )
            
            stackLayout.Children.Add(img)
            stackLayout.Children.Add(label)
            //stackLayout.Children.Add(addButton)
            let viewCell = ViewCell()
            viewCell.View <- stackLayout
            viewCell
        )
    )

let templateItemBuilder (h:Action) =
    let grid = Grid()
    grid.RowDefinitions.Add(RowDefinition(Height = GridLength.Auto))
    grid.RowDefinitions.Add(RowDefinition(Height = GridLength.Auto))

    let frame = Frame(
        WidthRequest = 100.0,
        HeightRequest = 100.0,
        CornerRadius = 5.0f,
        Padding = Thickness(0.0),
        HorizontalOptions = LayoutOptions.Center
    )

    let image = Image()
    image.SetBinding(Image.SourceProperty, "Icon")
    image.Aspect <- Aspect.AspectFill
    image.HorizontalOptions <- LayoutOptions.Fill
    image.VerticalOptions <- LayoutOptions.Fill

    let tapGestureRecognizer = TapGestureRecognizer()
    tapGestureRecognizer.Tapped.Add(fun args ->
        match args with
        | :? TappedEventArgs as tappedEventArgs ->
            let parameter = tappedEventArgs.Parameter
            match parameter with
            | :? int64 as id ->
                if tryChangeCurrentAlbum runtime id then
                    h.Invoke()
            | _ ->()
        | _ -> ()
    )
            
    tapGestureRecognizer.SetBinding(TapGestureRecognizer.CommandParameterProperty,"id")
    image.GestureRecognizers.Add(tapGestureRecognizer)

    frame.Content <- image

    Grid.SetRow(frame, 0)
    grid.Children.Add(frame)

    let label = Label()
    label.SetBinding(Label.TextProperty, "Caption")
    label.HorizontalTextAlignment <- TextAlignment.Center

    Grid.SetRow(label, 1)
    grid.Children.Add(label)

    grid

let fun__DataTemplate f = DataTemplate(Func<obj> (fun _ -> f))

let renderAlbumDetail (album:PlayList) = 
    
    let albumView = runtime.albumDeatilView

    let previewImg = albumView.PreviewImg
    let albumMoments = albumView.AlbumMoments

    let frame = Frame( WidthRequest = 200.0, HeightRequest = 200.0, CornerRadius = 5.0f, Padding = Thickness(0.0), HorizontalOptions = LayoutOptions.Center)

    previewImg.Source <- album.Icon
    previewImg.Aspect <- Aspect.AspectFill
    previewImg.HorizontalOptions <- LayoutOptions.Fill
    previewImg.VerticalOptions <- LayoutOptions.Fill

    albumMoments.ItemsSource <- album.items

    albumMoments.ItemTemplate <- templatePlaylistBuilder

    let children = runtime.albumChildren
    frame |> Common.appendControl children |> ignore
    albumMoments |> Common.appendControl children |> ignore

let reloadAllAlbums (children:IList<IView>) (h:Action)=
    
    runtime.albumsChildren <- children
    
    match
        DataService.id__loadAlbumList 0L with
    | Some items -> 

        runtime.albums <- 
            items 
            |> Util.Collection.array__dict (fun i -> i.id)

        if runtime.curAlbumID = 0L && items.Length > 0 then
            tryChangeCurrentAlbum runtime items[0].id
            |> ignore

        let v = runtime.albumsView

        v.ItemsSource <- 
            runtime.albums.Values 
            |> Seq.toArray

        v.ItemsLayout <- GridItemsLayout(2, ItemsLayoutOrientation.Vertical)

        v.ItemTemplate <- 
            templateItemBuilder h
            |> fun__DataTemplate

        children.Clear()
        v |> Common.appendControl children |> ignore

    | None -> ()
 
let reloadAlbum (children:IList<IView>) = 

    if runtime.albums.ContainsKey runtime.curAlbumID then

        let album = runtime.albums[runtime.curAlbumID]

        runtime.albumChildren <- children

        match 
            [|  "{\"id\":"
                album.id.ToString()
                "}" |]
            |> String.Concat
            |> apiCall "/public/albumLoad"  
            |> str__root
            |> json__Albumo with
        | Some found ->
            album.items <- 
                found.items.ToArray() 
                |> Array.map(fun i -> i.p)
                |> Array.filter(fun p -> p.AudioUrl.Length > 0)
            album.items <-
                [|  "ipfs://QmYvaUn2xzhjFaYCscccZRfoBz7S2XrySEC11wsTaSSphY"
                    "ipfs://Qmafn8uPNbQj4jkYzwvxG6AtMWAVcZwgYANzch45FU73Uq"
                    "ipfs://QmQfNggYA3jbdB7MWjAEJX5EvoHQN3nmXk9Wrey9PEon2Q"
                    "ipfs://QmRKuVa6iX98kgxW5KeJbKEadE7hGBQjGSpAxaPW5uVMkA"|]
                |> Array.map(fun s -> 
                    let p = pMOMENT_empty()
                    p.PreviewImgUrl <- "https://ipfs.gnews.org/ipfs/QmXpDTFLYVQP4nHMPaLTXyMUzggmou6HJWa92NcFnvNWEY?filename=Component_808.png"
                    p.AudioUrl <- s
                    p)
            album.Caption <- found.sbl.p.Caption
            album.Icon <- found.sbl.p.Icon

            if runtime.curAlbumID = album.id then
                if tryChangeCurrentAlbum runtime album.id then
                    onPlayEvent PlayEventInvoker.CurrentAlbumChanged null null

            children.Clear()
            renderAlbumDetail album
        | None -> ()

let onIncomingMoment (m:MOMENT) albumID =

    if runtime.albums.ContainsKey albumID then

        let pl = runtime.albums[albumID]
        let items = new List<pMOMENT>(pl.items)

        if pl.incomingPriority && pl.currentIndex.IsSome then
            if pl.currentIndex.Value < items.Count then
                items.Insert(pl.currentIndex.Value, m.p)
            else
                items.Insert(0, m.p)
        else
            items.Insert(0, m.p)
        match pl.maxo with
        | Some max -> 
            if items.Count > max then
                items.RemoveRange(max,items.Count - max)
        | None -> ()

        pl.items <- items.ToArray()

        //renderAlbumDetail pl
