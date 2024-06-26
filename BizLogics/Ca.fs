module BizLogics.Ca

open System
open System.Text
open System.Collections.Generic
open System.Collections.Concurrent

open Util.Text
open Util.Crypto
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.Common

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

let create loc metadata p = 

    let pretx = None |> opctx__pretx

    let rcd = 
        p
        |> populateCreateTx pretx metadata
        
    if pretx |> loggedPipeline loc conn then
        Some rcd
    else
        None

let update loc metadata changer rcd = 

    let current = metadata.clone rcd.p
    changer rcd.p

    let pretx = None |> opctx__pretx

    (rcd.ID,DateTime.UtcNow,rcd.p)
    |> build_update_sql metadata
    |> pretx.sqls.Add
        
    if pretx |> loggedPipeline loc conn then
        true
    else
        rcd.p <- current
        false

let createLang code = 
    let p = pLANG_empty()
    p.Code2 <- code
    p
    |> create "BizLogics.Ca.createLang" LANG_metadata 

let createCur code = 
    let p = pCUR_empty()
    p.Code <- code
    p
    |> create "BizLogics.Ca.createCur" CUR_metadata 

let createBiz code = 
    let p = pBIZ_empty()
    p.Code <- code
    p
    |> create "BizLogics.Ca.createBiz" BIZ_metadata 
