module MauiLogics.Types

open System.Collections.Generic

open Util.CollectionSortedAccessor

open Shared.OrmTypes
open Shared.Types

open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls
open Microsoft.Maui.Layouts

open CommunityToolkit.Maui.Views

type PlayList = {
id: int64
mutable items: pMOMENT[]
mutable Caption: string
mutable Icon:string
mutable currentIndex: int option
mutable volume: float
mutable incomingPriority: bool
mutable maxo: int option }

let empty__PlayList() = {
    id = 0L
    items = [| |]
    Caption = ""
    Icon = ""
    currentIndex = None
    volume = 0.5
    incomingPriority = true
    maxo = Some 500 }


type PlayMode = 
| Once // 单曲单次
| CycleCurrent // 单曲循环
| CyclePlayList // 列表循环
| Random // 随机

type Player = {
mediaElement: MediaElement
mutable playList : PlayList
mutable previewImgUrl : string
mutable fullText : string
mutable audioUrl : string
mutable playMode: PlayMode
}

type ItemTemplateLocation = 
| AlbumDetail
| Home

type PlayEventInvoker = 
| ButtonPrev
| ButtonNext
| CurrentAlbumChanged
| CurrentItemEnded








