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
        bc.mcs.Values
        |> Seq.tryFind(fun mc -> mc.m.p.OID = p.OID) with
    | Some m -> ()
    | None -> 
        p.BindType <- momentBindTypeEnum.Biz
        p.Bind <- bc.biz.ID
        p.BizCode <- bc.biz.p.Code
        match 
            p__createRcd p MOMENT_metadata "BizLogics.Crawler.launchCrawlers" conn with
        | Some m -> 
            let mc = { m = m }
            bc.mcs[m.ID] <- mc
            runtime.data.mcs[m.ID] <- mc
        | None -> ()

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
            (bc.mcs.Values |> Seq.tryFind(fun mc -> mc.m.p.UrlOriginal = url)).IsNone)

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

        if p.OID.Length = 0 then
            p.OID <- p.UrlOriginal

        if p.OID.Length * p.UrlOriginal.Length * p.Title.Length > 0 then
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
            (empty__HttpClient().get "https://cointelegraph.com/").html
            |> regex_matches (string__regex "(?<=<a href=\x22/tags/).*?(?=\x22)")
            |> Array.distinct
            |> Array.map(fun i -> "https://cointelegraph.com/tags/" + i)
            |> Array.append [| "https://cointelegraph.com/" |]
            |> Array.map(fun i -> 
                Thread.Sleep 3000

                "Loading " + i |> runtime.output

                (empty__HttpClient().get i).html
                |> regex_matches (string__regex "(?<=<a href=\x22)/news/.*?(?=\x22)"))
            |> Array.concat
            |> Array.map(fun i -> "https://cointelegraph.com" + i))
        (fun url -> (empty__HttpClient().get url).html)
        (fun p html -> 
            p.OID <- 
                html
                |> regex_match (string__regex "(?<=<article id=\x22article-)\d+(?=\x22)"))

let cBLOCKCHAINNEWS = 
    template
        (fun _ ->
            (empty__HttpClient().get "https://blockchain.news").html
            |> regex_matches (string__regex "(?<=<a href=\x22/tag/).*?(?=\x22)")
            |> Array.distinct
            |> Array.map(fun i -> "https://blockchain.news/tag/" + i)
            |> Array.append [| "https://blockchain.news/" |]
            |> Array.map(fun i -> 
                Thread.Sleep 3000

                "Loading " + i |> runtime.output

                (empty__HttpClient().get i).html
                |> regex_matches (string__regex "(?<=<a href=\x22)/news/.*?(?=\x22)"))
            |> Array.concat
            |> Array.map(fun i -> "https://blockchain.news" + i))
        (fun url -> (empty__HttpClient().get url).html)
        (fun p html -> ())

let cDECRYPTCO = 
    template
        (fun _ ->
            (empty__HttpClient().get "https://decrypt.co/news").html
            |> regex_matches (string__regex "(?<= href=\x22)/\d+/.*?(?=\x22)")
            |> Array.map(fun i -> "https://decrypt.co" + i))
        (fun url -> (empty__HttpClient().get url).html)
        (fun p html -> ())

// https://coingape.com/
// https://watcher.guru/news/
// https://en.coin-turk.com/
// https://dailyhodl.com/news/
// https://www.theblock.co/
// https://ambcrypto.com/
// https://bitcoinist.com/
// https://coinedition.com/

let launchNewsCrawlers (runtime:Runtime) = 

    [|  (cCOINDESK,"COINDESK")
        (cCRYPTOSLATE,"CRYPTOSLATE")
        (cCOINTELEGRAPH,"COINTELEGRAPH") 
        (cBLOCKCHAINNEWS,"BLOCKCHAIN.NEWS")
        (cDECRYPTCO,"DECRYPT.CO") |]
    |> Array.iter(fun (f,c) ->
        (fun _ -> 
            f runtime runtime.data.bcs[c])
        |> asyncCyclerInterval (15 * 60 * 1000))

