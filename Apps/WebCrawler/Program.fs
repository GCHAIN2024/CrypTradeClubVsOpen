open System
open System.Collections.Generic
open System.Text
open System.Text.Json

open System.Threading
open Util.Text
open Util.HttpClient
open Util.Console

let sendDataWithResp url data =
    // if appRuntimeo.IsSome then
    //     (url, data)
    //     ||> ipcPost appRuntimeo.Value MsgType.WebCrawl
    // else
        let code, content = httpPost (url, data)
        if code = "OK" then
            true, content
        else
            false, ""


let checkoutPath = "/api/dist/crawlStandaloneCheckTask"
let submitPath = "/api/dist/crawlSTandaloneSubmitTask"

let machineName = Environment.MachineName
let client = Util.Crypto.sha256rand ()
let separater_1 = "~!@"
let separater_2 = "#-@"

let output (s: string) = Console.WriteLine s

let encodeAnd2Base (s:string) =
    s |> Encoding.UTF8.GetBytes |> System.Convert.ToBase64String

let outputMsg msg remote =
    Random.Shared.Next(1000,3000) |> Threading.Thread.Sleep
    output $"UTC %A{DateTime.UtcNow} %s{msg} %s{machineName} -> %s{remote}"

type CoinsSourceDataEnum =
    | Undefined = 0
    | CoinList = 1
    | SupportedCurrencies = 2
    | SimplePrice = 3

type CoinMarketData =
    // type, lastRequestDT, lastSuccDT, code, data
    CoinsSourceDataEnum * Int64 * Int64 * string * string 


