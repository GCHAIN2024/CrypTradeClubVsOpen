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

            p
            |> populateCreateTx pretx MOMENT_metadata

        pretx 
        |> loggedPipeline "BizLogics.Crawler.launchCrawlers" conn
        |> ignore

let cCOINDESK (runtime:Runtime) bc = 

    let code, html = 
        "https://www.coindesk.com/livewire/"
        |> httpGet None

    let lines = 
        find ("Live Wire</h2>","Show More</button>") html
        |> regex_matches (string__regex "(?<=href=\x22)/\w+/\d+.*?(?=\x22)")
        |> Array.distinct

    lines.Length.ToString() + " lines"
    |> runtime.output

    lines
    |> Array.iter(fun line ->

        Thread.Sleep 1000

        let p = pMOMENT_empty()

        p.Lang <- runtime.data.langs["en"].ID

        p.UrlOriginal <- "https://www.coindesk.com" + line

        // "identifier":"6IVEXN2QXNDRHCRTA6HJ7R7AQM"
        p.OID <- regex_match (string__regex "(?<=\x22identifier\x22:\x22)\w+(?=\x22)") html

        let html = 
            p.UrlOriginal
            |> httpGet None
            |> snd

        let headers = find ("<head>","</head>") html
        p.Title <- find ("<title>","</title>") html
        p.Summary <- find ("<meta name=\"description\" content=\"","\"") html
        p.PreviewImgUrl <- find ("<meta property=\"og:image\" content=\"","\"") html
        
        p.UrlOriginal + " " + p.Title
        |> runtime.output

        newP bc p)

let cCRYPTOSLATE (runtime:Runtime) bc = 

    let code, html = 
        "https://cryptoslate.com/feed/"
        |> httpGet None

    let lines = 
        html
        |> regex_matches (string__regex "<item>.*?</item>")

    lines.Length.ToString() + " lines"
    |> runtime.output

    lines
    |> Array.iter(fun line ->

        Thread.Sleep 1000

        let p = pMOMENT_empty()

        p.Lang <- runtime.data.langs["en"].ID

        p.UrlOriginal <- regex_match (string__regex "(?<=<link>).*?(?=</link>)") line

        let html = 
            p.UrlOriginal
            |> httpGet None
            |> snd

        let headers = find ("<head>","</head>") html
        p.Title <- regex_match (string__regex "(?<=<title>).*?(?=</title>)") line
        p.Summary <- 
            let mutable s = regex_match (string__regex "(?<=<description>).*?(?=</description>)") line
            s <- s.Trim()
            if s.StartsWith "<![CDATA[" then
                s <- s |> find("<![CDATA[","]]>")
            s
            
        p.PreviewImgUrl <- find ("<meta property=\"og:image\" content=\"","\"") headers
        
        p.OID <- find ("<link rel=\"shortlink\" href=\"https://cryptoslate.com/?p=","\" />") headers

        p.UrlOriginal + " " + p.Title
        |> runtime.output

        newP bc p)

// https://cointelegraph.com/
// https://blockchain.news/
// https://decrypt.co/news
// https://news.bitcoin.com/

let launchCrawlers (runtime:Runtime) = 

    [|  (cCOINDESK,"COINDESK")
        (cCRYPTOSLATE,"CRYPTOSLATE") |]
    |> Array.iter(fun (f,c) ->
        (fun _ -> 
            f runtime runtime.data.bcs[c])
        |> asyncCyclerInterval (60 * 1000))
