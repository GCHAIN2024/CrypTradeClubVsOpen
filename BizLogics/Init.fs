module BizLogics.Init

open System
open System.Collections.Generic
open System.Collections.Concurrent
open System.Threading

open Util.Runtime
open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.DbLogger

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types

open BizLogics.Common

let loadBcs runtime = 
    match 
        ""
        |> Util.Orm.loadall conn
            (BIZ_metadata.table,BIZ_metadata.fieldorders,BIZ_metadata.db__rcd) with
    | None -> 
        halt runtime.output "BizLogics.Init.loadBcs" ""
        
    | Some items ->
        items
        |> Array.iter(fun i -> 
            runtime.bcs[i.p.Code] <- {
                biz = i
                moments = new Dictionary<int64,MOMENT>() })

let init runtime = 

    conn <- runtime.host.conn

    dbLoggero <- (fun log -> 
    
        let p = pLOG_empty()

        p.Content <- log.content
        p.Location <- log.location
        p.Sql <- log.sql

        let pretx = None |> opctx__pretx

        let tid = Interlocked.Increment LOG_metadata.id

        (tid,pretx.dt,pretx.dt,tid,p)
        |> build_create_sql LOG_metadata
        |> pretx.sqls.Add

        pretx
        |> pipeline conn
        |> ignore)
        |> Some

    loadBcs runtime
        