let coinMarket (remotes: string) =
    
    (*
    时间:
        上次请求时间,来自本地
        上次成功请求时间,来自本地
        源数据更新时间,来自源,存于数据中
    
                            free    $129/mo     $499/mo     $999/mo     Enterprise
    Call credits    /mo     10K	    500K	    2M	        5M	        Custom
    Call rate       /min    30	    500	        500	        1000	    Custom
    *)
    outputMsg "CoinMarket Start" (remotes)
    let apiKV = "x_cg_demo_api_key=CG-XW8SWPFpvkfvZTHVZ6TuQx7P"

    // 成功请求DT
    let mutable requestSuccCoinListDt = DateTime.MinValue.Ticks   // sourceUpdateRate: every 5 minutes
    let mutable requestSuccCoinSupportedCurrenciesDt = DateTime.MinValue.Ticks    // sourceUpdateRate: every 60 seconds
    let mutable requestSuccCoinsSimplePriceDt = DateTime.MinValue.Ticks   // sourceUpdateRate: every 60 seconds (every 30 seconds for Pro API)
    
    // 触发请求DT
    let mutable requestCoinListDt = DateTime.MinValue.Ticks 
    let mutable requestSupportedCurrenciesDt = DateTime.MinValue.Ticks 
    let mutable requestSimplePriceDt = DateTime.MinValue.Ticks
    
    // simple price url needs
    let mutable coins = ""    // id1,id2,..
    let mutable supportedCurrencies = ""

    let requestCoinList () =
        (*
        每次返回最新数据
        response:
            [
              {
                "id": "01coin",
                "symbol": "zoc",
                "name": "01coin",
                "platforms": {}
              },
              {
                "id": "0chain",
                "symbol": "zcn",
                "name": "Zus",
                "platforms": {
                  "ethereum": "0xb9ef770b6a5e12e45983c5d80545258aa38f3b78",
                  "polygon-pos": "0x8bb30e0e67b11b978a5040144c410e1ccddcba30"
                }
              },
                ...
            ]
        *)
        let url = $"https://api.coingecko.com/api/v3/coins/list?include_platform=true&{apiKV}"
        
        // 请求数据
        let code, json = httpGet None url
        requestCoinListDt <- DateTime.UtcNow.Ticks
        
        // 解析数据
        let parseResponse (json:string) =
            let data = 
                JsonDocument
                    .Parse(json)
                    .RootElement
                    .EnumerateArray()
                |> Seq.filter (fun o ->
                    o.TryGetProperty("id") |> fst &&
                    o.TryGetProperty("name") |> fst
                )
                |> Seq.map (fun o ->
                    let cid = o.TryGetProperty("id") |> snd
                    let cname = o.TryGetProperty("name") |> snd
                    cid.GetString(), cname.GetString()
                )
                
            coins <- 
                data
                |> Seq.map fst
                |> String.concat ","
                
            data
            |> Seq.map (fun (cid,cname) ->
                cid + separater_1 + cname
            )
            |> String.concat separater_2
                // data
                // |> Seq.map (fun (cid,cname) ->
                //     [|
                //         $"\"id\":\"{cid}\""
                //         $"\"name\":\"{cname}\""
                //     |]
                //     |> fastConcat ","
                //     |> fun str ->
                //         "{" + str + "}"
                // )
                // |> String.concat ","
                // |> fun str ->
                //     "[" + str + "]"

        if code = "OK" then
            requestSuccCoinListDt <- DateTime.UtcNow.Ticks
            parseResponse json
        else
            "httpGet occur error when requesting CoinsList"
        |> fun data ->
            CoinsSourceDataEnum.CoinList,
            requestCoinListDt,
            requestSuccCoinListDt,
            code, data

    let requestCoinSupportedCurrencies () =
        (*
            每次返回最新数据
            https://api.coingecko.com/api/v3/simple/supported_vs_currencies
            response:
                [
                  "btc",
                  "eth",
                  ...
                  
                ]
        *)
        
        let url = "https://api.coingecko.com/api/v3/simple/supported_vs_currencies?{apiKV}"
        
        // every 61 seconds
        // if DateTime.UtcNow.Ticks - requestSupportedCurrenciesDt >= TimeSpan.TicksPerSecond * 61L then

        // 请求数据
        let code, json = httpGet None url
        requestSupportedCurrenciesDt <- DateTime.UtcNow.Ticks
        
        // 解析数据
        let parseResponse (json:string) =
            JsonDocument
                .Parse(json)
                .RootElement
                .EnumerateArray()
            |> Seq.map (fun je -> je.GetString())
            |> String.concat ","


        if code = "OK" then
            requestSuccCoinSupportedCurrenciesDt <- DateTime.UtcNow.Ticks
            supportedCurrencies <- parseResponse json
            supportedCurrencies
        else
            "httpGet occur error when requesting SupportedCurrencies"
        |> fun str ->
            code, str
        |> fun (code,data) ->
            CoinsSourceDataEnum.SupportedCurrencies,
            requestSupportedCurrenciesDt,
            requestSuccCoinSupportedCurrenciesDt,
            code, data
    
    let mutable lastUpdatePrices = Dictionary<(string * int64),Dictionary<string,string>>()
    let requestCoinsSimplePrice () =

        (*
            every 60 seconds
            Pro: every 30 seconds
        
            每61请求一次, 保存上次结果, 推送差异数据
            response:
                {
                  "bitcoin": {
                    "usd": 37101.16225224282,
                    "eur": 33862.89860854264,
                    cur:price
                    "last_updated_at": 1701169997
                  },
                  "ethereum": {
                    "usd": 2019.7754882031418,
                    "eur": 1843.4854440417992,
                    "last_updated_at": 1701169991
                  }
                }
        *)

        let url = 
            let api =
                "https://api.coingecko.com/api/v3/simple/price?include_last_updated_at=true&precision=full&"

            [
                $"{apiKV}"
                $"ids=bitcoin"
                $"vs_currencies=usd"
            ]
            |> String.concat "&"
            |> fun str ->
                api + str
                
        let parseResponse (json:string) =
            let currentUpdatePrices = 
                let re = JsonDocument.Parse(json).RootElement
                re.EnumerateObject()
                |> Seq.choose (fun je ->
                    match 
                        je.Value.EnumerateObject()
                        |> Seq.tryFind (fun o -> o.Name = "last_updated_at")
                    with
                    | Some je_lastUpdated ->
                        
                        let coinId = je.Name
                        let ts = je_lastUpdated.Value.GetInt64()
                        let curPriceDict = Dictionary<string,string>()
                        je.Value.EnumerateObject()
                        |> Seq.filter (fun o -> o.Name <> "last_updated_at") 
                        |> Seq.iter (fun o -> curPriceDict[o.Name] <-o.Value.GetDecimal().ToString())
                        
                        ((coinId,ts), curPriceDict)
                        |> KeyValuePair
                        |> Some
                    | _ -> None
                )
                |> Dictionary
            
            let data = 
                let lastUpdatekeys = lastUpdatePrices.Keys
                (lastUpdatekeys, currentUpdatePrices.Keys)
                ||> Seq.except
                |> Seq.map (fun k ->
                    k, currentUpdatePrices[k]
                )
                |> Array.ofSeq
                
            lastUpdatePrices <- currentUpdatePrices
            
            data
            |> Array.map (fun ((cid,ts), dict) ->
                let curs =
                    dict
                    |> Seq.map (fun kv -> $"\"short\":\"{kv.Key}\",\"value\":{kv.Value}")
                    |> String.concat ","
                [|
                    $"\"id\":\"{cid}\""
                    $"\"lastUpdateTs\":{ts}"
                    curs
                |]
                |> fastConcat ","
                |> fun str ->
                    "{" + str + "}"
            )
            |> fastConcat ","

        requestSimplePriceDt <- DateTime.UtcNow.Ticks
        let code, json = httpGet None url
        if code = "OK" then
            requestSuccCoinsSimplePriceDt <- DateTime.UtcNow.Ticks
            parseResponse json
        else
            "httpGet occur error when requesting CoinsSimplePrice"
        |> fun str ->
            code, str
        |> fun (code,data) ->
            CoinsSourceDataEnum.SimplePrice,
            requestSimplePriceDt,
            requestSuccCoinsSimplePriceDt,
            code, data

    let emitData (data:CoinMarketData) =
        let submitPath = "/api/dist/commitMarketQuote"
        let ty,lts,sts,c,d = data
        output $"{c}|{DateTime(lts,DateTimeKind.Utc)}|{ty}|{DateTime(sts,DateTimeKind.Utc)}|{d}"
        
        let cEncoded = c |> encodeAnd2Base
        let dEncoded = d |> encodeAnd2Base

        let postadata =
            [| 
               $"\"LastRequest\":{lts}" 
               $"\"LastUpdate\":{sts}" 
               $"\"DataLength\":{d.Length}" 
               $"\"Type\":{int ty}" 
               $"\"Status\":\"{cEncoded}\""
               $"\"Data\":\"{dEncoded}\""
            |]
            |> fastConcat ","
            |> fun str ->
                "{" + str + "}"

        remotes
        |> split ";" 
        |> Array.iter (fun remote ->
            sendDataWithResp (remote + submitPath) postadata
            |> ignore
        )
        
    while true do
        [
            // requestCoinList()
            // requestCoinSupportedCurrencies()
            requestCoinsSimplePrice ()
        ]
        |> Seq.iter emitData
        
        Threading.Thread.Sleep (30 * 1000)
    
    ()


