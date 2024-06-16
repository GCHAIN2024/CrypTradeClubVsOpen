module MauiLogics.PlayList

open System
open System.Collections.Generic

open UtilMaui.Layout

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open MauiLogics.Common
open MauiLogics.DataService
open MauiLogics.Types

open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls
open Microsoft.Maui.Layouts


type PlayListView =

    struct
        val data: PlayList
        val view: ListView
        val buttonHandler: List<(int * pMOMENT) -> unit>

        new(playlist,view) = 
            { 
                data = playlist
                view =  view
                buttonHandler = new List<(int * pMOMENT) -> unit>() }
    end

    interface IDisposable with
        member this.Dispose() = this.buttonHandler.Clear()

let createUI (view:PlayListView) (children:IList<IView>) = 

    let img = Image(WidthRequest = 50.0,HeightRequest = 50.0,Aspect = Aspect.AspectFill)

    img.SetBinding(Image.SourceProperty, "previewImgUrl")

    let label = Label(HorizontalOptions = LayoutOptions.StartAndExpand,VerticalOptions = LayoutOptions.Center,LineBreakMode = LineBreakMode.TailTruncation)

    label.SetBinding(Label.TextProperty, "fullText")

    let playButton = Button(Text = "P",WidthRequest = 50.0,HeightRequest = 50.0,Margin = Thickness 5.0)

    let removeButton = Button(Text = "-",WidthRequest = 50.0,HeightRequest = 50.0,Margin = Thickness 5.0)

    let procItem (sender: obj) h = 
        match sender with
        | :? View as view ->
            match view.BindingContext with
            | :? (int * pMOMENT) as (index,item) -> h (index,item)
            | _ -> ()
        | _ -> ()

    playButton.Clicked.AddHandler(new EventHandler(fun s a -> 
        (fun (index,item) -> 
            view.data.currentIndex <- Some index

            view.buttonHandler.ToArray()
            |> Array.iter(fun h -> 
                (index,view.data.items[index])
                |> h))
        |> procItem s))  

    children.Add img
    children.Add label
    children.Add playButton
    children.Add removeButton


