module BizLogics.Market

open System
open System.Text
open System.Collections.Generic
open System.Threading

open Util.ADT
open Util.Text
open Util.Concurrent
open Util.Db
open Util.DbTx
open Util.Orm
open Util.HttpClient

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open UtilWebServer.Db
open UtilWebServer.OpenGraph

open BizLogics.Common
open BizLogics.Ca

let crawler (runtime:Runtime) = 

    (empty__HttpClient().get "https://www.coingecko.com/").html
    |> regex_matches (string__regex @"<tr .*?</tr>")
    |> Array.map(regex_matches (string__regex @"<td .*?</td>"))
    |> Array.filter(fun items -> items.Length > 4)
    |> Array.map(fun items -> 

        let img = find("src=\"","\"") items[2]
            
        let ss = 
            items[2]
            |> regex_matches (string__regex @"(?<=<div data-view-component=\x22true\x22).*?(?=<)")
            |> Array.map(regex_match (string__regex @"(?<=>).*"))
            |> Array.map(fun i -> i.Trim())
                
        let p = find("data-sort=\"","\"") items[4] |> try_parse_float

        ss,img,p)
    |> Array.filter(fun (ss,img,p) -> ss.Length = 2 && p.IsSome)
    |> Array.map(fun (ss,img,p) -> 
        let n,c = ss[0],ss[1]
        n,c.ToUpper(),img,p.Value)
    |> Array.filter(fun (n,c,img,p) -> c.Length > 0)
    |> Array.iter(fun (n,c,img,price) -> 
        
        if runtime.data.curs.ContainsKey c = false then
            let p = pCUR_empty()
            p.Code <- c
            p.Caption <- n
            p.AnchorRate <- price
            p.Icon <- img
            p.CurType <- curCurTypeEnum.Crypto
            p__createRcd p CUR_metadata "BizLogics.Market.crawler" conn
            |> oPipelineSome (fun cur -> 
                runtime.data.curs[cur.p.Code] <- cur)
            |> ignore
        else
            runtime.data.curs[c]
            |> update "BizLogics.Market.crawler" CUR_metadata (fun p -> 
                p.Caption <- n
                p.AnchorRate <- price
                p.Icon <- img
                p.CurType <- curCurTypeEnum.Crypto)
            |> ignore
            
        if runtime.data.curs.ContainsKey c then
            let long = runtime.data.curs[c]
            let short = runtime.data.curs["USD"]

            let code = long.p.Code + "/" + short.p.Code
            
            if runtime.data.inss.ContainsKey code = false then
                let p = pINS_empty()
                p.Code <- code
                p.Caption <- code
                p.Long <- long.ID
                p.LongCode <- long.p.Code
                p.Short <- short.ID
                p.ShortCode <- short.p.Code
                p__createRcd p INS_metadata "BizLogics.Market.crawler" conn
                |> oPipelineSome (fun ins -> 
                    runtime.data.inss[ins.p.Code] <- ins)
                |> ignore

        ())

let launchMarketCrawlers (runtime:Runtime) = 

    (fun _ -> 
        crawler runtime)
    |> asyncCyclerInterval (15 * 60 * 1000)
