module Crawlers

open System
open System.Collections.Concurrent
open System.Collections.Generic

open Util.Text
open Util.Orm

open WebCrawl

let regex_catFromJson1 = string__regex @"(?<=\x22articleSection\x22:[ ]*\x22).+?(?=\x22)"
let regex_dateFromJson1 = string__regex @"(?<=\x22datePublished\x22:[ ]*\x22).*?(?=\x22)"

let KeepCommonTag (input: string) : string =
    try
        Util.HtmlFilter.KeepPTag input
    with _ ->
        ""

let SelectDivByPattern (pattern: string) (input: string) : string =
    try
        Util.HtmlFilter.SelectDivByPattern pattern input
    with _ ->
        ""

let htmlPath__node
    (path: (string * string)[] option) // html 内容的 正文所在标签
    (exceptTags: (string * string)[] option) // 过滤正文中的markdown 无法渲染/无法正常展示/广告等标签
    (excludedNodeChainArr: string[][] option) // node链表中排除无法执行删除的标签组合
    (domain: string) // href/src 链接需要补全的domain
    html // 文章链接的 html 内容
    =
    use cw = new Util.Perf.CodeWrapper("WebInterop.WebCrawl.htmlPath__node")

    // 从html构建语法树
    let dom = html |> Util.Html.cleanBlankCharsInHtml |> Util.Html.html__Dom

    // 通过path截取链表的正文部分
    let res =
        match path.IsSome && path.Value.Length > 0 with
        | true ->
            match Util.Html.findPath path.Value dom.root with // 找到指定 tag 和 attr 的 标签对
            | Some n -> n
            | None -> Util.Html.empty__Node (0, "", "")
        | false ->
            // Util.Html.empty__Node (0, "", "")
            dom.root

    // 通过excludedNodeChainArr排除链表中不需要被处理的标签链
    if excludedNodeChainArr.IsSome && excludedNodeChainArr.Value.Length > 0 then
        excludedNodeChainArr.Value |> Array.iter (Util.Html.deleteSpecificNodeChain res)

    // 通过exceptTags去掉链表不要的节点, 对应html中不需要的标签内容
    if exceptTags.IsSome && exceptTags.Value.Length > 0 then
        Util.Html.deleteNodes exceptTags.Value res // 删除指定的多余的标签

    // 处理链表中的 <a> 标签
    // Util.Html.handleSuperLink domain res

    // 处理链表中与markdown格式的 粗体/斜体 的标签
    Util.Html.handleStars res

    res


let toUtcDt (dt:DateTime) =
    dt.ToUniversalTime()

