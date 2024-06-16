module BizLogics.Crawler

open System
open System.Text
open System.Collections.Generic
open System.Threading

open Util.Text
open Util.HttpClient

open Shared.OrmTypes
open Shared.Types

type SrcSite = { 
mutable linkLoader: pMomentExt -> unit
mutable validator: pMomentExt -> unit
mutable populater: pMomentExt -> unit
mutable html__markdown: string -> string }


let test output = 

    let code, html = 
        "https://www.coindesk.com/livewire/"
        |> httpGet None

    find ("Live Wire</h2>","Show More</button>") html
    |> regex_matches (string__regex "(?<=href=\x22)/\w+/\d+.*?(?=\x22)")
    |> Array.distinct
    |> Array.iter(fun line ->

        Thread.Sleep 1000

        let p = pMOMENT_empty()

        p.UrlOriginal <- "https://www.coindesk.com" + line

        let html = 
            p.UrlOriginal
            |> httpGet None
            |> snd

        let headers = find ("<head>","</head>") html
        p.Title <- find ("<title>","</title>") html
        p.Summary <- find ("<meta name=\"description\" content=\"","\"") html
        p.PreviewImgUrl <- find ("<meta property=\"og:image\" content=\"","\"") html


        p.ToString()
        |> output)

    output html