let coinTx appRuntimeo (remote: string) =
    // "https://gnews.org"
    // "https://rc.gnews.org"
    // "http://127.0.0.1:44336"
    outputMsg "BlockChain Transaction Start" remote

    while true do
        let url = remote + checkoutPath

        let msg, html =
            let postData = 
                [|
                    $"\"Client\":\"%s{client}\""
                    "\"Type\":\"OTC\""
                |]
                |> fastConcat ","
                |> fun str ->
                    "{" + str + "}"
            httpPost (url, postData)

        if msg = "OK" then

            let headersD = Dictionary<string, string>()
            let fields = Util.Json.jsonstr__items html
            let url = Util.Json.checkfield fields "Url"
            let token = Util.Json.checkfield fields "Token"
            let ty = Util.Json.checkfield fields "Type"
            let expiry = Util.Json.checkfield fields "Expiry"
            let headers = Util.Json.checkfield fields "Headers"

            if headers.Length > 0 then
                headers.Split ",,,"
                |> Array.iter (fun kv ->
                    let kvA = kv.Split ":::"

                    if kvA.Length = 2 then
                        headersD[kvA[0].Trim()] <- kvA[1].Trim())

            if url.StartsWith "Error" then
                verror <| sprintf "\n%s\n" url

            if (token.Length > 0) && not (url.StartsWith "Error") then
                let mEncoded, hEncoded =

                    output ("task:" + remote + " -- " + url)

                    let m, h = httpGet (Some headersD) url
                    
                    let mEncoded = m |> encodeAnd2Base
                    let hEncoded = h |> encodeAnd2Base
                    mEncoded, hEncoded

                let postadata =
                    [| "{\"Msg\":\"" + mEncoded
                       "\",\"Url\":\"" + url
                       "\",\"Token\":\"" + token
                       "\",\"Type\":\"" + ty
                       "\",\"Client\":\"" + client
                       "\",\"Html\":\"" + hEncoded
                       "\"}" |]
                    |> linesConcat
                
                sendDataWithResp (remote + submitPath) postadata
                |> ignore

        System.Threading.Thread.Sleep 300

    ()