(*

let sREUTERS s =
    s.domain <- "https://www.reuters.com"
    let path = Some [| ("div", " class=\"article-body__content__") |]

    s.headers["Cookie"] <-
        [|
            "usprivacy=1YNN"
            "datadome=X7UxFZeaTAcNHyDYKLAMovpdFP_1pEglOsLtuW3v~7nfs_bV6zcRqVv6GwWPvK3XE4KyOHcOIP9xCawPVX4CD8RLhSuo3ie6Mv1fOtAeDFJcwe9Oo2zyEWAAs9Vzp0FT"
            """reuters-geo={"country":"US", "region":"-"}"""
            //"""OptanonConsent=isGpcEnabled=0&datestamp=Wed+Mar+20+2024+17%3A36%3A10+GMT%2B0800+(%E6%96%B0%E5%8A%A0%E5%9D%A1%E6%A0%87%E5%87%86%E6%97%B6%E9%97%B4)&version=202310.2.0&browserGpcFlag=0&isIABGlobal=false&hosts=&consentId=aa72614f-92cc-4cab-89c4-85d3e39d6724&interactionCount=1&landingPath=https%3A%2F%2Fwww.reuters.com%2F&groups=1%3A1%2C3%3A1%2CSPD_BG%3A1%2C2%3A1%2C4%3A1"""
        |]
        |> fastConcat ";"

    let exceptTags =
        [|
           ("figure", "class=\"article-body__element__")
           ("div", "class=\"article-body__context_widget__")
           ("div", "class=\"article-prompt__container__")
           ("div", "class=\"article-body-v2__top-toolbar-container")
           ("div", "class=\"article-body-v2__context_widget")
           ("div", "class=\"article-body__element__")
           ("div", "class=\"registration-prompt-v2")
           ("div", "class=\"inline-gallery") // 图库
           ("div", "data-testid=\"Latest Updates")
           ("div", "data-testid=\"Body")
           ("p", "data-testid=\"Body")
           ("div", "testid=\"ResponsiveAdSlot")
           ("noscript", "")
        |]
        |> Some

    let mutable otherLinks =
        [|
           "https://www.reuters.com/legal/legalindustry/paul-hastings-partner-wants-guo-wengui-sanctioned-smear-campaign-2022-12-01/"
           "https://www.reuters.com/world/india/indias-ev-dawn-fans-expectations-fuel-demand-may-peak-early-2023-01-27/"
        |]

    let excludedContent =
        let positionAndContent = Dictionary<Util.Html.ContentOfPosition, string[]>()
        positionAndContent[Util.Html.ContentOfPosition.Head] <- [| "This video is from the " |] // <p>内是该内容

        Some positionAndContent

    let excludedNodeChain =
        [|
        // [|"a";"img";"/a"|]
        |]
        |> Some
    
    s.homepages[ArticleCatTypeEnum.Economy] <- [|"https://www.reuters.com/business/"|]
    s.homepages[ArticleCatTypeEnum.Tech] <- [|"https://www.reuters.com/technology/"|]
    s.homepages[ArticleCatTypeEnum.Law] <- [|"https://www.reuters.com/legal/"|]
    s.homepages[ArticleCatTypeEnum.CultureAndFaith] <- [|"https://www.reuters.com/lifestyle/"|]
    s.homepages[ArticleCatTypeEnum.China] <- [|"https://www.reuters.com/world/china/"|]
    s.homepages[ArticleCatTypeEnum.International] <- [|"https://www.reuters.com/world/"|]

    let regex_links = string__regex @"(?<=href=\x22)/\S+\d{4}-\d{2}-\d{2}/(?=\x22)"
    s.html__linksInCatpage <- regex_links |> regex_matches

    let regex_oidFromJson = string__regex @"(?<=/?id=).+?(?=\x22)"
    s.linkLoader <-
        // -chinas-tech-strategy-2023-07-13/?id=KLYKL4XWIJKSDMKODW5SLZQDAU"
        regex_match regex_oidFromJson
        |> Some
        |> linkLoaderFun 
        // fun (p,c) ->
        //     // linkLoaderFun s.headers p s.homepage
        //     p.p.UrlOriginal <- Util.Html.handlUrlProtocol p.p.UrlOriginal "https://www.reuters.com"
        //     p.p.OID <- p.p.UrlOriginal
        //     let code, html = httpGetter s.headers p.p.UrlOriginal
        //     // let code, html = headlessGetter p.p.UrlOriginal
        //
        //     if code = "OK" then
        //         match html.Contains "article-limit-wall" with // 待优化:去掉这个会出现 * * *
        //         | true -> ()
        //         | false -> p.MarkdownA <- html

    s.populater <-
        fun pExt ->
            let p = pExt.p
            let head = pExt.MarkdownA |> find ("<head>", "</head>")
            p.ShortText <- head |> find ("\"og:title\" content=\"", "\"")
            p.Fulltext <- head |> find ("\"og:description\" content=\"", "\"")

            // <meta name="article:published_time" content="2023-07-13T09:00:24Z"/>
            p.Postedat <-
                head
                |> find ("\"article:published_time\" content=\"", "\"")
                |> Util.Time.parse None
                |> toUtcDt

            p.PreviewImgUrl <-
                // https://www.reuters.com/resizer/v2/ANR37X7AQVOAJJSDB7EIQS4QJY.jpg?auth=34b227541353b22b3a6e3109e3953ba18fb42fa42db9f4b61180337ca254e336&amp;width=1920&amp;height=1005&amp;smart=true
                // https://www.reuters.com/resizer/v2/ANR37X7AQVOAJJSDB7EIQS4QJY.jpg?auth=34b227541353b22b3a6e3109e3953ba18fb42fa42db9f4b61180337ca254e336
                head
                |> find ("\"og:image\" content=\"", "&amp;")
                
            // <meta name="article:section" content="Technology"/>
            p.Cats <-
                pExt.MarkdownA
                |> find ("\"article:section\" content=\"", "\"")

    s.html__markdown <-
        htmlPath__node path exceptTags excludedNodeChain s.domain
        >> Util.Html.node__markdown excludedContent s.domain


let sWSJ s =
    s.domain <- "https://cn.wsj.com"

    // 头条配置
    s.headLinesTagPaths <- [|("h3","WSJChinaTheme--headline--1v0knJoh WSJChinaTheme--heading-cntop--1WY4ud58 WSJTheme--headline--unZqjb45 reset")|]
    s.homepages[ArticleCatTypeEnum.HeadLine] <- [|"https://cn.wsj.com/"|]
    
    // 成为会员才能看到完整文章
    s.homepages[ArticleCatTypeEnum.Social] <- [|"https://cn.wsj.com/zh-hans/news/life-arts?mod=nav_top_section"|]
    s.homepages[ArticleCatTypeEnum.Economy] <- [|"https://cn.wsj.com/zh-hans/news/economy?mod=nav_top_section"|]
    s.homepages[ArticleCatTypeEnum.Tech] <- [|"https://cn.wsj.com/zh-hans/news/technology?mod=nav_top_section"|]
    s.homepages[ArticleCatTypeEnum.China] <- [|"https://cn.wsj.com/zh-hans/news/china?mod=nav_top_section"|]
    s.homepages[ArticleCatTypeEnum.International] <- [|"https://cn.wsj.com/zh-hans/news/world?mod=nav_top_section"|]
    s.homepages[ArticleCatTypeEnum.Undefined] <- [|"https://cn.wsj.com"|]

    let regex_links = string__regex @"(?<= href=\x22)\S+?com/articles/\S+?-\w+(?=\x22)"
    s.html__linksInCatpage <- regex_links |> regex_matches

    let regex_OidFromUrl = string__regex @"(?<=http\S+-)\w+$"
    s.linkLoader <-
        // https://cn.wsj.com/articles/abcde-4d6067be
        regex_match regex_OidFromUrl
        |> Some
        |> linkLoaderFun 

    s.populater <-
        fun pExt ->
            let p = pExt.p
            let head = pExt.MarkdownA |> find ("<head>", "</head>")
            p.ShortText <- head |> find ("<meta property=\"og:title\" content=\"", "\"")
            p.Fulltext <- head |> find ("<meta property=\"og:description\" content=\"", "\"") 
            p.PreviewImgUrl <- head |> find ("<meta property=\"og:image\" content=\"", "\"")

            // <meta name="article.published" content="2023-07-14T02:20:00.000Z"/>
            p.Postedat <-
                head
                |> find ("<meta name=\"article.published\" content=\"", "\"")
                |> Util.Time.parse None
                |> toUtcDt
            
            // <meta name="article.section" content="CN-Business"/>
            p.Cats <-
                pExt.MarkdownA
                |> find ("<meta name=\"article.section\" content=\"", "\"")
                
            pExt.MarkdownA <- pExt.MarkdownA |> SelectDivByPattern "wsj-snippet-body" |> KeepCommonTag 

let sMARKETWATCH s =
    // 成为会员才能看到完整文章
    s.domain <- "https://www.marketwatch.com"
    let path = Some [| ("div", " id=\"js-article__body") |]

    let exceptTags =
        [|
           ("div", "class=\"barrons-article-ad-wrapper")
           ("div", "class=\"media-object")
           ("div", "class=\"j-ad")
           ("span", "class=\"ad__caption")
           ("div", "id=\"ad-inline-video")
           ("div", "id=\"cx-membership-tile")
        |]
        |> Some

    // 头条配置
    s.headLinesTagPaths <- [|("div","element element--article no-image is-lead")|]
    s.homepages[ArticleCatTypeEnum.HeadLine] <- [|"https://www.marketwatch.com/"|]

    s.homepages[ArticleCatTypeEnum.Economy] <- [|"https://www.marketwatch.com"|]

    let regex_links = string__regex @"(?<=href=\x22)https:\/\/www\.marketwatch\.com\/story\/\S+(?=\x22)"
    s.html__linksInCatpage <- regex_links |> regex_matches

    s.linkLoader <-
        // <meta name="article.id" content="WP-MKTW-0002273239"/>
        find ("<meta name=\"article.id\" content=\"", "\"")
        |> Some
        |> linkLoaderFun 

    s.populater <-
        fun pExt ->
            let p = pExt.p
            let head = pExt.MarkdownA |> find ("<head>", "</head>")
            p.ShortText <- head |> find (" property=\"og:title\" content=\"", "\"")
            p.Fulltext <- head |> find (" property=\"og:description\" content=\"", "\"")
            p.PreviewImgUrl <- head |> find (" property=\"og:image\" content=\"", "\"")
            // "datePublished": "2023-07-13T19:08:00.000Z"
            p.Postedat <-
                pExt.MarkdownA
                |> regex_match regex_dateFromJson1
                |> Util.Time.parse None
                |> toUtcDt
                
            // p.Cats <- $"ArticleCatTypeEnum.Economy"

    s.html__markdown <-
        (htmlPath__node path exceptTags None s.domain)
        >> Util.Html.node__markdown None s.domain

let sCNBC (s: Site) =
    s.domain <- "https://www.cnbc.com"

    let path = Some [| ("div", "class=\"ArticleBody-articleBody\"") |] // 正文所在标签

    let exceptTags =
        [|
           ("div", "data-test=\"VideoPlaceHolder\"")
           ("div", "class=\"InlineImage-imageEmbed\"")
           ("div", "id=\"RegularArticle-RelatedQuotes\"")                   // 无用
           ("div", "class=\"Collapsible-proliveCollapsableContainer\"")     // 互动图表
           ("div", "class=\"InteractiveChart-container\"")                  // 互动图表
           ("div", "class=\"InteractiveChart-caption\"")                    // 互动图表
           ("div", "class=\"InlineImage-imageEmbed InlineImage-inlineInfographic\"")  // graph                  // 互动图表
        |]
        |> Some

    let excludedNodeChain =
        [|
            // [|"p";"span";"a";"";"/a";"/span";"/p"|]
            // [|"p";"span";"a";"";"/a";"/span";"/p"|]
        |]
        |> Some

    let excludedContent =
        let positionAndContent = Dictionary<Util.Html.ContentOfPosition, string[]>()
        positionAndContent[Util.Html.ContentOfPosition.Head] <- [| "" |] // <p>内是该内容

        // Some positionAndContent
        None
    
    // 头条配置
    s.headLinesTagPaths <- [|("div","class=\"FeaturedCard-container\"")|]
    s.homepages[ArticleCatTypeEnum.HeadLine] <- [|"https://www.cnbc.com/world/?region=world"|]

    s.homepages[ArticleCatTypeEnum.Military] <- [|"https://www.cnbc.com/defense/"|]
    s.homepages[ArticleCatTypeEnum.Economy] <- [|"https://www.cnbc.com/business/"|]
    s.homepages[ArticleCatTypeEnum.Health] <- [|"https://www.cnbc.com/health-and-science/"|]
    s.homepages[ArticleCatTypeEnum.CCPVirus] <- [|"https://www.cnbc.com/coronavirus/"|]
    s.homepages[ArticleCatTypeEnum.Politics] <- [|"https://www.cnbc.com/politics/"|]
    s.homepages[ArticleCatTypeEnum.Tech] <- [|"https://www.cnbc.com/technology/"|]
    
    let regex_links = string__regex "(?<=href=\")https://www.cnbc.com/\d{4}/\d{2}/\d{2}/[\w-]+?\.html(?=\")"
    s.html__linksInCatpage <- regex_links |> regex_matches

    s.linkLoader <-
        //<meta property="pageNodeId" content="107271010"/>
        find ("<meta property=\"pageNodeId\" content=\"", "\"")
        |> Some
        |> linkLoaderFun 

    s.populater <-
        fun pExt ->
            let p = pExt.p
            let head = pExt.MarkdownA |> find ("<head>", "</head>")

            p.ShortText <- head |> find ("\"og:title\" content=\"", "\"")
            p.Fulltext <- head |> find ("\"og:description\" content=\"", "\"")

            p.PreviewImgUrl <-
                head |> find ("property=\"og:image\" itemProp=\"image\" content=\"", "\"")
                
            // <meta property="article:published_time" content="2023-07-13T13:17:10+0000"/>
            p.Postedat <-
                head
                |> find ("\"article:published_time\" content=\"", "\"")
                |> Util.Time.parse None
                |> toUtcDt

            p.Cats <-
                // "articleSection": "Business News"
                pExt.MarkdownA
                |> regex_match regex_catFromJson1

    s.html__markdown <-
        htmlPath__node path exceptTags excludedNodeChain s.domain
        >> Util.Html.node__markdown excludedContent s.domain

// TODO oid批量更新
let oids4replace = Dictionary<int64,string>()


let crawlerBizs =
    // Order by alphabet, language code influences lingo/indexing, plz match accurately
    // If new language code is required and not exists in the below, plz refer to WebInterop/ISO 639-1 language.txt
    [|
        (sWSJ, true, "zh", "WSJ", false)
        (sCNBC, true, "en", "CNBC", false)
        (sMARKETWATCH, true, "en", "MARKETWATCH", false)
        (sREUTERS, true, "en", "REUTERS", false)
    |]

let crawl (batcher:Batcher) =
    (fun _ ->
        crawlerBizs |> launch batcher
        None
    )
    |> Defines.batchStateControl batcher
    |> ignore

*)