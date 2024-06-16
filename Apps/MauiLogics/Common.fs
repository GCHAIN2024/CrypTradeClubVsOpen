module MauiLogics.Common

open System

open Util.CollectionSortedAccessor

open Shared.OrmTypes

open MauiLogics.Types
open System
open System.Collections.Generic

open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Controls

open CommunityToolkit.Maui.Views

//Console.OutputEncoding <- System.Text.Encoding.Unicode
//let output (s:string) = Console.WriteLine s

let output (s:string) = System.Diagnostics.Debug.WriteLine s

let port = 443
let server = "dev.gnews.org"
//let server = "rc.gnews.org"

let version = 4037

let appendControl (children:IList<IView>) c =
    children.Add c
    c