let news (remote:string) =
    // "https://gnews.org"
    // "https://rc.gnews.org"
    // "http://127.0.0.1:44336"
    
    outputMsg "NewsCrawler Start" remote

    while true do
        let url = remote + checkoutPath
        
        let msg, html = httpPost (url, "{\"Client\":\"" + client + "\"}")

        if msg = "OK" then

            let headersD = Dictionary<string, string>()
            let fields = Util.Json.jsonstr__items html
            let url = Util.Json.checkfield fields "Url"
            let token = Util.Json.checkfield fields "Token"
            let expiry = Util.Json.checkfield fields "Expiry"
            let headers = Util.Json.checkfield fields "Headers"

            if headers.Length > 0 then
                headers.Split ",,,"
                |> Array.iter (fun kv ->
                    let kvA = kv.Split ":::"

                    if kvA.Length = 2 then
                        headersD[kvA[0].Trim()] <- kvA[1].Trim())

            if url.StartsWith "Error" then
                verror <| sprintf "\n%s\n" url

            if (token.Length > 0) && not (url.StartsWith "Error") then
                let mEncoded, hEncoded =

                    output ("task:" + remote + " -- " + url)

                    let m, h = httpGet (Some headersD) url
                    
                    let mEncoded = m |> encodeAnd2Base
                    let hEncoded = h |> encodeAnd2Base
                    mEncoded, hEncoded

                let postadata =
                    [| "{\"Msg\":\"" + mEncoded
                       "\",\"Url\":\"" + url
                       "\",\"Token\":\"" + token
                       "\",\"Client\":\"" + client
                       "\",\"Html\":\"" + hEncoded
                       "\"}" |]
                    |> linesConcat
                    
                sendDataWithResp (remote + submitPath) postadata
                |> ignore

        Thread.Sleep 300
    ()


