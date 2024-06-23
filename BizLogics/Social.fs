module BizLogics.Social

open System
open System.Text
open System.Collections.Generic
open System.Collections.Concurrent

open Util.Cat
open Util.Perf
open Util.Text
open Util.Crypto
open Util.Db
open Util.DbQuery
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.Common
open UtilWebServer.SSR

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

open BizLogics.Common

let loadAllMoments runtime = 

    use cw = new CodeWrapper("BizLogics.Social.loadAllMoments")

    runtime.output "Loading Moments ..."


    let mutable count = 0

    let res = List<MOMENT>()

    let h (line,x) =  
        count <- count + 1
        if count % 100000 = 0 then
            count.ToString()
            |> output
        line |> db__MOMENT |> res.Add
        true

    match
        [|  "SELECT " + MOMENT_fieldorders;
            " FROM " + MOMENT_table;
            " order by ID asc";
        |]
        |> linesConcat
        |> str__sql
        |> multiline_handle(conn,h) with
    | Suc x -> ()
    | Fail(exn,ctx) -> 
        Util.Runtime.halt output "BizLogics.Social.loadAllMoments" ""

    res.ToArray()

let mc__ssrPage mc = 
    {
        title = mc.m.p.Title
        desc = mc.m.p.Summary
        image = mc.m.p.PreviewImgUrl
        url = "https://gcha.in/t/" + mc.m.ID.ToString()
        noscript = "" }

