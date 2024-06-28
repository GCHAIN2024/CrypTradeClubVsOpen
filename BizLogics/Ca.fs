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


let createLang code = 
    let p = pLANG_empty()
    p.Code2 <- code
    p__createRcd p LANG_metadata "BizLogics.Ca.createLang" conn

let createCur code = 
    let p = pCUR_empty()
    p.Code <- code
    p__createRcd p CUR_metadata "BizLogics.Ca.createCur" conn

let createBiz code = 
    let p = pBIZ_empty()
    p.Code <- code
    p__createRcd p BIZ_metadata "BizLogics.Ca.createBiz" conn