let exchangeRates (remotes:string) =
    outputMsg "ExchangeRates Start" remotes

    let mutable count = 0L
    let mutable date_lastUpdate = 0L
    let mutable msg = ""
    let mutable original = ""
    let mutable source = ""
    
    // 134, include: eth btc
    let curs =
        [|
            "AED";"AFN";"ALL";"AMD";"AOA";"ARS";"AUD";"AWG";"AZN";"BAM";"BBD";"BDT";"BGN";"BHD"
            "BIF";"BMD";"BND";"BOB";"BRL";"BSD";"BWP";"BYN";"BZD";"CAD";"CDF";"CHF";"CLP";"CNY"
            "COP";"CRC";"CUP";"CVE";"CZK";"DJF";"DKK";"DOP";"DZD";"EGP";"ETB";"EUR";"FJD";"GBP"
            "GEL";"GHS";"GMD";"GNF";"GTQ";"HKD";"HNL";"HRK";"HTG";"HUF";"IDR";"ILS";"INR";"IQD"
            "IRR";"ISK";"JMD";"JOD";"JPY";"KES";"KHR";"KMF";"KRW";"KWD";"KYD";"KZT";"LAK";"LBP"
            "LKR";"LRD";"LSL";"LYD";"MAD";"MDL";"MGA";"MKD";"MMK";"MOP";"MRU";"MUR";"MVR";"MWK"
            "MXN";"MYR";"MZN";"NAD";"NGN";"NIO";"NOK";"NPR";"NZD";"OMR";"PAB";"PEN";"PGK";"PHP"
            "PKR";"PLN";"PYG";"QAR";"RON";"RSD";"RUB";"RWF";"SAR";"SCR";"SDG";"SEK";"SGD";"SHP"
            "SLL";"SOS";"SYP";"SZL";"THB";"TMT";"TND";"TRY";"TTD";"TWD";"TZS";"UAH";"UGX";"UYU"
            "UZS";"VES";"VND";"YER";"ZAR";"ZMW";"ETH";"BTC"
       |]

    let msn_forex () =
        msg <- ""
        original <- ""
        date_lastUpdate <- 0L
        let mutable date = DateTime.MinValue
        
        let genUrl ids = 
            [|
                "https://assets.msn.com/service/Finance/Quotes?"
                "apikey=0QfOX3Vn51YCzitbLaRkTTBadtWpgTN8NZLW0C1SEM"
                "&activityId=86DA4A9C-56AA-4DF3-8CF3-36DA883B6D1A"
                "&ocid=finance-utils-peregrine"
                "&cm=en-us"
                "&it=edgeid"
                $"&ids=%s{ids}"
                "&wrapodata=false"
            |]
            |> linesConcat
            
        let parseJson (json:string) =
             (*
                [
                  [
                    {
                      "price": 7.1825,
                      "priceChange": 0.0062,
                      "priceDayHigh": 7.1829,
                      "priceDayLow": 7.1765,
                      "fromCurrency": "USD",
                      "timeLastTraded": "2024-01-29T03:57:35Z",
                      "priceDayOpen": 7.179,
                      "pricePreviousClose": 7.1763,
                      "datePreviousClose": "2024-01-26T00:00:00Z",
                      "priceAsk": 7.1827,
                      "askSize": 0.0,
                      "priceBid": 7.1825,
                      "bidSize": 0.0,
                      "accumulatedVolume": 286.0,
                      "priceChangePercent": 0.0864,
                      "price52wHigh": 7.3498,
                      "price52wLow": 6.7055,
                      "priceClose": 7.1763,
                      "priceChange1Week": -0.0095,
                      "priceChange1Month": 0.0847,
                      "priceChange3Month": -0.1345,
                      "priceChange6Month": 0.0337,
                      "priceChangeYTD": 0.0847,
                      "priceChange1Year": 0.4,
                      "return1Week": -0.1321,
                      "return1Month": 1.1933,
                      "return3Month": -1.8382,
                      "return6Month": 0.4714,
                      "returnYTD": 1.1933,
                      "return1Year": 5.8975,
                      "sourceExchangeCode": "FOREX",
                      "sourceExchangeName": "Foreign Exchange Rates",
                      "marketCapCurrency": "",
                      "exchangeId": "r6dwrm",
                      "exchangeCode": "FOREX",
                      "exchangeName": "Foreign Exchange Rates",
                      "offeringStatus": "regular",
                      "displayName": "US Dollar/Chinese Renminbi FX Spot Rate",
                      "shortName": "US Dollar/Chinese Renminbi FX Spot Rate",
                      "securityType": "currencyPair",
                      "instrumentId": "avym77",
                      "symbol": "USDCNY",
                      "friendlySymbol": "USD/CNY",
                      "country": "US",
                      "market": "en-us",
                      "localizedAttributes": {
                        "en-us": {
                          "symbolName": "United States Dollar/Chinese Yuan (RMB)"
                        }
                      },
                      "timeLastUpdated": "2024-01-29T03:57:38.8452081Z",
                      "currency": "CNY",
                      "_p": "avym77",
                      "id": "fab89a4e-e559-4905-85aa-3c948f0e7428",
                      "_t": "Quote"
                    }
                  ],
                  [{}]
                ]
            *)
                
            try
                let re = JsonDocument.Parse(json).RootElement
                re.EnumerateArray()
                |> Seq.collect (fun e -> e.EnumerateArray() )
                |> Seq.map (fun e ->
                    let e_price, price = e.TryGetProperty("price")
                    let e_symbol, symbol = e.TryGetProperty("friendlySymbol")
                    (e_price && e_symbol), (symbol,price)
                    )
                |> Seq.toArray
                |> Array.filter fst
                |> Array.choose (fun (_,(symbol,price)) ->
                    let s = symbol.ToString()
                    let e_pd,pd = price.TryGetDouble()
                    if e_pd && s.Contains "/" then
                        let arr = s.Split "/"
                        if arr.Length = 2 then
                            let h = arr[0].ToUpper()
                            let t = arr[1].ToUpper()
                            if h = "USD" then
                                $"%s{t}:%f{pd}" |> Some 
                            elif t = "USD" then
                                $"%s{h}:%f{1.0/pd}" |> Some
                            else
                                None
                        else
                            None
                    else
                        None
                )
                |> fun res ->
                    date <- DateTime.UtcNow
                    res
            with
            | ex -> [||]

        let ids =                
            // 134 , 100ids/req
            [|
                "avym77";"avyn9c";"avytp2";"avyqcw";"avylur";"avylgh";"avyu4c";"avyo8m";"avykh7";"avynz2";
                "avys2w";"avyo2w";"avyt7w";"avyq1h";"avyr6h";"avyqww";"avyrw7";"avysec";"avyt52";"avyspr";
                "avytgh";"avytar";"avyufr";"avysvh";"avykbh";"avyu1h";"avyk5r";"avykk2";"avyk2w";"bqpyur";
                "brfkr7";"avykec";"avylar";"avykvh";"avyksm";"avylm7";"avykpr";"avylp2";"avyl52";"avyljc";
                "avyl7w";"avykmw";"avyldm";"b1ebmw";"avyl27";"avymfr";"avym4c";"avyma2";"avymim";"bpa9fr";
                "avylxm";"avymoc";"avymu2";"avymr7";"avymww";"avyk8m";"avymzr";"avyn6h";"avync7";"avynhw";
                "bntz3m";"avynf2";"avynqh";"avynnm";"avynw7";"avymlh";"avyntc";"avyobh";"avyoh7";"avyoec";
                "bntz9c";"avyo5r";"avyok2";"avyopr";"avyomw";"avyovh";"avylrw";"avymcw";"avyoyc";"avyp27";
                "avym1h";"avyosm";"avyp52";"avypar";"avysyc";"avypgh";"avypdm";"avypjc";"avyqim";"avyqfr";
                "avypur";"avyprw";"avyqoc";"avypp2";"bqelhw";"avyqa2";"avyq4c";"avypxm";"avyqlh";"avyqr7";
                "bt6vbh";"avyqzr";"c8kmkr";"avyqu2";"avyr9c";"avyrf2";"avyrnm";"avyrhw";"avyrqh";"avyrc7";
                "avyrtc";"avyrkr";"avyrz2";"avysh7";"avys5r";"avysk2";"bpz1gh";"avys8m";"avysmw";"avyssm";
                "bpa9im";"avyt27";"avytrw";"avytm7";"avytjc";"avytdm";"avytxm";"avytur";"avyu77";"avyua2";
                "bor58m";"avyuim";"b1ebbh";"bo8mh7";
            |]
        
        Array.chunkBySize 100 ids
        |> Array.map ((fastConcat ",") >> genUrl)
        |> Array.map (fun url ->
            Threading.Thread.Sleep 1000
            httpGet None url
        )
        |> Array.filter (fun (code,_) -> code = "OK")
        |> Array.collect (fun (_,content) -> parseJson content )
        |> fastConcat ","
        |> fun m ->
            if m.Trim().Length > 0 then 
                msg <- m
                date_lastUpdate <- date.Ticks
                source <- "1"
                true
            else
                false

    let exchangeRateApi () =
        msg <- ""
        original <- ""
        date_lastUpdate <- 0L

        let genUrl () =
            let apiKey () =
                let keys = 
                    [|
                        "3d4d5f178e5e3cfdb42a43f1"
                        "5e74de300dab30f6b5aad720"
                        "1feefa29e9f8a1a9967693a2"
                    |]
                let ind = count % (keys.Length |> int64) |> int
                keys[ind]
                
            $"https://v6.exchangerate-api.com/v6/%s{apiKey ()}/latest/USD"
            
        (*
            {
	            "result": "success",
	            "documentation": "https://www.exchangerate-api.com/docs",
	            "terms_of_use": "https://www.exchangerate-api.com/terms",
	            "time_last_update_unix": 1585267200,
	            "time_last_update_utc": "Fri, 27 Mar 2020 00:00:00 +0000",
	            "time_next_update_unix": 1585353700,
	            "time_next_update_utc": "Sat, 28 Mar 2020 00:00:00 +0000",
	            "base_code": "USD",
	            "conversion_rates": {
		            "USD": 1,
		            "AUD": 1.4817,
		            "BGN": 1.7741,
		            "CAD": 1.3168, etc. etc.
	            }
            }
        *)
        let url = genUrl()
        let code,content = url |> httpGet None 
        let mutable date = DateTime.MinValue
        
        if code = "OK" then
            let paras = content |> Util.Json.jsonstr__items

            if paras.ContainsKey "result" && paras["result"] = "success" then
                try
                    let re = JsonDocument.Parse(content).RootElement

                    let e1,d = re.TryGetProperty("time_last_update_unix")
                    if e1 then
                        date <-
                            let d1 = d.ToString()
                            if d1.Length = 10 then
                                d1 + "000"
                            else
                                d1
                            |> parse_int64
                            |> Util.Time.unixtime__wintime

                    let e,conversion_rates = re.TryGetProperty("conversion_rates")
                    if e then
                        let curPairs = 
                            conversion_rates.EnumerateObject()
                            |> Seq.filter (fun o ->
                                o.Value.TryGetDouble() |> fst &&
                                Array.contains (o.Name.ToUpper()) curs
                            )
                            |> Seq.map (fun o -> $"%s{o.Name}:%f{o.Value.GetDouble()}")
                            |> String.concat ","
                        true, curPairs
                    else
                        false, "No rate data"
                with
                | e ->
                    false, e.ToString()
            else
                false, "Remote rate data error"
        else
            false, $"Can not do request: %s{url}"
        |> fun (s,m) ->
            msg <- m
            original <- content
            date_lastUpdate <- date.Ticks
            count <- count + 1L
            if s then
                source <- "2"
            s

    let frankfurter () =
        msg <- ""
        original <- ""
        date_lastUpdate <- 0L
        
        let url = "https://api.frankfurter.app/latest?from=USD"
        (*
            {
              "amount": 1.0,
              "base": "USD",
              "date": "2024-01-22",
              "rates": {
                "AUD": 1.517,
                "BGN": 1.796,
                "BRL": 4.9346,
                ...
              }
            }
        *)
    
        let code,content = httpGet None url
        let mutable date = DateTime.MinValue
        if code = "OK" then
            try
                let re = JsonDocument.Parse(content).RootElement
      
                let e_date,d = re.TryGetProperty("date")
                if e_date then
                    date <-
                        d.ToString().Replace("-","")
                        |> Util.Time.parse None
                        
                let e_rates,conversion_rates = re.TryGetProperty("rates")
                if e_rates then
                    let curPairs = 
                        conversion_rates.EnumerateObject()
                        |> Seq.filter (fun o ->
                            o.Value.TryGetDouble() |> fst &&
                            Array.contains (o.Name.ToUpper()) curs
                        )
                        |> Seq.map (fun o -> $"%s{o.Name}:%f{o.Value.GetDouble()}")
                        |> String.concat ","
                    curPairs |> printfn "%A"
                    true, curPairs
                else
                    false, "No rate data"
            with
            | e ->
                false, e.ToString()
        else
            false, $"Can not do request: %s{url}"
        |> fun (s,m) ->
            msg <- m
            original <- content
            date_lastUpdate <- date.Ticks
            if s then
                source <- "3"
            s

    let emitData status =
        let sendPath = "/api/dist/submitCurRates"
        let err = 
            if status then
                "OK"
            else
                "ERROR"

        if Array.contains machineName [|"PERSUIT-PC";"GNEWSAZURE"|] then
            output ""
            output $"--------------{DateTime.UtcNow}--------------"
            output source
            output msg
        
        let postData =
            [|
                $"\"Error\":\"%s{err}\""
                $"\"RateData\":\"%s{msg |> encodeAnd2Base}\""
                $"\"OriginalData\":\"%s{original |> encodeAnd2Base}\""
                $"\"lastUpdateTicks\":%d{date_lastUpdate}"
            |]
            |> fastConcat ","
            |> fun str ->
                "{" + str + "}"
        
        remotes
        |> split ";"
        |> Array.iter (fun remote ->
            sendDataWithResp (remote + sendPath) postData |> ignore
        )
        
    while true do
        let s1 = msn_forex ()
        
        if s1 = false then
            let s2 = exchangeRateApi ()
            if s2 = false then
                frankfurter ()
            else
                s2
        else
            s1
        |> emitData

        Threading.Thread.Sleep (2 * 1000)
    
    ()
    
    
type CrawlerEnum =
| CoinTx
| CoinMarket
| News
| ExchangeRates

[<EntryPoint>]
let main args =

    [|
        // aTasks CoinTx           coinTx          "BlockChainTransaction"
        //aTasks News             news            "News"
        // aTasks CoinMarket       coinMarket      "CoinMarket"
        // aTasks ExchangeRates    exchangeRates   "ExchangeRates"
    |]
    |> Array.concat
    |> Async.Parallel
    |> Async.RunSynchronously
    |> ignore

    0
