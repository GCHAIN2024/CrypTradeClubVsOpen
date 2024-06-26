module BizLogics.Crawler

open System
open System.Text
open System.Collections.Generic
open System.Threading

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

let newP (bc:BizComplex) p =

    match
        bc.moments.Values
        |> Seq.tryFind(fun mc -> mc.m.p.OID = p.OID) with
    | Some m -> ()
    | None -> 

        let pretx = None |> opctx__pretx

        let rcd = 
            
            p.BindType <- momentBindTypeEnum.Biz
            p.Bind <- bc.biz.ID
            p.BizCode <- bc.biz.p.Code

            p
            |> populateCreateTx pretx MOMENT_metadata

        pretx 
        |> loggedPipeline "BizLogics.Crawler.launchCrawlers" conn
        |> ignore

let og p html = 
    let title,desc,image = parse html
    p.Title <- title
    p.Summary <- desc
    p.PreviewImgUrl <- image

let template 
    (__urls: unit -> string[])
    url__html
    populator
    (runtime:Runtime) 
    (bc:BizComplex) =

    let urls = 
        __urls()
        |> Array.distinct
        |> Array.filter(fun url -> 
            (bc.moments.Values |> Seq.tryFind(fun mc -> mc.m.p.UrlOriginal = url)).IsNone)

    "[" + bc.biz.p.Code + "]" + urls.Length.ToString() + " items"
    |> runtime.output

    urls
    |> Array.iter(fun url -> 

        Thread.Sleep 1000

        let html = url__html url

        let p = pMOMENT_empty()

        p.UrlOriginal <- url

        p.Lang <- runtime.data.langs["en"].ID

        og p html

        populator p html

        if p.UrlOriginal.Length * p.Title.Length > 0 then
            p.UrlOriginal + " " + p.Title
            |> runtime.output

            newP bc p)


let cCOINDESK = 
    template
        (fun _ ->
            "https://www.coindesk.com/livewire/"
            |> httpGet None
            |> snd
            |> find ("Live Wire</h2>","Show More</button>")
            |> regex_matches (string__regex "(?<=href=\x22)/\w+/\d+.*?(?=\x22)")
            |> Array.map(fun item -> "https://www.coindesk.com" + item))
        (httpGet None >> snd)
        (fun p html -> 
            p.OID <- regex_match (string__regex "(?<=\x22identifier\x22:\x22)\w+(?=\x22)") html)

let cCRYPTOSLATE = 
    template
        (fun _ ->
            "https://cryptoslate.com/feed/"
            |> httpGet None
            |> snd
            |> regex_matches (string__regex "(?<=<link>).*?(?=</link>)"))
        (httpGet None >> snd)
        (fun p html -> 
            p.OID <- 
                html
                |> find ("<head>","</head>")
                |> find ("<link rel=\"shortlink\" href=\"https://cryptoslate.com/?p=","\" />"))

let cCOINTELEGRAPH = 
    template
        (fun _ ->
            let hc = empty__HttpClient()

            (hc.get "https://cointelegraph.com/").html
            |> regex_matches (string__regex "(?<=<a href=\x22/tags/).*?(?=\x22)")
            |> Array.distinct
            |> Array.map(fun i -> "https://cointelegraph.com/tags/" + i)
            |> Array.append [| "https://cointelegraph.com/" |]
            |> Array.map(fun i -> 
                Thread.Sleep 3000

                "Loading " + i |> runtime.output

                (hc.get i).html
                |> regex_matches (string__regex "(?<=<a href=\x22)/news/.*?(?=\x22)"))
            |> Array.concat
            |> Array.map(fun i -> "https://cointelegraph.com" + i))
        (fun url -> (empty__HttpClient().get url).html)
        (fun p html -> 
            p.OID <- 
                html
                |> regex_match (string__regex "(?<=<article id=\x22article-)\d+(?=\x22)"))

// https://blockchain.news/
// https://decrypt.co/news
// https://news.bitcoin.com/

let launchCrawlers (runtime:Runtime) = 

    [|  (cCOINDESK,"COINDESK")
        (cCRYPTOSLATE,"CRYPTOSLATE")
        (cCOINTELEGRAPH,"COINTELEGRAPH")|]
    |> Array.iter(fun (f,c) ->
        (fun _ -> 
            f runtime runtime.data.bcs[c])
        |> asyncCyclerInterval (15 * 60 * 1000))
