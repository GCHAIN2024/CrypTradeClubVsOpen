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

let mc__ssrPage mc = 
    {
        title = mc.m.p.Title
        desc = mc.m.p.Summary
        image = mc.m.p.PreviewImgUrl
        url = runtime.host.url + "/m/" + mc.m.ID.ToString()
        noscript = "" }

