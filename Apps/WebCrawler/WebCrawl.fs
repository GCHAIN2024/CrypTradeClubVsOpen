module WebCrawl

open System.Collections.Concurrent

open System
open System.Collections.Generic
open System.Text

open System.Text.Json
open Util
open Util.Perf
open Util.Text
open Util.DbTx
open Util.Orm
open Util.Collection

open Shared.OrmTypes
open Shared.Types

type CrawlFailedEnum =
| Undefined                 = 0
| Normal                    = 1
| AlreadyCrawled            = 101
| OidExists                 = 102
| HomepageNoUrls            = 103
| ArticleUseless            = 201
| Response404               = 202
| HtmlCannotFindTitle       = 601
| HtmlCannotFindContent     = 602
| PostDateIsZero            = 701
| HtmlToMdParseEmpty        = 702
| CannotSaveInDB            = 901
| BizNotExists              = 1001
| HomepageCannotCrawl       = 1002
| HeadlineCannotCrawl       = 1003

type WebCrawlCtx = { 
    site: Site
    
    code: string
    source: BIZ
    langId: Integer
    
    configuredCats: Dictionary<string,string[]>                 // Gnews目录 <- 对应配置了的源文章的类别 TODO 有变动后批量更新历史分类

    mutable run: bool                                   // 用于批量任务中单项的停止(启动作用不大)
    mutable auditManual: bool

    mutable crawled_available_cnt : int
    mutable crawled_succ_cnt: int
    mutable lastHeadLineNumInSource: int
    mutable info: string
    mutable sleep: int
    mutable progressTs: DateTime
    
    mutable startTS: DateTime
    mutable lastCrawledTS: DateTime
    mutable statusChangeTS: DateTime
    mutable lastCrawledCatsTS: DateTime

    mutable headLinesState: string
    mutable headlineUpdateTS: DateTime
    
    mutable lastCrawledMomentId: int64
    
    func: WebCrawlCtx -> unit
}

and Site = { 
    mutable headLinesTagPaths: (string*string) []               // 头条链接解析
    mutable headLinesLinksParser: (string -> string[]) option   // 头条所在区域 html -> link[]
    
    mutable headers: Dictionary<string, string> 
    mutable domain: string                                  // 源域名
    mutable linkPrefix: string                              // 源文章链接前缀,不一定等于域名
    
    mutable html__allLinks: string -> string[]              // 找到网页内全部链接
    mutable html__linksInCatpage: string -> string[]        // 找到目录页的文章链接
    
    // !!!爬取源无法得到 页面分类信息 时不配置该函数, 仅使用默认
    // 找到文章中的文章链接,截取的部分要与 linkPrefix衔接正确,没有配置linkPrefix时与domain衔接正确
    mutable html__linksInArticle: string -> string[]
    
    mutable linkLoader: pMomentExt * WebCrawlCtx -> unit
    mutable validator: pMomentExt * WebCrawlCtx -> CrawlFailedEnum   // 验证爬取
    mutable populater: pMomentExt -> unit
    mutable html__markdown: string -> string                                               
}
