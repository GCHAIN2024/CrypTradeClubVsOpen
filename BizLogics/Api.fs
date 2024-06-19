module BizLogics.Api

open System
open System.Text
open System.Collections.Generic
open System.Threading

open Util.Text
open Util.HttpClient

open Shared.OrmTypes
open Shared.Types

open UtilWebServer.Api

let branch api json (ero: ref<Er option>) = 

    match api with
    | _ -> 
        ero.Value <- Some Er.ApiNotExists
        [||]
