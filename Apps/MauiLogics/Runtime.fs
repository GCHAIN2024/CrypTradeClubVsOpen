module MauiLogics.Runtime

open System.Collections
open System.Collections.Generic

open Util.CollectionSortedAccessor
open Util.Zmq
open Util.IA

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open MauiLogics.Common
open MauiLogics.Types
open MauiLogics.DataService


open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls
open Microsoft.Maui.Layouts

open CommunityToolkit.Maui.Views

type AlbumDeatilView = {
PreviewImg:Image
AlbumMoments:ListView
}

type HomeView = {
PlayerModel:VerticalStackLayout
PlayerLabel: Label
PlayList: ListView
 }

type Runtime = {
mutable albums: Dictionary<int64,PlayList>
player: Player 
mutable curAlbumID: int64
mutable root: AbsoluteLayout
homeView:HomeView
albumsView: CollectionView
albumDeatilView: AlbumDeatilView 
mutable homeChildren:IList<IView>
mutable albumChildren:IList<IView>
mutable albumsChildren:IList<IView>
client:IaClient<FactBroadcast> }

let runtime = {
    albums = new Dictionary<int64,PlayList>()
    player = {
        mediaElement = 
            let e = new MediaElement()
            e.ShouldShowPlaybackControls <- false
            e
        fullText = ""
        previewImgUrl = "https://ipfs.gnews.org/ipfs/QmXpDTFLYVQP4nHMPaLTXyMUzggmou6HJWa92NcFnvNWEY?filename=Component_808.png"
        audioUrl = "https://ipfs.gnews.org/ipfs/QmbVkSNwe1r1uhJv8KVJBrLhBQmHhVk63srNUHQ5oAsMCn"
        playList = empty__PlayList()
        playMode = CyclePlayList
    }
    curAlbumID = 0L
    root = new AbsoluteLayout()
    homeView = {
        PlayerModel = new VerticalStackLayout()
        PlayerLabel = new Label(Text="please choose album")
        PlayList = new ListView()}  
    albumsView = new CollectionView()
    albumDeatilView = {
        PreviewImg = new Image()
        AlbumMoments = new ListView() }
    homeChildren = new List<IView>()
    albumChildren = new List<IView>()
    albumsChildren = new List<IView>()

    client = {
        wsClient = "wss://" + server + ":" + port.ToString() |> create__WsClient 5000
        Fact__bin = FactBroadcast__bin
        bin__Fact = bin__FactBroadcast
        incomingFacts = new List<IncomingFacts<FactBroadcast>>() }
}

let applyAudioUrl (url:string) = 
    let src = 
        if url.StartsWith "ipfs://" then
            "https://ipfs.gnews.org/ipfs/" + url.Substring(7)
        else
            url
    runtime.player.audioUrl <- src
    runtime.player.mediaElement.Source <- runtime.player.audioUrl

let tryChangeCurrentAlbum runtime id = 
    if runtime.albums.ContainsKey id then

        let album = runtime.albums[id]
        runtime.curAlbumID <- album.id
        runtime.player.playList <- album

        runtime.player.playList.currentIndex <- 
            if album.items.Length > 0 then
                Some 0
            else
                None
        runtime.homeView.PlayList.ItemsSource <- runtime.player.playList.items

        true
    else
        false


let route page =

    runtime.root.Children.Clear()

    match page with
    | "abc/def" -> runtime.albumChildren
    | "asd/abc/def" -> runtime.albumsChildren
    | _ -> runtime.homeChildren
    |> Seq.iter(runtime.root.Children.Add)

    // 加入播放器，设置播放器 展开/隐藏


