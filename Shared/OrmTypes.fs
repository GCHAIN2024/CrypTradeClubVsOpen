module Shared.OrmTypes

open LanguagePrimitives

open System
open System.Collections.Generic
open System.Text

open Util.Cat
open Util.Perf
open Util.Measures
open Util.Db
open Util.DbQuery
open Util.DbTx
open Util.Bin
open Util.Text
open Util.Json
open Util.Orm

open PreOrm

// [Ca_Address] (ADDRESS)

type addressTypeEnum = 
| Default = 0 // 默认
| Biz = 1 // 机构
| EndUser = 2 // 用户

let addressTypeEnums = [| addressTypeEnum.Default; addressTypeEnum.Biz; addressTypeEnum.EndUser |]
let addressTypeEnumstrs = [| "addressTypeEnum"; "addressTypeEnum"; "addressTypeEnum" |]
let addressTypeNum = 3

let int__addressTypeEnum v =
    match v with
    | 0 -> Some addressTypeEnum.Default
    | 1 -> Some addressTypeEnum.Biz
    | 2 -> Some addressTypeEnum.EndUser
    | _ -> None

let str__addressTypeEnum s =
    match s with
    | "Default" -> Some addressTypeEnum.Default
    | "Biz" -> Some addressTypeEnum.Biz
    | "EndUser" -> Some addressTypeEnum.EndUser
    | _ -> None

let addressTypeEnum__caption e =
    match e with
    | addressTypeEnum.Default -> "默认"
    | addressTypeEnum.Biz -> "机构"
    | addressTypeEnum.EndUser -> "用户"
    | _ -> ""

type pADDRESS = {
mutable Caption: Caption
mutable Bind: Integer
mutable Type: addressTypeEnum
mutable Line1: Chars
mutable Line2: Chars
mutable State: Chars
mutable County: Chars
mutable Town: Chars
mutable Contact: Chars
mutable Tel: Chars
mutable Email: Chars
mutable Zip: Chars
mutable City: FK
mutable Country: FK
mutable Remarks: Text}


type ADDRESS = Rcd<pADDRESS>

let ADDRESS_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Bind],[Type],[Line1],[Line2],[State],[County],[Town],[Contact],[Tel],[Email],[Zip],[City],[Country],[Remarks]"

let pADDRESS_fieldordersArray = [|
    "Caption"
    "Bind"
    "Type"
    "Line1"
    "Line2"
    "State"
    "County"
    "Town"
    "Contact"
    "Tel"
    "Email"
    "Zip"
    "City"
    "Country"
    "Remarks" |]

let ADDRESS_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Bind]=@Bind,[Type]=@Type,[Line1]=@Line1,[Line2]=@Line2,[State]=@State,[County]=@County,[Town]=@Town,[Contact]=@Contact,[Tel]=@Tel,[Email]=@Email,[Zip]=@Zip,[City]=@City,[Country]=@Country,[Remarks]=@Remarks"

let pADDRESS_fields = [|
    Caption("Caption", 256)
    Integer("Bind")
    SelectLines("Type", [| ("Default","默认");("Biz","机构");("EndUser","用户") |])
    Chars("Line1", 300)
    Chars("Line2", 300)
    Chars("State", 16)
    Chars("County", 16)
    Chars("Town", 16)
    Chars("Contact", 64)
    Chars("Tel", 20)
    Chars("Email", 256)
    Chars("Zip", 16)
    FK("City")
    FK("Country")
    Text("Remarks") |]

let pADDRESS_empty(): pADDRESS = {
    Caption = ""
    Bind = 0L
    Type = EnumOfValue 0
    Line1 = ""
    Line2 = ""
    State = ""
    County = ""
    Town = ""
    Contact = ""
    Tel = ""
    Email = ""
    Zip = ""
    City = 0L
    Country = 0L
    Remarks = "" }

let ADDRESS_id = ref 0L
let ADDRESS_count = ref 0
let ADDRESS_table = "Ca_Address"

// [Ca_Airport] (AIRPORT)

type pAIRPORT = {
mutable Code3IATA: Chars
mutable Code4ICAO: Chars
mutable Caption: Chars
mutable CaptionEn: Chars
mutable Country: FK
mutable City: FK
mutable IsMetropolitan: Boolean}


type AIRPORT = Rcd<pAIRPORT>

let AIRPORT_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code3IATA],[Code4ICAO],[Caption],[CaptionEn],[Country],[City],[IsMetropolitan]"

let pAIRPORT_fieldordersArray = [|
    "Code3IATA"
    "Code4ICAO"
    "Caption"
    "CaptionEn"
    "Country"
    "City"
    "IsMetropolitan" |]

let AIRPORT_sql_update = "[Updatedat]=@Updatedat,[Code3IATA]=@Code3IATA,[Code4ICAO]=@Code4ICAO,[Caption]=@Caption,[CaptionEn]=@CaptionEn,[Country]=@Country,[City]=@City,[IsMetropolitan]=@IsMetropolitan"

let pAIRPORT_fields = [|
    Chars("Code3IATA", 3)
    Chars("Code4ICAO", 4)
    Chars("Caption", 64)
    Chars("CaptionEn", 64)
    FK("Country")
    FK("City")
    Boolean("IsMetropolitan") |]

let pAIRPORT_empty(): pAIRPORT = {
    Code3IATA = ""
    Code4ICAO = ""
    Caption = ""
    CaptionEn = ""
    Country = 0L
    City = 0L
    IsMetropolitan = true }

let AIRPORT_id = ref 1001L
let AIRPORT_count = ref 0
let AIRPORT_table = "Ca_Airport"

// [Ca_Biz] (BIZ)

type pBIZ = {
mutable Code: Chars
mutable Caption: Caption
mutable Parent: FK
mutable BasicAcct: FK
mutable Desc: Text
mutable Website: Link
mutable Icon: Link
mutable City: FK
mutable Country: FK
mutable Lang: FK
mutable IsSocial: Boolean
mutable IsCmsSource: Boolean
mutable IsPay: Boolean
mutable MomentLatest: FK
mutable CountFollowers: Integer
mutable CountFollows: Integer
mutable CountMoments: Integer
mutable CountViews: Integer
mutable CountComments: Integer
mutable CountThumbUps: Integer
mutable CountThumbDns: Integer
mutable IsCrawling: Boolean
mutable IsGSeries: Boolean
mutable RemarksCentral: Text
mutable Agent: FK
mutable SiteCats: Text
mutable ConfiguredCats: Text}


type BIZ = Rcd<pBIZ>

let BIZ_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Caption],[Parent],[BasicAcct],[Desc],[Website],[Icon],[City],[Country],[Lang],[IsSocial],[IsCmsSource],[IsPay],[MomentLatest],[CountFollowers],[CountFollows],[CountMoments],[CountViews],[CountComments],[CountThumbUps],[CountThumbDns],[IsCrawling],[IsGSeries],[RemarksCentral],[Agent],[SiteCats],[ConfiguredCats]"

let pBIZ_fieldordersArray = [|
    "Code"
    "Caption"
    "Parent"
    "BasicAcct"
    "Desc"
    "Website"
    "Icon"
    "City"
    "Country"
    "Lang"
    "IsSocial"
    "IsCmsSource"
    "IsPay"
    "MomentLatest"
    "CountFollowers"
    "CountFollows"
    "CountMoments"
    "CountViews"
    "CountComments"
    "CountThumbUps"
    "CountThumbDns"
    "IsCrawling"
    "IsGSeries"
    "RemarksCentral"
    "Agent"
    "SiteCats"
    "ConfiguredCats" |]

let BIZ_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Caption]=@Caption,[Parent]=@Parent,[BasicAcct]=@BasicAcct,[Desc]=@Desc,[Website]=@Website,[Icon]=@Icon,[City]=@City,[Country]=@Country,[Lang]=@Lang,[IsSocial]=@IsSocial,[IsCmsSource]=@IsCmsSource,[IsPay]=@IsPay,[MomentLatest]=@MomentLatest,[CountFollowers]=@CountFollowers,[CountFollows]=@CountFollows,[CountMoments]=@CountMoments,[CountViews]=@CountViews,[CountComments]=@CountComments,[CountThumbUps]=@CountThumbUps,[CountThumbDns]=@CountThumbDns,[IsCrawling]=@IsCrawling,[IsGSeries]=@IsGSeries,[RemarksCentral]=@RemarksCentral,[Agent]=@Agent,[SiteCats]=@SiteCats,[ConfiguredCats]=@ConfiguredCats"

let pBIZ_fields = [|
    Chars("Code", 256)
    Caption("Caption", 256)
    FK("Parent")
    FK("BasicAcct")
    Text("Desc")
    Link("Website", 256)
    Link("Icon", 256)
    FK("City")
    FK("Country")
    FK("Lang")
    Boolean("IsSocial")
    Boolean("IsCmsSource")
    Boolean("IsPay")
    FK("MomentLatest")
    Integer("CountFollowers")
    Integer("CountFollows")
    Integer("CountMoments")
    Integer("CountViews")
    Integer("CountComments")
    Integer("CountThumbUps")
    Integer("CountThumbDns")
    Boolean("IsCrawling")
    Boolean("IsGSeries")
    Text("RemarksCentral")
    FK("Agent")
    Text("SiteCats")
    Text("ConfiguredCats") |]

let pBIZ_empty(): pBIZ = {
    Code = ""
    Caption = ""
    Parent = 0L
    BasicAcct = 0L
    Desc = ""
    Website = ""
    Icon = ""
    City = 0L
    Country = 0L
    Lang = 0L
    IsSocial = true
    IsCmsSource = true
    IsPay = true
    MomentLatest = 0L
    CountFollowers = 0L
    CountFollows = 0L
    CountMoments = 0L
    CountViews = 0L
    CountComments = 0L
    CountThumbUps = 0L
    CountThumbDns = 0L
    IsCrawling = true
    IsGSeries = true
    RemarksCentral = ""
    Agent = 0L
    SiteCats = ""
    ConfiguredCats = "" }

let BIZ_id = ref 75865464L
let BIZ_count = ref 0
let BIZ_table = "Ca_Biz"

// [Ca_Cat] (CAT)

type catStateEnum = 
| Normal = 0 // 正常
| Hidden = 1 // 隐藏
| Obsolete = 2 // 过时

let catStateEnums = [| catStateEnum.Normal; catStateEnum.Hidden; catStateEnum.Obsolete |]
let catStateEnumstrs = [| "catStateEnum"; "catStateEnum"; "catStateEnum" |]
let catStateNum = 3

let int__catStateEnum v =
    match v with
    | 0 -> Some catStateEnum.Normal
    | 1 -> Some catStateEnum.Hidden
    | 2 -> Some catStateEnum.Obsolete
    | _ -> None

let str__catStateEnum s =
    match s with
    | "Normal" -> Some catStateEnum.Normal
    | "Hidden" -> Some catStateEnum.Hidden
    | "Obsolete" -> Some catStateEnum.Obsolete
    | _ -> None

let catStateEnum__caption e =
    match e with
    | catStateEnum.Normal -> "正常"
    | catStateEnum.Hidden -> "隐藏"
    | catStateEnum.Obsolete -> "过时"
    | _ -> ""

type pCAT = {
mutable Caption: Chars
mutable Lang: FK
mutable Zh: FK
mutable Parent: FK
mutable State: catStateEnum}


type CAT = Rcd<pCAT>

let CAT_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Lang],[Zh],[Parent],[State]"

let pCAT_fieldordersArray = [|
    "Caption"
    "Lang"
    "Zh"
    "Parent"
    "State" |]

let CAT_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Lang]=@Lang,[Zh]=@Zh,[Parent]=@Parent,[State]=@State"

let pCAT_fields = [|
    Chars("Caption", 64)
    FK("Lang")
    FK("Zh")
    FK("Parent")
    SelectLines("State", [| ("Normal","正常");("Hidden","隐藏");("Obsolete","过时") |]) |]

let pCAT_empty(): pCAT = {
    Caption = ""
    Lang = 0L
    Zh = 0L
    Parent = 0L
    State = EnumOfValue 0 }

let CAT_id = ref 0L
let CAT_count = ref 0
let CAT_table = "Ca_Cat"

// [Ca_City] (CITY)

type pCITY = {
mutable Name: Chars
mutable MetropolitanCode3IATA: Chars
mutable NameEn: Chars
mutable Country: FK
mutable Place: FK
mutable Icon: Link
mutable Tel: Chars}


type CITY = Rcd<pCITY>

let CITY_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Name],[MetropolitanCode3IATA],[NameEn],[Country],[Place],[Icon],[Tel]"

let pCITY_fieldordersArray = [|
    "Name"
    "MetropolitanCode3IATA"
    "NameEn"
    "Country"
    "Place"
    "Icon"
    "Tel" |]

let CITY_sql_update = "[Updatedat]=@Updatedat,[Name]=@Name,[MetropolitanCode3IATA]=@MetropolitanCode3IATA,[NameEn]=@NameEn,[Country]=@Country,[Place]=@Place,[Icon]=@Icon,[Tel]=@Tel"

let pCITY_fields = [|
    Chars("Name", 64)
    Chars("MetropolitanCode3IATA", 3)
    Chars("NameEn", 64)
    FK("Country")
    FK("Place")
    Link("Icon", 256)
    Chars("Tel", 4) |]

let pCITY_empty(): pCITY = {
    Name = ""
    MetropolitanCode3IATA = ""
    NameEn = ""
    Country = 0L
    Place = 0L
    Icon = ""
    Tel = "" }

let CITY_id = ref 1001L
let CITY_count = ref 0
let CITY_table = "Ca_City"

// [Ca_Country] (CRY)

type pCRY = {
mutable Code2: Chars
mutable Caption: Chars
mutable Fullname: Chars
mutable Icon: Link
mutable Tel: Chars
mutable Cur: FK
mutable Capital: FK
mutable Place: FK
mutable Lang: FK}


type CRY = Rcd<pCRY>

let CRY_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code2],[Caption],[Fullname],[Icon],[Tel],[Cur],[Capital],[Place],[Lang]"

let pCRY_fieldordersArray = [|
    "Code2"
    "Caption"
    "Fullname"
    "Icon"
    "Tel"
    "Cur"
    "Capital"
    "Place"
    "Lang" |]

let CRY_sql_update = "[Updatedat]=@Updatedat,[Code2]=@Code2,[Caption]=@Caption,[Fullname]=@Fullname,[Icon]=@Icon,[Tel]=@Tel,[Cur]=@Cur,[Capital]=@Capital,[Place]=@Place,[Lang]=@Lang"

let pCRY_fields = [|
    Chars("Code2", 2)
    Chars("Caption", 64)
    Chars("Fullname", 256)
    Link("Icon", 256)
    Chars("Tel", 4)
    FK("Cur")
    FK("Capital")
    FK("Place")
    FK("Lang") |]

let pCRY_empty(): pCRY = {
    Code2 = ""
    Caption = ""
    Fullname = ""
    Icon = ""
    Tel = ""
    Cur = 0L
    Capital = 0L
    Place = 0L
    Lang = 0L }

let CRY_id = ref 1001L
let CRY_count = ref 0
let CRY_table = "Ca_Country"

// [Ca_Cur] (CUR)

type curCurTypeEnum = 
| Fiat = 0 // 法币
| Crypto = 1 // 数字币

let curCurTypeEnums = [| curCurTypeEnum.Fiat; curCurTypeEnum.Crypto |]
let curCurTypeEnumstrs = [| "curCurTypeEnum"; "curCurTypeEnum" |]
let curCurTypeNum = 2

let int__curCurTypeEnum v =
    match v with
    | 0 -> Some curCurTypeEnum.Fiat
    | 1 -> Some curCurTypeEnum.Crypto
    | _ -> None

let str__curCurTypeEnum s =
    match s with
    | "Fiat" -> Some curCurTypeEnum.Fiat
    | "Crypto" -> Some curCurTypeEnum.Crypto
    | _ -> None

let curCurTypeEnum__caption e =
    match e with
    | curCurTypeEnum.Fiat -> "法币"
    | curCurTypeEnum.Crypto -> "数字币"
    | _ -> ""

type pCUR = {
mutable Code: Chars
mutable Caption: Caption
mutable Hidden: Boolean
mutable IsSac: Boolean
mutable IsTransfer: Boolean
mutable IsCash: Boolean
mutable EnableReward: Boolean
mutable EnableOTC: Boolean
mutable Icon: Link
mutable CurType: curCurTypeEnum
mutable Dec: Integer
mutable AnchorRate: Float
mutable Freezable: Boolean
mutable Authorizable: Boolean
mutable ChaninID: Chars
mutable ChaninName: Chars
mutable ContractAddress: Chars
mutable WalletAddress: Chars
mutable BaseRate: Float}


type CUR = Rcd<pCUR>

let CUR_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Caption],[Hidden],[IsSac],[IsTransfer],[IsCash],[EnableReward],[EnableOTC],[Icon],[CurType],[Dec],[AnchorRate],[Freezable],[Authorizable],[ChaninID],[ChaninName],[ContractAddress],[WalletAddress],[BaseRate]"

let pCUR_fieldordersArray = [|
    "Code"
    "Caption"
    "Hidden"
    "IsSac"
    "IsTransfer"
    "IsCash"
    "EnableReward"
    "EnableOTC"
    "Icon"
    "CurType"
    "Dec"
    "AnchorRate"
    "Freezable"
    "Authorizable"
    "ChaninID"
    "ChaninName"
    "ContractAddress"
    "WalletAddress"
    "BaseRate" |]

let CUR_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Caption]=@Caption,[Hidden]=@Hidden,[IsSac]=@IsSac,[IsTransfer]=@IsTransfer,[IsCash]=@IsCash,[EnableReward]=@EnableReward,[EnableOTC]=@EnableOTC,[Icon]=@Icon,[CurType]=@CurType,[Dec]=@Dec,[AnchorRate]=@AnchorRate,[Freezable]=@Freezable,[Authorizable]=@Authorizable,[ChaninID]=@ChaninID,[ChaninName]=@ChaninName,[ContractAddress]=@ContractAddress,[WalletAddress]=@WalletAddress,[BaseRate]=@BaseRate"

let pCUR_fields = [|
    Chars("Code", 16)
    Caption("Caption", 64)
    Boolean("Hidden")
    Boolean("IsSac")
    Boolean("IsTransfer")
    Boolean("IsCash")
    Boolean("EnableReward")
    Boolean("EnableOTC")
    Link("Icon", 512)
    SelectLines("CurType", [| ("Fiat","法币");("Crypto","数字币") |])
    Integer("Dec")
    Float("AnchorRate")
    Boolean("Freezable")
    Boolean("Authorizable")
    Chars("ChaninID", 256)
    Chars("ChaninName", 256)
    Chars("ContractAddress", 256)
    Chars("WalletAddress", 256)
    Float("BaseRate") |]

let pCUR_empty(): pCUR = {
    Code = ""
    Caption = ""
    Hidden = true
    IsSac = true
    IsTransfer = true
    IsCash = true
    EnableReward = true
    EnableOTC = true
    Icon = ""
    CurType = EnumOfValue 0
    Dec = 0L
    AnchorRate = 0.0
    Freezable = true
    Authorizable = true
    ChaninID = ""
    ChaninName = ""
    ContractAddress = ""
    WalletAddress = ""
    BaseRate = 0.0 }

let CUR_id = ref 1001L
let CUR_count = ref 0
let CUR_table = "Ca_Cur"

// [Ca_EndUser] (EU)

type euGenderEnum = 
| Unknown = 0 // 未知
| Male = 1 // 男
| Female = 2 // 女

let euGenderEnums = [| euGenderEnum.Unknown; euGenderEnum.Male; euGenderEnum.Female |]
let euGenderEnumstrs = [| "euGenderEnum"; "euGenderEnum"; "euGenderEnum" |]
let euGenderNum = 3

let int__euGenderEnum v =
    match v with
    | 0 -> Some euGenderEnum.Unknown
    | 1 -> Some euGenderEnum.Male
    | 2 -> Some euGenderEnum.Female
    | _ -> None

let str__euGenderEnum s =
    match s with
    | "Unknown" -> Some euGenderEnum.Unknown
    | "Male" -> Some euGenderEnum.Male
    | "Female" -> Some euGenderEnum.Female
    | _ -> None

let euGenderEnum__caption e =
    match e with
    | euGenderEnum.Unknown -> "未知"
    | euGenderEnum.Male -> "男"
    | euGenderEnum.Female -> "女"
    | _ -> ""

type euStatusEnum = 
| Normal = 0 // 正常
| Frozen = 1 // 冻结
| Terminated = 2 // 注销

let euStatusEnums = [| euStatusEnum.Normal; euStatusEnum.Frozen; euStatusEnum.Terminated |]
let euStatusEnumstrs = [| "euStatusEnum"; "euStatusEnum"; "euStatusEnum" |]
let euStatusNum = 3

let int__euStatusEnum v =
    match v with
    | 0 -> Some euStatusEnum.Normal
    | 1 -> Some euStatusEnum.Frozen
    | 2 -> Some euStatusEnum.Terminated
    | _ -> None

let str__euStatusEnum s =
    match s with
    | "Normal" -> Some euStatusEnum.Normal
    | "Frozen" -> Some euStatusEnum.Frozen
    | "Terminated" -> Some euStatusEnum.Terminated
    | _ -> None

let euStatusEnum__caption e =
    match e with
    | euStatusEnum.Normal -> "正常"
    | euStatusEnum.Frozen -> "冻结"
    | euStatusEnum.Terminated -> "注销"
    | _ -> ""

type euAdminEnum = 
| None = 0 // 无
| Admin = 1 // 管理员

let euAdminEnums = [| euAdminEnum.None; euAdminEnum.Admin |]
let euAdminEnumstrs = [| "euAdminEnum"; "euAdminEnum" |]
let euAdminNum = 2

let int__euAdminEnum v =
    match v with
    | 0 -> Some euAdminEnum.None
    | 1 -> Some euAdminEnum.Admin
    | _ -> None

let str__euAdminEnum s =
    match s with
    | "None" -> Some euAdminEnum.None
    | "Admin" -> Some euAdminEnum.Admin
    | _ -> None

let euAdminEnum__caption e =
    match e with
    | euAdminEnum.None -> "无"
    | euAdminEnum.Admin -> "管理员"
    | _ -> ""

type euBizPartnerEnum = 
| None = 0 // None
| Partner = 1 // 

let euBizPartnerEnums = [| euBizPartnerEnum.None; euBizPartnerEnum.Partner |]
let euBizPartnerEnumstrs = [| "euBizPartnerEnum"; "euBizPartnerEnum" |]
let euBizPartnerNum = 2

let int__euBizPartnerEnum v =
    match v with
    | 0 -> Some euBizPartnerEnum.None
    | 1 -> Some euBizPartnerEnum.Partner
    | _ -> None

let str__euBizPartnerEnum s =
    match s with
    | "None" -> Some euBizPartnerEnum.None
    | "Partner" -> Some euBizPartnerEnum.Partner
    | _ -> None

let euBizPartnerEnum__caption e =
    match e with
    | euBizPartnerEnum.None -> "None"
    | euBizPartnerEnum.Partner -> ""
    | _ -> ""

type euVerifyEnum = 
| Normal = 0 // 常规
| Verified = 1 // 认证

let euVerifyEnums = [| euVerifyEnum.Normal; euVerifyEnum.Verified |]
let euVerifyEnumstrs = [| "euVerifyEnum"; "euVerifyEnum" |]
let euVerifyNum = 2

let int__euVerifyEnum v =
    match v with
    | 0 -> Some euVerifyEnum.Normal
    | 1 -> Some euVerifyEnum.Verified
    | _ -> None

let str__euVerifyEnum s =
    match s with
    | "Normal" -> Some euVerifyEnum.Normal
    | "Verified" -> Some euVerifyEnum.Verified
    | _ -> None

let euVerifyEnum__caption e =
    match e with
    | euVerifyEnum.Normal -> "常规"
    | euVerifyEnum.Verified -> "认证"
    | _ -> ""

type pEU = {
mutable Caption: Caption
mutable Username: Caption
mutable SocialAuthBiz: FK
mutable SocialAuthId: Text
mutable SocialAuthAvatar: Text
mutable Email: Chars
mutable Tel: Chars
mutable Gender: euGenderEnum
mutable Status: euStatusEnum
mutable Admin: euAdminEnum
mutable BizPartner: euBizPartnerEnum
mutable Privilege: Integer
mutable Verify: euVerifyEnum
mutable Pwd: Chars
mutable Online: Boolean
mutable Icon: Link
mutable Background: Link
mutable BasicAcct: FK
mutable Citizen: FK
mutable Refer: Caption
mutable Referer: FK
mutable Url: Text
mutable About: Text}


type EU = Rcd<pEU>

let EU_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Username],[SocialAuthBiz],[SocialAuthId],[SocialAuthAvatar],[Email],[Tel],[Gender],[Status],[Admin],[BizPartner],[Privilege],[Verify],[Pwd],[Online],[Icon],[Background],[BasicAcct],[Citizen],[Refer],[Referer],[Url],[About]"

let pEU_fieldordersArray = [|
    "Caption"
    "Username"
    "SocialAuthBiz"
    "SocialAuthId"
    "SocialAuthAvatar"
    "Email"
    "Tel"
    "Gender"
    "Status"
    "Admin"
    "BizPartner"
    "Privilege"
    "Verify"
    "Pwd"
    "Online"
    "Icon"
    "Background"
    "BasicAcct"
    "Citizen"
    "Refer"
    "Referer"
    "Url"
    "About" |]

let EU_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Username]=@Username,[SocialAuthBiz]=@SocialAuthBiz,[SocialAuthId]=@SocialAuthId,[SocialAuthAvatar]=@SocialAuthAvatar,[Email]=@Email,[Tel]=@Tel,[Gender]=@Gender,[Status]=@Status,[Admin]=@Admin,[BizPartner]=@BizPartner,[Privilege]=@Privilege,[Verify]=@Verify,[Pwd]=@Pwd,[Online]=@Online,[Icon]=@Icon,[Background]=@Background,[BasicAcct]=@BasicAcct,[Citizen]=@Citizen,[Refer]=@Refer,[Referer]=@Referer,[Url]=@Url,[About]=@About"

let pEU_fields = [|
    Caption("Caption", 64)
    Caption("Username", 64)
    FK("SocialAuthBiz")
    Text("SocialAuthId")
    Text("SocialAuthAvatar")
    Chars("Email", 256)
    Chars("Tel", 32)
    SelectLines("Gender", [| ("Unknown","未知");("Male","男");("Female","女") |])
    SelectLines("Status", [| ("Normal","正常");("Frozen","冻结");("Terminated","注销") |])
    SelectLines("Admin", [| ("None","无");("Admin","管理员") |])
    SelectLines("BizPartner", [| ("None","None");("Partner","") |])
    Integer("Privilege")
    SelectLines("Verify", [| ("Normal","常规");("Verified","认证") |])
    Chars("Pwd", 16)
    Boolean("Online")
    Link("Icon", 256)
    Link("Background", 256)
    FK("BasicAcct")
    FK("Citizen")
    Caption("Refer", 7)
    FK("Referer")
    Text("Url")
    Text("About") |]

let pEU_empty(): pEU = {
    Caption = ""
    Username = ""
    SocialAuthBiz = 0L
    SocialAuthId = ""
    SocialAuthAvatar = ""
    Email = ""
    Tel = ""
    Gender = EnumOfValue 0
    Status = EnumOfValue 0
    Admin = EnumOfValue 0
    BizPartner = EnumOfValue 0
    Privilege = 0L
    Verify = EnumOfValue 0
    Pwd = ""
    Online = true
    Icon = ""
    Background = ""
    BasicAcct = 0L
    Citizen = 0L
    Refer = ""
    Referer = 0L
    Url = ""
    About = "" }

let EU_id = ref 54367576L
let EU_count = ref 0
let EU_table = "Ca_EndUser"

// [Ca_File] (FILE)

type fileEncryptEnum = 
| None = 0 // 未加密
| Sys = 1 // 系统加密
| Usr = 2 // 用户加密

let fileEncryptEnums = [| fileEncryptEnum.None; fileEncryptEnum.Sys; fileEncryptEnum.Usr |]
let fileEncryptEnumstrs = [| "fileEncryptEnum"; "fileEncryptEnum"; "fileEncryptEnum" |]
let fileEncryptNum = 3

let int__fileEncryptEnum v =
    match v with
    | 0 -> Some fileEncryptEnum.None
    | 1 -> Some fileEncryptEnum.Sys
    | 2 -> Some fileEncryptEnum.Usr
    | _ -> None

let str__fileEncryptEnum s =
    match s with
    | "None" -> Some fileEncryptEnum.None
    | "Sys" -> Some fileEncryptEnum.Sys
    | "Usr" -> Some fileEncryptEnum.Usr
    | _ -> None

let fileEncryptEnum__caption e =
    match e with
    | fileEncryptEnum.None -> "未加密"
    | fileEncryptEnum.Sys -> "系统加密"
    | fileEncryptEnum.Usr -> "用户加密"
    | _ -> ""

type fileBindTypeEnum = 
| Sys = 0 // 系统
| EndUser = 1 // 用户
| Biz = 2 // 机构
| Group = 3 // 群

let fileBindTypeEnums = [| fileBindTypeEnum.Sys; fileBindTypeEnum.EndUser; fileBindTypeEnum.Biz; fileBindTypeEnum.Group |]
let fileBindTypeEnumstrs = [| "fileBindTypeEnum"; "fileBindTypeEnum"; "fileBindTypeEnum"; "fileBindTypeEnum" |]
let fileBindTypeNum = 4

let int__fileBindTypeEnum v =
    match v with
    | 0 -> Some fileBindTypeEnum.Sys
    | 1 -> Some fileBindTypeEnum.EndUser
    | 2 -> Some fileBindTypeEnum.Biz
    | 3 -> Some fileBindTypeEnum.Group
    | _ -> None

let str__fileBindTypeEnum s =
    match s with
    | "Sys" -> Some fileBindTypeEnum.Sys
    | "EndUser" -> Some fileBindTypeEnum.EndUser
    | "Biz" -> Some fileBindTypeEnum.Biz
    | "Group" -> Some fileBindTypeEnum.Group
    | _ -> None

let fileBindTypeEnum__caption e =
    match e with
    | fileBindTypeEnum.Sys -> "系统"
    | fileBindTypeEnum.EndUser -> "用户"
    | fileBindTypeEnum.Biz -> "机构"
    | fileBindTypeEnum.Group -> "群"
    | _ -> ""

type fileStateEnum = 
| Normal = 0 // 正常
| Canceled = 1 // 已取消
| Uploading = 2 // 上传中
| PendingTranscode = 3 // 待媒体转码
| PendingBlockchain = 4 // 待区块链同步
| Deleted = 5 // 已删除

let fileStateEnums = [| fileStateEnum.Normal; fileStateEnum.Canceled; fileStateEnum.Uploading; fileStateEnum.PendingTranscode; fileStateEnum.PendingBlockchain; fileStateEnum.Deleted |]
let fileStateEnumstrs = [| "fileStateEnum"; "fileStateEnum"; "fileStateEnum"; "fileStateEnum"; "fileStateEnum"; "fileStateEnum" |]
let fileStateNum = 6

let int__fileStateEnum v =
    match v with
    | 0 -> Some fileStateEnum.Normal
    | 1 -> Some fileStateEnum.Canceled
    | 2 -> Some fileStateEnum.Uploading
    | 3 -> Some fileStateEnum.PendingTranscode
    | 4 -> Some fileStateEnum.PendingBlockchain
    | 5 -> Some fileStateEnum.Deleted
    | _ -> None

let str__fileStateEnum s =
    match s with
    | "Normal" -> Some fileStateEnum.Normal
    | "Canceled" -> Some fileStateEnum.Canceled
    | "Uploading" -> Some fileStateEnum.Uploading
    | "PendingTranscode" -> Some fileStateEnum.PendingTranscode
    | "PendingBlockchain" -> Some fileStateEnum.PendingBlockchain
    | "Deleted" -> Some fileStateEnum.Deleted
    | _ -> None

let fileStateEnum__caption e =
    match e with
    | fileStateEnum.Normal -> "正常"
    | fileStateEnum.Canceled -> "已取消"
    | fileStateEnum.Uploading -> "上传中"
    | fileStateEnum.PendingTranscode -> "待媒体转码"
    | fileStateEnum.PendingBlockchain -> "待区块链同步"
    | fileStateEnum.Deleted -> "已删除"
    | _ -> ""

type fileFileTypeEnum = 
| Default = 0 // 默认
| Text = 1 // 文本
| Bin = 2 // 二进制
| Img = 3 // 图片
| Video = 4 // 视频

let fileFileTypeEnums = [| fileFileTypeEnum.Default; fileFileTypeEnum.Text; fileFileTypeEnum.Bin; fileFileTypeEnum.Img; fileFileTypeEnum.Video |]
let fileFileTypeEnumstrs = [| "fileFileTypeEnum"; "fileFileTypeEnum"; "fileFileTypeEnum"; "fileFileTypeEnum"; "fileFileTypeEnum" |]
let fileFileTypeNum = 5

let int__fileFileTypeEnum v =
    match v with
    | 0 -> Some fileFileTypeEnum.Default
    | 1 -> Some fileFileTypeEnum.Text
    | 2 -> Some fileFileTypeEnum.Bin
    | 3 -> Some fileFileTypeEnum.Img
    | 4 -> Some fileFileTypeEnum.Video
    | _ -> None

let str__fileFileTypeEnum s =
    match s with
    | "Default" -> Some fileFileTypeEnum.Default
    | "Text" -> Some fileFileTypeEnum.Text
    | "Bin" -> Some fileFileTypeEnum.Bin
    | "Img" -> Some fileFileTypeEnum.Img
    | "Video" -> Some fileFileTypeEnum.Video
    | _ -> None

let fileFileTypeEnum__caption e =
    match e with
    | fileFileTypeEnum.Default -> "默认"
    | fileFileTypeEnum.Text -> "文本"
    | fileFileTypeEnum.Bin -> "二进制"
    | fileFileTypeEnum.Img -> "图片"
    | fileFileTypeEnum.Video -> "视频"
    | _ -> ""

type pFILE = {
mutable Caption: Caption
mutable Encrypt: fileEncryptEnum
mutable SHA256: Text
mutable Size: Integer
mutable Bind: Integer
mutable BindType: fileBindTypeEnum
mutable State: fileStateEnum
mutable Folder: FK
mutable FileType: fileFileTypeEnum
mutable JSON: Text}


type FILE = Rcd<pFILE>

let FILE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Encrypt],[SHA256],[Size],[Bind],[BindType],[State],[Folder],[FileType],[JSON]"

let pFILE_fieldordersArray = [|
    "Caption"
    "Encrypt"
    "SHA256"
    "Size"
    "Bind"
    "BindType"
    "State"
    "Folder"
    "FileType"
    "JSON" |]

let FILE_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Encrypt]=@Encrypt,[SHA256]=@SHA256,[Size]=@Size,[Bind]=@Bind,[BindType]=@BindType,[State]=@State,[Folder]=@Folder,[FileType]=@FileType,[JSON]=@JSON"

let pFILE_fields = [|
    Caption("Caption", 256)
    SelectLines("Encrypt", [| ("None","未加密");("Sys","系统加密");("Usr","用户加密") |])
    Text("SHA256")
    Integer("Size")
    Integer("Bind")
    SelectLines("BindType", [| ("Sys","系统");("EndUser","用户");("Biz","机构");("Group","群") |])
    SelectLines("State", [| ("Normal","正常");("Canceled","已取消");("Uploading","上传中");("PendingTranscode","待媒体转码");("PendingBlockchain","待区块链同步");("Deleted","已删除") |])
    FK("Folder")
    SelectLines("FileType", [| ("Default","默认");("Text","文本");("Bin","二进制");("Img","图片");("Video","视频") |])
    Text("JSON") |]

let pFILE_empty(): pFILE = {
    Caption = ""
    Encrypt = EnumOfValue 0
    SHA256 = ""
    Size = 0L
    Bind = 0L
    BindType = EnumOfValue 0
    State = EnumOfValue 0
    Folder = 0L
    FileType = EnumOfValue 0
    JSON = "" }

let FILE_id = ref 65464758L
let FILE_count = ref 0
let FILE_table = "Ca_File"

// [Ca_Folder] (FOLDER)

type folderEncryptEnum = 
| None = 0 // 未加密
| Sys = 1 // 系统加密
| Usr = 2 // 用户加密

let folderEncryptEnums = [| folderEncryptEnum.None; folderEncryptEnum.Sys; folderEncryptEnum.Usr |]
let folderEncryptEnumstrs = [| "folderEncryptEnum"; "folderEncryptEnum"; "folderEncryptEnum" |]
let folderEncryptNum = 3

let int__folderEncryptEnum v =
    match v with
    | 0 -> Some folderEncryptEnum.None
    | 1 -> Some folderEncryptEnum.Sys
    | 2 -> Some folderEncryptEnum.Usr
    | _ -> None

let str__folderEncryptEnum s =
    match s with
    | "None" -> Some folderEncryptEnum.None
    | "Sys" -> Some folderEncryptEnum.Sys
    | "Usr" -> Some folderEncryptEnum.Usr
    | _ -> None

let folderEncryptEnum__caption e =
    match e with
    | folderEncryptEnum.None -> "未加密"
    | folderEncryptEnum.Sys -> "系统加密"
    | folderEncryptEnum.Usr -> "用户加密"
    | _ -> ""

type folderBindTypeEnum = 
| Sys = 0 // 系统
| EndUser = 1 // 用户
| Biz = 2 // 机构
| Group = 3 // 群

let folderBindTypeEnums = [| folderBindTypeEnum.Sys; folderBindTypeEnum.EndUser; folderBindTypeEnum.Biz; folderBindTypeEnum.Group |]
let folderBindTypeEnumstrs = [| "folderBindTypeEnum"; "folderBindTypeEnum"; "folderBindTypeEnum"; "folderBindTypeEnum" |]
let folderBindTypeNum = 4

let int__folderBindTypeEnum v =
    match v with
    | 0 -> Some folderBindTypeEnum.Sys
    | 1 -> Some folderBindTypeEnum.EndUser
    | 2 -> Some folderBindTypeEnum.Biz
    | 3 -> Some folderBindTypeEnum.Group
    | _ -> None

let str__folderBindTypeEnum s =
    match s with
    | "Sys" -> Some folderBindTypeEnum.Sys
    | "EndUser" -> Some folderBindTypeEnum.EndUser
    | "Biz" -> Some folderBindTypeEnum.Biz
    | "Group" -> Some folderBindTypeEnum.Group
    | _ -> None

let folderBindTypeEnum__caption e =
    match e with
    | folderBindTypeEnum.Sys -> "系统"
    | folderBindTypeEnum.EndUser -> "用户"
    | folderBindTypeEnum.Biz -> "机构"
    | folderBindTypeEnum.Group -> "群"
    | _ -> ""

type pFOLDER = {
mutable Caption: Caption
mutable Encrypt: folderEncryptEnum
mutable Bind: Integer
mutable BindType: folderBindTypeEnum
mutable Parent: FK}


type FOLDER = Rcd<pFOLDER>

let FOLDER_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Encrypt],[Bind],[BindType],[Parent]"

let pFOLDER_fieldordersArray = [|
    "Caption"
    "Encrypt"
    "Bind"
    "BindType"
    "Parent" |]

let FOLDER_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Encrypt]=@Encrypt,[Bind]=@Bind,[BindType]=@BindType,[Parent]=@Parent"

let pFOLDER_fields = [|
    Caption("Caption", 256)
    SelectLines("Encrypt", [| ("None","未加密");("Sys","系统加密");("Usr","用户加密") |])
    Integer("Bind")
    SelectLines("BindType", [| ("Sys","系统");("EndUser","用户");("Biz","机构");("Group","群") |])
    FK("Parent") |]

let pFOLDER_empty(): pFOLDER = {
    Caption = ""
    Encrypt = EnumOfValue 0
    Bind = 0L
    BindType = EnumOfValue 0
    Parent = 0L }

let FOLDER_id = ref 54665847L
let FOLDER_count = ref 0
let FOLDER_table = "Ca_Folder"

// [Ca_Lang] (LANG)

type langTextDirectionEnum = 
| Default = 0 // 默认
| RightToLeft = 1 // 从右往左排

let langTextDirectionEnums = [| langTextDirectionEnum.Default; langTextDirectionEnum.RightToLeft |]
let langTextDirectionEnumstrs = [| "langTextDirectionEnum"; "langTextDirectionEnum" |]
let langTextDirectionNum = 2

let int__langTextDirectionEnum v =
    match v with
    | 0 -> Some langTextDirectionEnum.Default
    | 1 -> Some langTextDirectionEnum.RightToLeft
    | _ -> None

let str__langTextDirectionEnum s =
    match s with
    | "Default" -> Some langTextDirectionEnum.Default
    | "RightToLeft" -> Some langTextDirectionEnum.RightToLeft
    | _ -> None

let langTextDirectionEnum__caption e =
    match e with
    | langTextDirectionEnum.Default -> "默认"
    | langTextDirectionEnum.RightToLeft -> "从右往左排"
    | _ -> ""

type pLANG = {
mutable Code2: Chars
mutable Caption: Chars
mutable Native: Chars
mutable Icon: Link
mutable IsBlank: Boolean
mutable IsLocale: Boolean
mutable IsContent: Boolean
mutable IsAutoTranslate: Boolean
mutable IsMiles: Boolean
mutable TextDirection: langTextDirectionEnum}


type LANG = Rcd<pLANG>

let LANG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code2],[Caption],[Native],[Icon],[IsBlank],[IsLocale],[IsContent],[IsAutoTranslate],[IsMiles],[TextDirection]"

let pLANG_fieldordersArray = [|
    "Code2"
    "Caption"
    "Native"
    "Icon"
    "IsBlank"
    "IsLocale"
    "IsContent"
    "IsAutoTranslate"
    "IsMiles"
    "TextDirection" |]

let LANG_sql_update = "[Updatedat]=@Updatedat,[Code2]=@Code2,[Caption]=@Caption,[Native]=@Native,[Icon]=@Icon,[IsBlank]=@IsBlank,[IsLocale]=@IsLocale,[IsContent]=@IsContent,[IsAutoTranslate]=@IsAutoTranslate,[IsMiles]=@IsMiles,[TextDirection]=@TextDirection"

let pLANG_fields = [|
    Chars("Code2", 2)
    Chars("Caption", 64)
    Chars("Native", 64)
    Link("Icon", 256)
    Boolean("IsBlank")
    Boolean("IsLocale")
    Boolean("IsContent")
    Boolean("IsAutoTranslate")
    Boolean("IsMiles")
    SelectLines("TextDirection", [| ("Default","默认");("RightToLeft","从右往左排") |]) |]

let pLANG_empty(): pLANG = {
    Code2 = ""
    Caption = ""
    Native = ""
    Icon = ""
    IsBlank = true
    IsLocale = true
    IsContent = true
    IsAutoTranslate = true
    IsMiles = true
    TextDirection = EnumOfValue 0 }

let LANG_id = ref 1001L
let LANG_count = ref 0
let LANG_table = "Ca_Lang"

// [Ca_Locale] (LOCALE)

type pLOCALE = {
mutable Code: Caption
mutable Lang: FK
mutable Zh: Text
mutable Text: Text}


type LOCALE = Rcd<pLOCALE>

let LOCALE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Lang],[Zh],[Text]"

let pLOCALE_fieldordersArray = [|
    "Code"
    "Lang"
    "Zh"
    "Text" |]

let LOCALE_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Lang]=@Lang,[Zh]=@Zh,[Text]=@Text"

let pLOCALE_fields = [|
    Caption("Code", 64)
    FK("Lang")
    Text("Zh")
    Text("Text") |]

let pLOCALE_empty(): pLOCALE = {
    Code = ""
    Lang = 0L
    Zh = ""
    Text = "" }

let LOCALE_id = ref 0L
let LOCALE_count = ref 0
let LOCALE_table = "Ca_Locale"

// [Ca_SpecialItem] (CSI)

type csiTypeEnum = 
| Normal = 0 // 常规
| ToplinesGlobalNews = 1 // 全站新闻置顶
| ToplinesGlobalPerson = 2 // 全站人物置顶
| ToplinesGlobalEvent = 3 // 全站事件置顶

let csiTypeEnums = [| csiTypeEnum.Normal; csiTypeEnum.ToplinesGlobalNews; csiTypeEnum.ToplinesGlobalPerson; csiTypeEnum.ToplinesGlobalEvent |]
let csiTypeEnumstrs = [| "csiTypeEnum"; "csiTypeEnum"; "csiTypeEnum"; "csiTypeEnum" |]
let csiTypeNum = 4

let int__csiTypeEnum v =
    match v with
    | 0 -> Some csiTypeEnum.Normal
    | 1 -> Some csiTypeEnum.ToplinesGlobalNews
    | 2 -> Some csiTypeEnum.ToplinesGlobalPerson
    | 3 -> Some csiTypeEnum.ToplinesGlobalEvent
    | _ -> None

let str__csiTypeEnum s =
    match s with
    | "Normal" -> Some csiTypeEnum.Normal
    | "ToplinesGlobalNews" -> Some csiTypeEnum.ToplinesGlobalNews
    | "ToplinesGlobalPerson" -> Some csiTypeEnum.ToplinesGlobalPerson
    | "ToplinesGlobalEvent" -> Some csiTypeEnum.ToplinesGlobalEvent
    | _ -> None

let csiTypeEnum__caption e =
    match e with
    | csiTypeEnum.Normal -> "常规"
    | csiTypeEnum.ToplinesGlobalNews -> "全站新闻置顶"
    | csiTypeEnum.ToplinesGlobalPerson -> "全站人物置顶"
    | csiTypeEnum.ToplinesGlobalEvent -> "全站事件置顶"
    | _ -> ""

type pCSI = {
mutable Type: csiTypeEnum
mutable Lang: FK
mutable Bind: Integer}


type CSI = Rcd<pCSI>

let CSI_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Type],[Lang],[Bind]"

let pCSI_fieldordersArray = [|
    "Type"
    "Lang"
    "Bind" |]

let CSI_sql_update = "[Updatedat]=@Updatedat,[Type]=@Type,[Lang]=@Lang,[Bind]=@Bind"

let pCSI_fields = [|
    SelectLines("Type", [| ("Normal","常规");("ToplinesGlobalNews","全站新闻置顶");("ToplinesGlobalPerson","全站人物置顶");("ToplinesGlobalEvent","全站事件置顶") |])
    FK("Lang")
    Integer("Bind") |]

let pCSI_empty(): pCSI = {
    Type = EnumOfValue 0
    Lang = 0L
    Bind = 0L }

let CSI_id = ref 0L
let CSI_count = ref 0
let CSI_table = "Ca_SpecialItem"

// [Ca_WebCredential] (CWC)

type pCWC = {
mutable Caption: Caption
mutable ExternalId: Integer
mutable Icon: Link
mutable EU: FK
mutable Biz: FK
mutable Json: Text}


type CWC = Rcd<pCWC>

let CWC_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[ExternalId],[Icon],[EU],[Biz],[Json]"

let pCWC_fieldordersArray = [|
    "Caption"
    "ExternalId"
    "Icon"
    "EU"
    "Biz"
    "Json" |]

let CWC_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[ExternalId]=@ExternalId,[Icon]=@Icon,[EU]=@EU,[Biz]=@Biz,[Json]=@Json"

let pCWC_fields = [|
    Caption("Caption", 64)
    Integer("ExternalId")
    Link("Icon", 256)
    FK("EU")
    FK("Biz")
    Text("Json") |]

let pCWC_empty(): pCWC = {
    Caption = ""
    ExternalId = 0L
    Icon = ""
    EU = 0L
    Biz = 0L
    Json = "" }

let CWC_id = ref 0L
let CWC_count = ref 0
let CWC_table = "Ca_WebCredential"

// [Market_Instrument] (INS)

type pINS = {
mutable Desc: Text
mutable Code: Chars
mutable Caption: Chars
mutable Long: FK
mutable Short: FK}


type INS = Rcd<pINS>

let INS_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Desc],[Code],[Caption],[Long],[Short]"

let pINS_fieldordersArray = [|
    "Desc"
    "Code"
    "Caption"
    "Long"
    "Short" |]

let INS_sql_update = "[Updatedat]=@Updatedat,[Desc]=@Desc,[Code]=@Code,[Caption]=@Caption,[Long]=@Long,[Short]=@Short"

let pINS_fields = [|
    Text("Desc")
    Chars("Code", 64)
    Chars("Caption", 64)
    FK("Long")
    FK("Short") |]

let pINS_empty(): pINS = {
    Desc = ""
    Code = ""
    Caption = ""
    Long = 0L
    Short = 0L }

let INS_id = ref 0L
let INS_count = ref 0
let INS_table = "Market_Instrument"

// [Market_Ticket] (TICKET)

type ticketTradeModeEnum = 
| Match = 0 // 撮合
| Make = 1 // 做市
| CapAlloc = 2 // 配资
| MakeDerivative = 3 // 做市衍生品

let ticketTradeModeEnums = [| ticketTradeModeEnum.Match; ticketTradeModeEnum.Make; ticketTradeModeEnum.CapAlloc; ticketTradeModeEnum.MakeDerivative |]
let ticketTradeModeEnumstrs = [| "ticketTradeModeEnum"; "ticketTradeModeEnum"; "ticketTradeModeEnum"; "ticketTradeModeEnum" |]
let ticketTradeModeNum = 4

let int__ticketTradeModeEnum v =
    match v with
    | 0 -> Some ticketTradeModeEnum.Match
    | 1 -> Some ticketTradeModeEnum.Make
    | 2 -> Some ticketTradeModeEnum.CapAlloc
    | 3 -> Some ticketTradeModeEnum.MakeDerivative
    | _ -> None

let str__ticketTradeModeEnum s =
    match s with
    | "Match" -> Some ticketTradeModeEnum.Match
    | "Make" -> Some ticketTradeModeEnum.Make
    | "CapAlloc" -> Some ticketTradeModeEnum.CapAlloc
    | "MakeDerivative" -> Some ticketTradeModeEnum.MakeDerivative
    | _ -> None

let ticketTradeModeEnum__caption e =
    match e with
    | ticketTradeModeEnum.Match -> "撮合"
    | ticketTradeModeEnum.Make -> "做市"
    | ticketTradeModeEnum.CapAlloc -> "配资"
    | ticketTradeModeEnum.MakeDerivative -> "做市衍生品"
    | _ -> ""

type ticketStatusEnum = 
| Pending = 0 // 挂单
| Cancel = 1 // 撤单
| Open = 2 // 开单
| Close = 3 // 平单
| RO = 4 // 展期
| Opening = 5 // 开仓待确认
| Closing = 6 // 平仓待确认
| PendingAwait = 7 // 挂单待确认
| CancelAwait = 8 // 撤单待确认
| OpenSplited = 9 // 开单分单
| CloseSplited = 10 // 关单分单
| Closer = 11 // 关单者

let ticketStatusEnums = [| ticketStatusEnum.Pending; ticketStatusEnum.Cancel; ticketStatusEnum.Open; ticketStatusEnum.Close; ticketStatusEnum.RO; ticketStatusEnum.Opening; ticketStatusEnum.Closing; ticketStatusEnum.PendingAwait; ticketStatusEnum.CancelAwait; ticketStatusEnum.OpenSplited; ticketStatusEnum.CloseSplited; ticketStatusEnum.Closer |]
let ticketStatusEnumstrs = [| "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum"; "ticketStatusEnum" |]
let ticketStatusNum = 12

let int__ticketStatusEnum v =
    match v with
    | 0 -> Some ticketStatusEnum.Pending
    | 1 -> Some ticketStatusEnum.Cancel
    | 2 -> Some ticketStatusEnum.Open
    | 3 -> Some ticketStatusEnum.Close
    | 4 -> Some ticketStatusEnum.RO
    | 5 -> Some ticketStatusEnum.Opening
    | 6 -> Some ticketStatusEnum.Closing
    | 7 -> Some ticketStatusEnum.PendingAwait
    | 8 -> Some ticketStatusEnum.CancelAwait
    | 9 -> Some ticketStatusEnum.OpenSplited
    | 10 -> Some ticketStatusEnum.CloseSplited
    | 11 -> Some ticketStatusEnum.Closer
    | _ -> None

let str__ticketStatusEnum s =
    match s with
    | "Pending" -> Some ticketStatusEnum.Pending
    | "Cancel" -> Some ticketStatusEnum.Cancel
    | "Open" -> Some ticketStatusEnum.Open
    | "Close" -> Some ticketStatusEnum.Close
    | "RO" -> Some ticketStatusEnum.RO
    | "Opening" -> Some ticketStatusEnum.Opening
    | "Closing" -> Some ticketStatusEnum.Closing
    | "PendingAwait" -> Some ticketStatusEnum.PendingAwait
    | "CancelAwait" -> Some ticketStatusEnum.CancelAwait
    | "OpenSplited" -> Some ticketStatusEnum.OpenSplited
    | "CloseSplited" -> Some ticketStatusEnum.CloseSplited
    | "Closer" -> Some ticketStatusEnum.Closer
    | _ -> None

let ticketStatusEnum__caption e =
    match e with
    | ticketStatusEnum.Pending -> "挂单"
    | ticketStatusEnum.Cancel -> "撤单"
    | ticketStatusEnum.Open -> "开单"
    | ticketStatusEnum.Close -> "平单"
    | ticketStatusEnum.RO -> "展期"
    | ticketStatusEnum.Opening -> "开仓待确认"
    | ticketStatusEnum.Closing -> "平仓待确认"
    | ticketStatusEnum.PendingAwait -> "挂单待确认"
    | ticketStatusEnum.CancelAwait -> "撤单待确认"
    | ticketStatusEnum.OpenSplited -> "开单分单"
    | ticketStatusEnum.CloseSplited -> "关单分单"
    | ticketStatusEnum.Closer -> "关单者"
    | _ -> ""

type ticketCloseTypeEnum = 
| Manual = 0 // Manual
| TakeProfit = 1 // Take Profit
| StopLoss = 2 // Stop Loss
| Liquidation = 3 // Liquidation
| Expire = 4 // Expire

let ticketCloseTypeEnums = [| ticketCloseTypeEnum.Manual; ticketCloseTypeEnum.TakeProfit; ticketCloseTypeEnum.StopLoss; ticketCloseTypeEnum.Liquidation; ticketCloseTypeEnum.Expire |]
let ticketCloseTypeEnumstrs = [| "ticketCloseTypeEnum"; "ticketCloseTypeEnum"; "ticketCloseTypeEnum"; "ticketCloseTypeEnum"; "ticketCloseTypeEnum" |]
let ticketCloseTypeNum = 5

let int__ticketCloseTypeEnum v =
    match v with
    | 0 -> Some ticketCloseTypeEnum.Manual
    | 1 -> Some ticketCloseTypeEnum.TakeProfit
    | 2 -> Some ticketCloseTypeEnum.StopLoss
    | 3 -> Some ticketCloseTypeEnum.Liquidation
    | 4 -> Some ticketCloseTypeEnum.Expire
    | _ -> None

let str__ticketCloseTypeEnum s =
    match s with
    | "Manual" -> Some ticketCloseTypeEnum.Manual
    | "TakeProfit" -> Some ticketCloseTypeEnum.TakeProfit
    | "StopLoss" -> Some ticketCloseTypeEnum.StopLoss
    | "Liquidation" -> Some ticketCloseTypeEnum.Liquidation
    | "Expire" -> Some ticketCloseTypeEnum.Expire
    | _ -> None

let ticketCloseTypeEnum__caption e =
    match e with
    | ticketCloseTypeEnum.Manual -> "Manual"
    | ticketCloseTypeEnum.TakeProfit -> "Take Profit"
    | ticketCloseTypeEnum.StopLoss -> "Stop Loss"
    | ticketCloseTypeEnum.Liquidation -> "Liquidation"
    | ticketCloseTypeEnum.Expire -> "Expire"
    | _ -> ""

type ticketCommitTypeEnum = 
| MarketExe = 0 // 市价执行
| PendingLimit = 1 // 限价挂单
| PendingStop = 2 // 止损挂单
| Ext = 3 // 展期
| Passive = 4 // 被动执行

let ticketCommitTypeEnums = [| ticketCommitTypeEnum.MarketExe; ticketCommitTypeEnum.PendingLimit; ticketCommitTypeEnum.PendingStop; ticketCommitTypeEnum.Ext; ticketCommitTypeEnum.Passive |]
let ticketCommitTypeEnumstrs = [| "ticketCommitTypeEnum"; "ticketCommitTypeEnum"; "ticketCommitTypeEnum"; "ticketCommitTypeEnum"; "ticketCommitTypeEnum" |]
let ticketCommitTypeNum = 5

let int__ticketCommitTypeEnum v =
    match v with
    | 0 -> Some ticketCommitTypeEnum.MarketExe
    | 1 -> Some ticketCommitTypeEnum.PendingLimit
    | 2 -> Some ticketCommitTypeEnum.PendingStop
    | 3 -> Some ticketCommitTypeEnum.Ext
    | 4 -> Some ticketCommitTypeEnum.Passive
    | _ -> None

let str__ticketCommitTypeEnum s =
    match s with
    | "MarketExe" -> Some ticketCommitTypeEnum.MarketExe
    | "PendingLimit" -> Some ticketCommitTypeEnum.PendingLimit
    | "PendingStop" -> Some ticketCommitTypeEnum.PendingStop
    | "Ext" -> Some ticketCommitTypeEnum.Ext
    | "Passive" -> Some ticketCommitTypeEnum.Passive
    | _ -> None

let ticketCommitTypeEnum__caption e =
    match e with
    | ticketCommitTypeEnum.MarketExe -> "市价执行"
    | ticketCommitTypeEnum.PendingLimit -> "限价挂单"
    | ticketCommitTypeEnum.PendingStop -> "止损挂单"
    | ticketCommitTypeEnum.Ext -> "展期"
    | ticketCommitTypeEnum.Passive -> "被动执行"
    | _ -> ""

type ticketDrvDirectionEnum = 
| Unchanged = 0 // 平
| Up = 1 // 涨
| Dn = 2 // 跌

let ticketDrvDirectionEnums = [| ticketDrvDirectionEnum.Unchanged; ticketDrvDirectionEnum.Up; ticketDrvDirectionEnum.Dn |]
let ticketDrvDirectionEnumstrs = [| "ticketDrvDirectionEnum"; "ticketDrvDirectionEnum"; "ticketDrvDirectionEnum" |]
let ticketDrvDirectionNum = 3

let int__ticketDrvDirectionEnum v =
    match v with
    | 0 -> Some ticketDrvDirectionEnum.Unchanged
    | 1 -> Some ticketDrvDirectionEnum.Up
    | 2 -> Some ticketDrvDirectionEnum.Dn
    | _ -> None

let str__ticketDrvDirectionEnum s =
    match s with
    | "Unchanged" -> Some ticketDrvDirectionEnum.Unchanged
    | "Up" -> Some ticketDrvDirectionEnum.Up
    | "Dn" -> Some ticketDrvDirectionEnum.Dn
    | _ -> None

let ticketDrvDirectionEnum__caption e =
    match e with
    | ticketDrvDirectionEnum.Unchanged -> "平"
    | ticketDrvDirectionEnum.Up -> "涨"
    | ticketDrvDirectionEnum.Dn -> "跌"
    | _ -> ""

type ticketClearStatusEnum = 
| UnClear = 0 // 未清算
| Clear = 1 // 已清算

let ticketClearStatusEnums = [| ticketClearStatusEnum.UnClear; ticketClearStatusEnum.Clear |]
let ticketClearStatusEnumstrs = [| "ticketClearStatusEnum"; "ticketClearStatusEnum" |]
let ticketClearStatusNum = 2

let int__ticketClearStatusEnum v =
    match v with
    | 0 -> Some ticketClearStatusEnum.UnClear
    | 1 -> Some ticketClearStatusEnum.Clear
    | _ -> None

let str__ticketClearStatusEnum s =
    match s with
    | "UnClear" -> Some ticketClearStatusEnum.UnClear
    | "Clear" -> Some ticketClearStatusEnum.Clear
    | _ -> None

let ticketClearStatusEnum__caption e =
    match e with
    | ticketClearStatusEnum.UnClear -> "未清算"
    | ticketClearStatusEnum.Clear -> "已清算"
    | _ -> ""

type ticketOptionStatusEnum = 
| Normal = 0 // 通用
| Inquiring = 1 // 待询价
| Inquiried = 2 // 已询价
| Receiving = 3 // 待接单
| Received = 4 // 已接单
| Exercising = 5 // 待行权
| Exercised = 6 // 已行权

let ticketOptionStatusEnums = [| ticketOptionStatusEnum.Normal; ticketOptionStatusEnum.Inquiring; ticketOptionStatusEnum.Inquiried; ticketOptionStatusEnum.Receiving; ticketOptionStatusEnum.Received; ticketOptionStatusEnum.Exercising; ticketOptionStatusEnum.Exercised |]
let ticketOptionStatusEnumstrs = [| "ticketOptionStatusEnum"; "ticketOptionStatusEnum"; "ticketOptionStatusEnum"; "ticketOptionStatusEnum"; "ticketOptionStatusEnum"; "ticketOptionStatusEnum"; "ticketOptionStatusEnum" |]
let ticketOptionStatusNum = 7

let int__ticketOptionStatusEnum v =
    match v with
    | 0 -> Some ticketOptionStatusEnum.Normal
    | 1 -> Some ticketOptionStatusEnum.Inquiring
    | 2 -> Some ticketOptionStatusEnum.Inquiried
    | 3 -> Some ticketOptionStatusEnum.Receiving
    | 4 -> Some ticketOptionStatusEnum.Received
    | 5 -> Some ticketOptionStatusEnum.Exercising
    | 6 -> Some ticketOptionStatusEnum.Exercised
    | _ -> None

let str__ticketOptionStatusEnum s =
    match s with
    | "Normal" -> Some ticketOptionStatusEnum.Normal
    | "Inquiring" -> Some ticketOptionStatusEnum.Inquiring
    | "Inquiried" -> Some ticketOptionStatusEnum.Inquiried
    | "Receiving" -> Some ticketOptionStatusEnum.Receiving
    | "Received" -> Some ticketOptionStatusEnum.Received
    | "Exercising" -> Some ticketOptionStatusEnum.Exercising
    | "Exercised" -> Some ticketOptionStatusEnum.Exercised
    | _ -> None

let ticketOptionStatusEnum__caption e =
    match e with
    | ticketOptionStatusEnum.Normal -> "通用"
    | ticketOptionStatusEnum.Inquiring -> "待询价"
    | ticketOptionStatusEnum.Inquiried -> "已询价"
    | ticketOptionStatusEnum.Receiving -> "待接单"
    | ticketOptionStatusEnum.Received -> "已接单"
    | ticketOptionStatusEnum.Exercising -> "待行权"
    | ticketOptionStatusEnum.Exercised -> "已行权"
    | _ -> ""

type pTICKET = {
mutable EndUser: FK
mutable TradeAcct: FK
mutable Ins: FK
mutable Code: Chars
mutable Caption: Chars
mutable TradeMode: ticketTradeModeEnum
mutable Lot: Integer
mutable PriceOpened: Integer
mutable PriceOpen: Integer
mutable PriceSL: Integer
mutable PriceTP: Integer
mutable PriceClose: Integer
mutable Status: ticketStatusEnum
mutable CP: FK
mutable CptAcct: FK
mutable Ref: FK
mutable OpenRef: FK
mutable CloseRef: FK
mutable Origin: FK
mutable PnL: Float
mutable PnLSpread: Float
mutable Margin: Float
mutable RO: Float
mutable Tax: Float
mutable CloseType: ticketCloseTypeEnum
mutable CommitType: ticketCommitTypeEnum
mutable Cmt: Chars
mutable Opendat: Timestamp
mutable Closedat: Timestamp
mutable CaStrategyAmt: Float
mutable CaRo: Boolean
mutable CaAsa: Boolean
mutable CaCmphsvCharge: Float
mutable RoCheckedat: Timestamp
mutable Expiry: Timestamp
mutable HedgetCP: FK
mutable PendingPrice: Integer
mutable ClosedLot: Integer
mutable ClosedAmt: Float
mutable PendingAmt: Float
mutable DrvPreminum: Float
mutable DrvExpiry: Timestamp
mutable DrvPeriod: Integer
mutable DrvDirection: ticketDrvDirectionEnum
mutable DrvPrice: Float
mutable DoubleCp: FK
mutable ClearStatus: ticketClearStatusEnum
mutable FollowTicket: FK
mutable Config: Text
mutable OptionStatus: ticketOptionStatusEnum
mutable NotionalPrincipal: Float
mutable ExercisedPrincipal: Float
mutable ExerciseMode: Float
mutable ExercisePrice: Float
mutable ExternalTicketOpen: FK
mutable ExternalTicketClose: FK
mutable ExternalTicketPending: FK
mutable ExternalTicketCancel: FK
mutable Desc: Text}


type TICKET = Rcd<pTICKET>

let TICKET_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[EndUser],[TradeAcct],[Ins],[Code],[Caption],[TradeMode],[Lot],[PriceOpened],[PriceOpen],[PriceSL],[PriceTP],[PriceClose],[Status],[CP],[CptAcct],[Ref],[OpenRef],[CloseRef],[Origin],[PnL],[PnLSpread],[Margin],[RO],[Tax],[CloseType],[CommitType],[Cmt],[Opendat],[Closedat],[CaStrategyAmt],[CaRo],[CaAsa],[CaCmphsvCharge],[RoCheckedat],[Expiry],[HedgetCP],[PendingPrice],[ClosedLot],[ClosedAmt],[PendingAmt],[DrvPreminum],[DrvExpiry],[DrvPeriod],[DrvDirection],[DrvPrice],[DoubleCp],[ClearStatus],[FollowTicket],[Config],[OptionStatus],[NotionalPrincipal],[ExercisedPrincipal],[ExerciseMode],[ExercisePrice],[ExternalTicketOpen],[ExternalTicketClose],[ExternalTicketPending],[ExternalTicketCancel],[Desc]"

let pTICKET_fieldordersArray = [|
    "EndUser"
    "TradeAcct"
    "Ins"
    "Code"
    "Caption"
    "TradeMode"
    "Lot"
    "PriceOpened"
    "PriceOpen"
    "PriceSL"
    "PriceTP"
    "PriceClose"
    "Status"
    "CP"
    "CptAcct"
    "Ref"
    "OpenRef"
    "CloseRef"
    "Origin"
    "PnL"
    "PnLSpread"
    "Margin"
    "RO"
    "Tax"
    "CloseType"
    "CommitType"
    "Cmt"
    "Opendat"
    "Closedat"
    "CaStrategyAmt"
    "CaRo"
    "CaAsa"
    "CaCmphsvCharge"
    "RoCheckedat"
    "Expiry"
    "HedgetCP"
    "PendingPrice"
    "ClosedLot"
    "ClosedAmt"
    "PendingAmt"
    "DrvPreminum"
    "DrvExpiry"
    "DrvPeriod"
    "DrvDirection"
    "DrvPrice"
    "DoubleCp"
    "ClearStatus"
    "FollowTicket"
    "Config"
    "OptionStatus"
    "NotionalPrincipal"
    "ExercisedPrincipal"
    "ExerciseMode"
    "ExercisePrice"
    "ExternalTicketOpen"
    "ExternalTicketClose"
    "ExternalTicketPending"
    "ExternalTicketCancel"
    "Desc" |]

let TICKET_sql_update = "[Updatedat]=@Updatedat,[EndUser]=@EndUser,[TradeAcct]=@TradeAcct,[Ins]=@Ins,[Code]=@Code,[Caption]=@Caption,[TradeMode]=@TradeMode,[Lot]=@Lot,[PriceOpened]=@PriceOpened,[PriceOpen]=@PriceOpen,[PriceSL]=@PriceSL,[PriceTP]=@PriceTP,[PriceClose]=@PriceClose,[Status]=@Status,[CP]=@CP,[CptAcct]=@CptAcct,[Ref]=@Ref,[OpenRef]=@OpenRef,[CloseRef]=@CloseRef,[Origin]=@Origin,[PnL]=@PnL,[PnLSpread]=@PnLSpread,[Margin]=@Margin,[RO]=@RO,[Tax]=@Tax,[CloseType]=@CloseType,[CommitType]=@CommitType,[Cmt]=@Cmt,[Opendat]=@Opendat,[Closedat]=@Closedat,[CaStrategyAmt]=@CaStrategyAmt,[CaRo]=@CaRo,[CaAsa]=@CaAsa,[CaCmphsvCharge]=@CaCmphsvCharge,[RoCheckedat]=@RoCheckedat,[Expiry]=@Expiry,[HedgetCP]=@HedgetCP,[PendingPrice]=@PendingPrice,[ClosedLot]=@ClosedLot,[ClosedAmt]=@ClosedAmt,[PendingAmt]=@PendingAmt,[DrvPreminum]=@DrvPreminum,[DrvExpiry]=@DrvExpiry,[DrvPeriod]=@DrvPeriod,[DrvDirection]=@DrvDirection,[DrvPrice]=@DrvPrice,[DoubleCp]=@DoubleCp,[ClearStatus]=@ClearStatus,[FollowTicket]=@FollowTicket,[Config]=@Config,[OptionStatus]=@OptionStatus,[NotionalPrincipal]=@NotionalPrincipal,[ExercisedPrincipal]=@ExercisedPrincipal,[ExerciseMode]=@ExerciseMode,[ExercisePrice]=@ExercisePrice,[ExternalTicketOpen]=@ExternalTicketOpen,[ExternalTicketClose]=@ExternalTicketClose,[ExternalTicketPending]=@ExternalTicketPending,[ExternalTicketCancel]=@ExternalTicketCancel,[Desc]=@Desc"

let pTICKET_fields = [|
    FK("EndUser")
    FK("TradeAcct")
    FK("Ins")
    Chars("Code", 64)
    Chars("Caption", 64)
    SelectLines("TradeMode", [| ("Match","撮合");("Make","做市");("CapAlloc","配资");("MakeDerivative","做市衍生品") |])
    Integer("Lot")
    Integer("PriceOpened")
    Integer("PriceOpen")
    Integer("PriceSL")
    Integer("PriceTP")
    Integer("PriceClose")
    SelectLines("Status", [| ("Pending","挂单");("Cancel","撤单");("Open","开单");("Close","平单");("RO","展期");("Opening","开仓待确认");("Closing","平仓待确认");("PendingAwait","挂单待确认");("CancelAwait","撤单待确认");("OpenSplited","开单分单");("CloseSplited","关单分单");("Closer","关单者") |])
    FK("CP")
    FK("CptAcct")
    FK("Ref")
    FK("OpenRef")
    FK("CloseRef")
    FK("Origin")
    Float("PnL")
    Float("PnLSpread")
    Float("Margin")
    Float("RO")
    Float("Tax")
    SelectLines("CloseType", [| ("Manual","Manual");("TakeProfit","Take Profit");("StopLoss","Stop Loss");("Liquidation","Liquidation");("Expire","Expire") |])
    SelectLines("CommitType", [| ("MarketExe","市价执行");("PendingLimit","限价挂单");("PendingStop","止损挂单");("Ext","展期");("Passive","被动执行") |])
    Chars("Cmt", 64)
    Timestamp("Opendat")
    Timestamp("Closedat")
    Float("CaStrategyAmt")
    Boolean("CaRo")
    Boolean("CaAsa")
    Float("CaCmphsvCharge")
    Timestamp("RoCheckedat")
    Timestamp("Expiry")
    FK("HedgetCP")
    Integer("PendingPrice")
    Integer("ClosedLot")
    Float("ClosedAmt")
    Float("PendingAmt")
    Float("DrvPreminum")
    Timestamp("DrvExpiry")
    Integer("DrvPeriod")
    SelectLines("DrvDirection", [| ("Unchanged","平");("Up","涨");("Dn","跌") |])
    Float("DrvPrice")
    FK("DoubleCp")
    SelectLines("ClearStatus", [| ("UnClear","未清算");("Clear","已清算") |])
    FK("FollowTicket")
    Text("Config")
    SelectLines("OptionStatus", [| ("Normal","通用");("Inquiring","待询价");("Inquiried","已询价");("Receiving","待接单");("Received","已接单");("Exercising","待行权");("Exercised","已行权") |])
    Float("NotionalPrincipal")
    Float("ExercisedPrincipal")
    Float("ExerciseMode")
    Float("ExercisePrice")
    FK("ExternalTicketOpen")
    FK("ExternalTicketClose")
    FK("ExternalTicketPending")
    FK("ExternalTicketCancel")
    Text("Desc") |]

let pTICKET_empty(): pTICKET = {
    EndUser = 0L
    TradeAcct = 0L
    Ins = 0L
    Code = ""
    Caption = ""
    TradeMode = EnumOfValue 0
    Lot = 0L
    PriceOpened = 0L
    PriceOpen = 0L
    PriceSL = 0L
    PriceTP = 0L
    PriceClose = 0L
    Status = EnumOfValue 0
    CP = 0L
    CptAcct = 0L
    Ref = 0L
    OpenRef = 0L
    CloseRef = 0L
    Origin = 0L
    PnL = 0.0
    PnLSpread = 0.0
    Margin = 0.0
    RO = 0.0
    Tax = 0.0
    CloseType = EnumOfValue 0
    CommitType = EnumOfValue 0
    Cmt = ""
    Opendat = DateTime.MinValue
    Closedat = DateTime.MinValue
    CaStrategyAmt = 0.0
    CaRo = true
    CaAsa = true
    CaCmphsvCharge = 0.0
    RoCheckedat = DateTime.MinValue
    Expiry = DateTime.MinValue
    HedgetCP = 0L
    PendingPrice = 0L
    ClosedLot = 0L
    ClosedAmt = 0.0
    PendingAmt = 0.0
    DrvPreminum = 0.0
    DrvExpiry = DateTime.MinValue
    DrvPeriod = 0L
    DrvDirection = EnumOfValue 0
    DrvPrice = 0.0
    DoubleCp = 0L
    ClearStatus = EnumOfValue 0
    FollowTicket = 0L
    Config = ""
    OptionStatus = EnumOfValue 0
    NotionalPrincipal = 0.0
    ExercisedPrincipal = 0.0
    ExerciseMode = 0.0
    ExercisePrice = 0.0
    ExternalTicketOpen = 0L
    ExternalTicketClose = 0L
    ExternalTicketPending = 0L
    ExternalTicketCancel = 0L
    Desc = "" }

let TICKET_id = ref 75921367L
let TICKET_count = ref 0
let TICKET_table = "Market_Ticket"

// [Market_TradeAcct] (TACCT)

type tacctStateEnum = 
| Normal = 0 // 正常
| Frozen = 1 // 冻结
| FrozenInvisible = 2 // 冻结且不得查询
| LimitTrade = 3 // 限制交易
| FrozenTrade = 4 // 冻结交易

let tacctStateEnums = [| tacctStateEnum.Normal; tacctStateEnum.Frozen; tacctStateEnum.FrozenInvisible; tacctStateEnum.LimitTrade; tacctStateEnum.FrozenTrade |]
let tacctStateEnumstrs = [| "tacctStateEnum"; "tacctStateEnum"; "tacctStateEnum"; "tacctStateEnum"; "tacctStateEnum" |]
let tacctStateNum = 5

let int__tacctStateEnum v =
    match v with
    | 0 -> Some tacctStateEnum.Normal
    | 1 -> Some tacctStateEnum.Frozen
    | 2 -> Some tacctStateEnum.FrozenInvisible
    | 3 -> Some tacctStateEnum.LimitTrade
    | 4 -> Some tacctStateEnum.FrozenTrade
    | _ -> None

let str__tacctStateEnum s =
    match s with
    | "Normal" -> Some tacctStateEnum.Normal
    | "Frozen" -> Some tacctStateEnum.Frozen
    | "FrozenInvisible" -> Some tacctStateEnum.FrozenInvisible
    | "LimitTrade" -> Some tacctStateEnum.LimitTrade
    | "FrozenTrade" -> Some tacctStateEnum.FrozenTrade
    | _ -> None

let tacctStateEnum__caption e =
    match e with
    | tacctStateEnum.Normal -> "正常"
    | tacctStateEnum.Frozen -> "冻结"
    | tacctStateEnum.FrozenInvisible -> "冻结且不得查询"
    | tacctStateEnum.LimitTrade -> "限制交易"
    | tacctStateEnum.FrozenTrade -> "冻结交易"
    | _ -> ""

type tacctTradeTypeEnum = 
| Cash = 0 // 现金
| Match = 1 // 撮合
| Make = 2 // 做市

let tacctTradeTypeEnums = [| tacctTradeTypeEnum.Cash; tacctTradeTypeEnum.Match; tacctTradeTypeEnum.Make |]
let tacctTradeTypeEnumstrs = [| "tacctTradeTypeEnum"; "tacctTradeTypeEnum"; "tacctTradeTypeEnum" |]
let tacctTradeTypeNum = 3

let int__tacctTradeTypeEnum v =
    match v with
    | 0 -> Some tacctTradeTypeEnum.Cash
    | 1 -> Some tacctTradeTypeEnum.Match
    | 2 -> Some tacctTradeTypeEnum.Make
    | _ -> None

let str__tacctTradeTypeEnum s =
    match s with
    | "Cash" -> Some tacctTradeTypeEnum.Cash
    | "Match" -> Some tacctTradeTypeEnum.Match
    | "Make" -> Some tacctTradeTypeEnum.Make
    | _ -> None

let tacctTradeTypeEnum__caption e =
    match e with
    | tacctTradeTypeEnum.Cash -> "现金"
    | tacctTradeTypeEnum.Match -> "撮合"
    | tacctTradeTypeEnum.Make -> "做市"
    | _ -> ""

type tacctRealDemoEnum = 
| Real = 0 // 真实
| Demo = 1 // 模拟

let tacctRealDemoEnums = [| tacctRealDemoEnum.Real; tacctRealDemoEnum.Demo |]
let tacctRealDemoEnumstrs = [| "tacctRealDemoEnum"; "tacctRealDemoEnum" |]
let tacctRealDemoNum = 2

let int__tacctRealDemoEnum v =
    match v with
    | 0 -> Some tacctRealDemoEnum.Real
    | 1 -> Some tacctRealDemoEnum.Demo
    | _ -> None

let str__tacctRealDemoEnum s =
    match s with
    | "Real" -> Some tacctRealDemoEnum.Real
    | "Demo" -> Some tacctRealDemoEnum.Demo
    | _ -> None

let tacctRealDemoEnum__caption e =
    match e with
    | tacctRealDemoEnum.Real -> "真实"
    | tacctRealDemoEnum.Demo -> "模拟"
    | _ -> ""

type pTACCT = {
mutable SAC: FK
mutable State: tacctStateEnum
mutable TradeType: tacctTradeTypeEnum
mutable RealDemo: tacctRealDemoEnum
mutable PnL: Float
mutable Frozen: Float
mutable Leverage: Float
mutable Margin: Float
mutable MarginCallRateWarning: Float
mutable MarginCallRateWarningII: Float
mutable MarginCallRateLiq: Float
mutable PwdTrade: Caption
mutable PwdReadonly: Caption
mutable Desc: Text}


type TACCT = Rcd<pTACCT>

let TACCT_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[SAC],[State],[TradeType],[RealDemo],[PnL],[Frozen],[Leverage],[Margin],[MarginCallRateWarning],[MarginCallRateWarningII],[MarginCallRateLiq],[PwdTrade],[PwdReadonly],[Desc]"

let pTACCT_fieldordersArray = [|
    "SAC"
    "State"
    "TradeType"
    "RealDemo"
    "PnL"
    "Frozen"
    "Leverage"
    "Margin"
    "MarginCallRateWarning"
    "MarginCallRateWarningII"
    "MarginCallRateLiq"
    "PwdTrade"
    "PwdReadonly"
    "Desc" |]

let TACCT_sql_update = "[Updatedat]=@Updatedat,[SAC]=@SAC,[State]=@State,[TradeType]=@TradeType,[RealDemo]=@RealDemo,[PnL]=@PnL,[Frozen]=@Frozen,[Leverage]=@Leverage,[Margin]=@Margin,[MarginCallRateWarning]=@MarginCallRateWarning,[MarginCallRateWarningII]=@MarginCallRateWarningII,[MarginCallRateLiq]=@MarginCallRateLiq,[PwdTrade]=@PwdTrade,[PwdReadonly]=@PwdReadonly,[Desc]=@Desc"

let pTACCT_fields = [|
    FK("SAC")
    SelectLines("State", [| ("Normal","正常");("Frozen","冻结");("FrozenInvisible","冻结且不得查询");("LimitTrade","限制交易");("FrozenTrade","冻结交易") |])
    SelectLines("TradeType", [| ("Cash","现金");("Match","撮合");("Make","做市") |])
    SelectLines("RealDemo", [| ("Real","真实");("Demo","模拟") |])
    Float("PnL")
    Float("Frozen")
    Float("Leverage")
    Float("Margin")
    Float("MarginCallRateWarning")
    Float("MarginCallRateWarningII")
    Float("MarginCallRateLiq")
    Caption("PwdTrade", 64)
    Caption("PwdReadonly", 64)
    Text("Desc") |]

let pTACCT_empty(): pTACCT = {
    SAC = 0L
    State = EnumOfValue 0
    TradeType = EnumOfValue 0
    RealDemo = EnumOfValue 0
    PnL = 0.0
    Frozen = 0.0
    Leverage = 0.0
    Margin = 0.0
    MarginCallRateWarning = 0.0
    MarginCallRateWarningII = 0.0
    MarginCallRateLiq = 0.0
    PwdTrade = ""
    PwdReadonly = ""
    Desc = "" }

let TACCT_id = ref 96721375L
let TACCT_count = ref 0
let TACCT_table = "Market_TradeAcct"

// [Social_Bookmark] (BOOKMARK)

type bookmarkBindTypeEnum = 
| Undefined = 0 // 未定义
| Moment = 1 // 动态
| File = 2 // 文件
| EndUser = 3 // 用户
| Biz = 4 // 机构
| Group = 5 // 用户群

let bookmarkBindTypeEnums = [| bookmarkBindTypeEnum.Undefined; bookmarkBindTypeEnum.Moment; bookmarkBindTypeEnum.File; bookmarkBindTypeEnum.EndUser; bookmarkBindTypeEnum.Biz; bookmarkBindTypeEnum.Group |]
let bookmarkBindTypeEnumstrs = [| "bookmarkBindTypeEnum"; "bookmarkBindTypeEnum"; "bookmarkBindTypeEnum"; "bookmarkBindTypeEnum"; "bookmarkBindTypeEnum"; "bookmarkBindTypeEnum" |]
let bookmarkBindTypeNum = 6

let int__bookmarkBindTypeEnum v =
    match v with
    | 0 -> Some bookmarkBindTypeEnum.Undefined
    | 1 -> Some bookmarkBindTypeEnum.Moment
    | 2 -> Some bookmarkBindTypeEnum.File
    | 3 -> Some bookmarkBindTypeEnum.EndUser
    | 4 -> Some bookmarkBindTypeEnum.Biz
    | 5 -> Some bookmarkBindTypeEnum.Group
    | _ -> None

let str__bookmarkBindTypeEnum s =
    match s with
    | "Undefined" -> Some bookmarkBindTypeEnum.Undefined
    | "Moment" -> Some bookmarkBindTypeEnum.Moment
    | "File" -> Some bookmarkBindTypeEnum.File
    | "EndUser" -> Some bookmarkBindTypeEnum.EndUser
    | "Biz" -> Some bookmarkBindTypeEnum.Biz
    | "Group" -> Some bookmarkBindTypeEnum.Group
    | _ -> None

let bookmarkBindTypeEnum__caption e =
    match e with
    | bookmarkBindTypeEnum.Undefined -> "未定义"
    | bookmarkBindTypeEnum.Moment -> "动态"
    | bookmarkBindTypeEnum.File -> "文件"
    | bookmarkBindTypeEnum.EndUser -> "用户"
    | bookmarkBindTypeEnum.Biz -> "机构"
    | bookmarkBindTypeEnum.Group -> "用户群"
    | _ -> ""

type pBOOKMARK = {
mutable Agent: FK
mutable EndUser: FK
mutable Bind: Integer
mutable BindType: bookmarkBindTypeEnum
mutable BookmarkList: FK
mutable Notes: Text
mutable Path: Text
mutable Group: Caption
mutable Type: Integer}


type BOOKMARK = Rcd<pBOOKMARK>

let BOOKMARK_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Agent],[EndUser],[Bind],[BindType],[BookmarkList],[Notes],[Path],[Group],[Type]"

let pBOOKMARK_fieldordersArray = [|
    "Agent"
    "EndUser"
    "Bind"
    "BindType"
    "BookmarkList"
    "Notes"
    "Path"
    "Group"
    "Type" |]

let BOOKMARK_sql_update = "[Updatedat]=@Updatedat,[Agent]=@Agent,[EndUser]=@EndUser,[Bind]=@Bind,[BindType]=@BindType,[BookmarkList]=@BookmarkList,[Notes]=@Notes,[Path]=@Path,[Group]=@Group,[Type]=@Type"

let pBOOKMARK_fields = [|
    FK("Agent")
    FK("EndUser")
    Integer("Bind")
    SelectLines("BindType", [| ("Undefined","未定义");("Moment","动态");("File","文件");("EndUser","用户");("Biz","机构");("Group","用户群") |])
    FK("BookmarkList")
    Text("Notes")
    Text("Path")
    Caption("Group", 64)
    Integer("Type") |]

let pBOOKMARK_empty(): pBOOKMARK = {
    Agent = 0L
    EndUser = 0L
    Bind = 0L
    BindType = EnumOfValue 0
    BookmarkList = 0L
    Notes = ""
    Path = ""
    Group = ""
    Type = 0L }

let BOOKMARK_id = ref 0L
let BOOKMARK_count = ref 0
let BOOKMARK_table = "Social_Bookmark"

// [Social_BookmarkList] (SBL)

type sblPrivacyEnum = 
| Private = 0 // 私有
| Public = 1 // 公开

let sblPrivacyEnums = [| sblPrivacyEnum.Private; sblPrivacyEnum.Public |]
let sblPrivacyEnumstrs = [| "sblPrivacyEnum"; "sblPrivacyEnum" |]
let sblPrivacyNum = 2

let int__sblPrivacyEnum v =
    match v with
    | 0 -> Some sblPrivacyEnum.Private
    | 1 -> Some sblPrivacyEnum.Public
    | _ -> None

let str__sblPrivacyEnum s =
    match s with
    | "Private" -> Some sblPrivacyEnum.Private
    | "Public" -> Some sblPrivacyEnum.Public
    | _ -> None

let sblPrivacyEnum__caption e =
    match e with
    | sblPrivacyEnum.Private -> "私有"
    | sblPrivacyEnum.Public -> "公开"
    | _ -> ""

type sblTypeEnum = 
| Default = 0 // 默认
| PlayList = 1 // 播放列表
| PlayChanel = 2 // 播放频道

let sblTypeEnums = [| sblTypeEnum.Default; sblTypeEnum.PlayList; sblTypeEnum.PlayChanel |]
let sblTypeEnumstrs = [| "sblTypeEnum"; "sblTypeEnum"; "sblTypeEnum" |]
let sblTypeNum = 3

let int__sblTypeEnum v =
    match v with
    | 0 -> Some sblTypeEnum.Default
    | 1 -> Some sblTypeEnum.PlayList
    | 2 -> Some sblTypeEnum.PlayChanel
    | _ -> None

let str__sblTypeEnum s =
    match s with
    | "Default" -> Some sblTypeEnum.Default
    | "PlayList" -> Some sblTypeEnum.PlayList
    | "PlayChanel" -> Some sblTypeEnum.PlayChanel
    | _ -> None

let sblTypeEnum__caption e =
    match e with
    | sblTypeEnum.Default -> "默认"
    | sblTypeEnum.PlayList -> "播放列表"
    | sblTypeEnum.PlayChanel -> "播放频道"
    | _ -> ""

type pSBL = {
mutable EndUser: FK
mutable Caption: Caption
mutable Icon: Link
mutable Background: Link
mutable Desc: Text
mutable Privacy: sblPrivacyEnum
mutable Moment: FK
mutable Type: sblTypeEnum}


type SBL = Rcd<pSBL>

let SBL_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[EndUser],[Caption],[Icon],[Background],[Desc],[Privacy],[Moment],[Type]"

let pSBL_fieldordersArray = [|
    "EndUser"
    "Caption"
    "Icon"
    "Background"
    "Desc"
    "Privacy"
    "Moment"
    "Type" |]

let SBL_sql_update = "[Updatedat]=@Updatedat,[EndUser]=@EndUser,[Caption]=@Caption,[Icon]=@Icon,[Background]=@Background,[Desc]=@Desc,[Privacy]=@Privacy,[Moment]=@Moment,[Type]=@Type"

let pSBL_fields = [|
    FK("EndUser")
    Caption("Caption", 256)
    Link("Icon", 256)
    Link("Background", 256)
    Text("Desc")
    SelectLines("Privacy", [| ("Private","私有");("Public","公开") |])
    FK("Moment")
    SelectLines("Type", [| ("Default","默认");("PlayList","播放列表");("PlayChanel","播放频道") |]) |]

let pSBL_empty(): pSBL = {
    EndUser = 0L
    Caption = ""
    Icon = ""
    Background = ""
    Desc = ""
    Privacy = EnumOfValue 0
    Moment = 0L
    Type = EnumOfValue 0 }

let SBL_id = ref 0L
let SBL_count = ref 0
let SBL_table = "Social_BookmarkList"

// [Social_Follow] (FOLLOW)

type followFollowTypeEnum = 
| EndUser = 0 // 用户
| Biz = 1 // 机构
| BookmarkList = 2 // 收藏夹

let followFollowTypeEnums = [| followFollowTypeEnum.EndUser; followFollowTypeEnum.Biz; followFollowTypeEnum.BookmarkList |]
let followFollowTypeEnumstrs = [| "followFollowTypeEnum"; "followFollowTypeEnum"; "followFollowTypeEnum" |]
let followFollowTypeNum = 3

let int__followFollowTypeEnum v =
    match v with
    | 0 -> Some followFollowTypeEnum.EndUser
    | 1 -> Some followFollowTypeEnum.Biz
    | 2 -> Some followFollowTypeEnum.BookmarkList
    | _ -> None

let str__followFollowTypeEnum s =
    match s with
    | "EndUser" -> Some followFollowTypeEnum.EndUser
    | "Biz" -> Some followFollowTypeEnum.Biz
    | "BookmarkList" -> Some followFollowTypeEnum.BookmarkList
    | _ -> None

let followFollowTypeEnum__caption e =
    match e with
    | followFollowTypeEnum.EndUser -> "用户"
    | followFollowTypeEnum.Biz -> "机构"
    | followFollowTypeEnum.BookmarkList -> "收藏夹"
    | _ -> ""

type pFOLLOW = {
mutable EndUser: FK
mutable Followee: Integer
mutable FollowType: followFollowTypeEnum}


type FOLLOW = Rcd<pFOLLOW>

let FOLLOW_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[EndUser],[Followee],[FollowType]"

let pFOLLOW_fieldordersArray = [|
    "EndUser"
    "Followee"
    "FollowType" |]

let FOLLOW_sql_update = "[Updatedat]=@Updatedat,[EndUser]=@EndUser,[Followee]=@Followee,[FollowType]=@FollowType"

let pFOLLOW_fields = [|
    FK("EndUser")
    Integer("Followee")
    SelectLines("FollowType", [| ("EndUser","用户");("Biz","机构");("BookmarkList","收藏夹") |]) |]

let pFOLLOW_empty(): pFOLLOW = {
    EndUser = 0L
    Followee = 0L
    FollowType = EnumOfValue 0 }

let FOLLOW_id = ref 0L
let FOLLOW_count = ref 0
let FOLLOW_table = "Social_Follow"

// [Social_Moment] (MOMENT)

type momentBindTypeEnum = 
| EndUser = 0 // 用户
| Biz = 1 // 机构

let momentBindTypeEnums = [| momentBindTypeEnum.EndUser; momentBindTypeEnum.Biz |]
let momentBindTypeEnumstrs = [| "momentBindTypeEnum"; "momentBindTypeEnum" |]
let momentBindTypeNum = 2

let int__momentBindTypeEnum v =
    match v with
    | 0 -> Some momentBindTypeEnum.EndUser
    | 1 -> Some momentBindTypeEnum.Biz
    | _ -> None

let str__momentBindTypeEnum s =
    match s with
    | "EndUser" -> Some momentBindTypeEnum.EndUser
    | "Biz" -> Some momentBindTypeEnum.Biz
    | _ -> None

let momentBindTypeEnum__caption e =
    match e with
    | momentBindTypeEnum.EndUser -> "用户"
    | momentBindTypeEnum.Biz -> "机构"
    | _ -> ""

type momentTypeEnum = 
| Original = 0 // 原创图文视频
| Repost = 1 // 转发
| Thread = 2 // 文章
| Forum = 3 // 论坛
| Question = 4 // 问题
| Answer = 5 // 回答
| BookmarkList = 6 // 收藏夹
| Poll = 7 // 投票
| Miles = 8 // 文贵直播文字版
| Dict = 9 // 辞典
| WebPage = 10 // 页面
| MediaFile = 11 // 媒体文件

let momentTypeEnums = [| momentTypeEnum.Original; momentTypeEnum.Repost; momentTypeEnum.Thread; momentTypeEnum.Forum; momentTypeEnum.Question; momentTypeEnum.Answer; momentTypeEnum.BookmarkList; momentTypeEnum.Poll; momentTypeEnum.Miles; momentTypeEnum.Dict; momentTypeEnum.WebPage; momentTypeEnum.MediaFile |]
let momentTypeEnumstrs = [| "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum"; "momentTypeEnum" |]
let momentTypeNum = 12

let int__momentTypeEnum v =
    match v with
    | 0 -> Some momentTypeEnum.Original
    | 1 -> Some momentTypeEnum.Repost
    | 2 -> Some momentTypeEnum.Thread
    | 3 -> Some momentTypeEnum.Forum
    | 4 -> Some momentTypeEnum.Question
    | 5 -> Some momentTypeEnum.Answer
    | 6 -> Some momentTypeEnum.BookmarkList
    | 7 -> Some momentTypeEnum.Poll
    | 8 -> Some momentTypeEnum.Miles
    | 9 -> Some momentTypeEnum.Dict
    | 10 -> Some momentTypeEnum.WebPage
    | 11 -> Some momentTypeEnum.MediaFile
    | _ -> None

let str__momentTypeEnum s =
    match s with
    | "Original" -> Some momentTypeEnum.Original
    | "Repost" -> Some momentTypeEnum.Repost
    | "Thread" -> Some momentTypeEnum.Thread
    | "Forum" -> Some momentTypeEnum.Forum
    | "Question" -> Some momentTypeEnum.Question
    | "Answer" -> Some momentTypeEnum.Answer
    | "BookmarkList" -> Some momentTypeEnum.BookmarkList
    | "Poll" -> Some momentTypeEnum.Poll
    | "Miles" -> Some momentTypeEnum.Miles
    | "Dict" -> Some momentTypeEnum.Dict
    | "WebPage" -> Some momentTypeEnum.WebPage
    | "MediaFile" -> Some momentTypeEnum.MediaFile
    | _ -> None

let momentTypeEnum__caption e =
    match e with
    | momentTypeEnum.Original -> "原创图文视频"
    | momentTypeEnum.Repost -> "转发"
    | momentTypeEnum.Thread -> "文章"
    | momentTypeEnum.Forum -> "论坛"
    | momentTypeEnum.Question -> "问题"
    | momentTypeEnum.Answer -> "回答"
    | momentTypeEnum.BookmarkList -> "收藏夹"
    | momentTypeEnum.Poll -> "投票"
    | momentTypeEnum.Miles -> "文贵直播文字版"
    | momentTypeEnum.Dict -> "辞典"
    | momentTypeEnum.WebPage -> "页面"
    | momentTypeEnum.MediaFile -> "媒体文件"
    | _ -> ""

type momentStateEnum = 
| Normal = 0 // 正常
| Deleted = 1 // 标记删除
| Scratch = 2 // 草稿
| Submitted = 3 // 已投稿

let momentStateEnums = [| momentStateEnum.Normal; momentStateEnum.Deleted; momentStateEnum.Scratch; momentStateEnum.Submitted |]
let momentStateEnumstrs = [| "momentStateEnum"; "momentStateEnum"; "momentStateEnum"; "momentStateEnum" |]
let momentStateNum = 4

let int__momentStateEnum v =
    match v with
    | 0 -> Some momentStateEnum.Normal
    | 1 -> Some momentStateEnum.Deleted
    | 2 -> Some momentStateEnum.Scratch
    | 3 -> Some momentStateEnum.Submitted
    | _ -> None

let str__momentStateEnum s =
    match s with
    | "Normal" -> Some momentStateEnum.Normal
    | "Deleted" -> Some momentStateEnum.Deleted
    | "Scratch" -> Some momentStateEnum.Scratch
    | "Submitted" -> Some momentStateEnum.Submitted
    | _ -> None

let momentStateEnum__caption e =
    match e with
    | momentStateEnum.Normal -> "正常"
    | momentStateEnum.Deleted -> "标记删除"
    | momentStateEnum.Scratch -> "草稿"
    | momentStateEnum.Submitted -> "已投稿"
    | _ -> ""

type momentMediaTypeEnum = 
| None = 0 // 无
| Video = 1 // 视频
| Audio = 2 // 音频

let momentMediaTypeEnums = [| momentMediaTypeEnum.None; momentMediaTypeEnum.Video; momentMediaTypeEnum.Audio |]
let momentMediaTypeEnumstrs = [| "momentMediaTypeEnum"; "momentMediaTypeEnum"; "momentMediaTypeEnum" |]
let momentMediaTypeNum = 3

let int__momentMediaTypeEnum v =
    match v with
    | 0 -> Some momentMediaTypeEnum.None
    | 1 -> Some momentMediaTypeEnum.Video
    | 2 -> Some momentMediaTypeEnum.Audio
    | _ -> None

let str__momentMediaTypeEnum s =
    match s with
    | "None" -> Some momentMediaTypeEnum.None
    | "Video" -> Some momentMediaTypeEnum.Video
    | "Audio" -> Some momentMediaTypeEnum.Audio
    | _ -> None

let momentMediaTypeEnum__caption e =
    match e with
    | momentMediaTypeEnum.None -> "无"
    | momentMediaTypeEnum.Video -> "视频"
    | momentMediaTypeEnum.Audio -> "音频"
    | _ -> ""

type momentPostTypeEnum = 
| Normal = 0 // 正常
| Repost = 1 // 重发
| Quote = 2 // 引用

let momentPostTypeEnums = [| momentPostTypeEnum.Normal; momentPostTypeEnum.Repost; momentPostTypeEnum.Quote |]
let momentPostTypeEnumstrs = [| "momentPostTypeEnum"; "momentPostTypeEnum"; "momentPostTypeEnum" |]
let momentPostTypeNum = 3

let int__momentPostTypeEnum v =
    match v with
    | 0 -> Some momentPostTypeEnum.Normal
    | 1 -> Some momentPostTypeEnum.Repost
    | 2 -> Some momentPostTypeEnum.Quote
    | _ -> None

let str__momentPostTypeEnum s =
    match s with
    | "Normal" -> Some momentPostTypeEnum.Normal
    | "Repost" -> Some momentPostTypeEnum.Repost
    | "Quote" -> Some momentPostTypeEnum.Quote
    | _ -> None

let momentPostTypeEnum__caption e =
    match e with
    | momentPostTypeEnum.Normal -> "正常"
    | momentPostTypeEnum.Repost -> "重发"
    | momentPostTypeEnum.Quote -> "引用"
    | _ -> ""

type pMOMENT = {
mutable Agent: FK
mutable Bind: Integer
mutable BindType: momentBindTypeEnum
mutable BizCode: Chars
mutable Lang: FK
mutable Title: Text
mutable Summary: Text
mutable FullText: Text
mutable PreviewImgUrl: Text
mutable Link: Text
mutable Type: momentTypeEnum
mutable Question: FK
mutable State: momentStateEnum
mutable Group: FK
mutable Postedat: Timestamp
mutable Keywords: Text
mutable MediaType: momentMediaTypeEnum
mutable UrlOriginal: Text
mutable OID: Caption
mutable PostType: momentPostTypeEnum
mutable AudioUrl: Text}


type MOMENT = Rcd<pMOMENT>

let MOMENT_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Agent],[Bind],[BindType],[BizCode],[Lang],[Title],[Summary],[FullText],[PreviewImgUrl],[Link],[Type],[Question],[State],[Group],[Postedat],[Keywords],[MediaType],[UrlOriginal],[OID],[PostType],[AudioUrl]"

let pMOMENT_fieldordersArray = [|
    "Agent"
    "Bind"
    "BindType"
    "BizCode"
    "Lang"
    "Title"
    "Summary"
    "FullText"
    "PreviewImgUrl"
    "Link"
    "Type"
    "Question"
    "State"
    "Group"
    "Postedat"
    "Keywords"
    "MediaType"
    "UrlOriginal"
    "OID"
    "PostType"
    "AudioUrl" |]

let MOMENT_sql_update = "[Updatedat]=@Updatedat,[Agent]=@Agent,[Bind]=@Bind,[BindType]=@BindType,[BizCode]=@BizCode,[Lang]=@Lang,[Title]=@Title,[Summary]=@Summary,[FullText]=@FullText,[PreviewImgUrl]=@PreviewImgUrl,[Link]=@Link,[Type]=@Type,[Question]=@Question,[State]=@State,[Group]=@Group,[Postedat]=@Postedat,[Keywords]=@Keywords,[MediaType]=@MediaType,[UrlOriginal]=@UrlOriginal,[OID]=@OID,[PostType]=@PostType,[AudioUrl]=@AudioUrl"

let pMOMENT_fields = [|
    FK("Agent")
    Integer("Bind")
    SelectLines("BindType", [| ("EndUser","用户");("Biz","机构") |])
    Chars("BizCode", 256)
    FK("Lang")
    Text("Title")
    Text("Summary")
    Text("FullText")
    Text("PreviewImgUrl")
    Text("Link")
    SelectLines("Type", [| ("Original","原创图文视频");("Repost","转发");("Thread","文章");("Forum","论坛");("Question","问题");("Answer","回答");("BookmarkList","收藏夹");("Poll","投票");("Miles","文贵直播文字版");("Dict","辞典");("WebPage","页面");("MediaFile","媒体文件") |])
    FK("Question")
    SelectLines("State", [| ("Normal","正常");("Deleted","标记删除");("Scratch","草稿");("Submitted","已投稿") |])
    FK("Group")
    Timestamp("Postedat")
    Text("Keywords")
    SelectLines("MediaType", [| ("None","无");("Video","视频");("Audio","音频") |])
    Text("UrlOriginal")
    Caption("OID", 256)
    SelectLines("PostType", [| ("Normal","正常");("Repost","重发");("Quote","引用") |])
    Text("AudioUrl") |]

let pMOMENT_empty(): pMOMENT = {
    Agent = 0L
    Bind = 0L
    BindType = EnumOfValue 0
    BizCode = ""
    Lang = 0L
    Title = ""
    Summary = ""
    FullText = ""
    PreviewImgUrl = ""
    Link = ""
    Type = EnumOfValue 0
    Question = 0L
    State = EnumOfValue 0
    Group = 0L
    Postedat = DateTime.MinValue
    Keywords = ""
    MediaType = EnumOfValue 0
    UrlOriginal = ""
    OID = ""
    PostType = EnumOfValue 0
    AudioUrl = "" }

let MOMENT_id = ref 54864675L
let MOMENT_count = ref 0
let MOMENT_table = "Social_Moment"

// [Sys_Log] (LOG)

type pLOG = {
mutable Location: Text
mutable Content: Text
mutable Sql: Text}


type LOG = Rcd<pLOG>

let LOG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Location],[Content],[Sql]"

let pLOG_fieldordersArray = [|
    "Location"
    "Content"
    "Sql" |]

let LOG_sql_update = "[Updatedat]=@Updatedat,[Location]=@Location,[Content]=@Content,[Sql]=@Sql"

let pLOG_fields = [|
    Text("Location")
    Text("Content")
    Text("Sql") |]

let pLOG_empty(): pLOG = {
    Location = ""
    Content = ""
    Sql = "" }

let LOG_id = ref 0L
let LOG_count = ref 0
let LOG_table = "Sys_Log"

// [Trade_Arbitrage] (ARBITRAGE)

type pARBITRAGE = {
mutable Caption: Chars
mutable Desc: Text
mutable Fund: FK
mutable EndUser: FK}


type ARBITRAGE = Rcd<pARBITRAGE>

let ARBITRAGE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Desc],[Fund],[EndUser]"

let pARBITRAGE_fieldordersArray = [|
    "Caption"
    "Desc"
    "Fund"
    "EndUser" |]

let ARBITRAGE_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Desc]=@Desc,[Fund]=@Fund,[EndUser]=@EndUser"

let pARBITRAGE_fields = [|
    Chars("Caption", 64)
    Text("Desc")
    FK("Fund")
    FK("EndUser") |]

let pARBITRAGE_empty(): pARBITRAGE = {
    Caption = ""
    Desc = ""
    Fund = 0L
    EndUser = 0L }

let ARBITRAGE_id = ref 2978739L
let ARBITRAGE_count = ref 0
let ARBITRAGE_table = "Trade_Arbitrage"

// [Trade_Fund] (FUND)

type fundBindTypeEnum = 
| EndUser = 0 // 用户
| Biz = 1 // 机构

let fundBindTypeEnums = [| fundBindTypeEnum.EndUser; fundBindTypeEnum.Biz |]
let fundBindTypeEnumstrs = [| "fundBindTypeEnum"; "fundBindTypeEnum" |]
let fundBindTypeNum = 2

let int__fundBindTypeEnum v =
    match v with
    | 0 -> Some fundBindTypeEnum.EndUser
    | 1 -> Some fundBindTypeEnum.Biz
    | _ -> None

let str__fundBindTypeEnum s =
    match s with
    | "EndUser" -> Some fundBindTypeEnum.EndUser
    | "Biz" -> Some fundBindTypeEnum.Biz
    | _ -> None

let fundBindTypeEnum__caption e =
    match e with
    | fundBindTypeEnum.EndUser -> "用户"
    | fundBindTypeEnum.Biz -> "机构"
    | _ -> ""

type pFUND = {
mutable Caption: Chars
mutable Desc: Text
mutable Bind: Integer
mutable BindType: fundBindTypeEnum}


type FUND = Rcd<pFUND>

let FUND_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Desc],[Bind],[BindType]"

let pFUND_fieldordersArray = [|
    "Caption"
    "Desc"
    "Bind"
    "BindType" |]

let FUND_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Desc]=@Desc,[Bind]=@Bind,[BindType]=@BindType"

let pFUND_fields = [|
    Chars("Caption", 64)
    Text("Desc")
    Integer("Bind")
    SelectLines("BindType", [| ("EndUser","用户");("Biz","机构") |]) |]

let pFUND_empty(): pFUND = {
    Caption = ""
    Desc = ""
    Bind = 0L
    BindType = EnumOfValue 0 }

let FUND_id = ref 781294L
let FUND_count = ref 0
let FUND_table = "Trade_Fund"

// [Trade_Porfolio] (PORTFOLIO)

type portfolioBindTypeEnum = 
| EndUser = 0 // 用户
| Biz = 1 // 机构

let portfolioBindTypeEnums = [| portfolioBindTypeEnum.EndUser; portfolioBindTypeEnum.Biz |]
let portfolioBindTypeEnumstrs = [| "portfolioBindTypeEnum"; "portfolioBindTypeEnum" |]
let portfolioBindTypeNum = 2

let int__portfolioBindTypeEnum v =
    match v with
    | 0 -> Some portfolioBindTypeEnum.EndUser
    | 1 -> Some portfolioBindTypeEnum.Biz
    | _ -> None

let str__portfolioBindTypeEnum s =
    match s with
    | "EndUser" -> Some portfolioBindTypeEnum.EndUser
    | "Biz" -> Some portfolioBindTypeEnum.Biz
    | _ -> None

let portfolioBindTypeEnum__caption e =
    match e with
    | portfolioBindTypeEnum.EndUser -> "用户"
    | portfolioBindTypeEnum.Biz -> "机构"
    | _ -> ""

type pPORTFOLIO = {
mutable Caption: Chars
mutable Desc: Text
mutable Fund: FK
mutable Bind: Integer
mutable BindType: portfolioBindTypeEnum}


type PORTFOLIO = Rcd<pPORTFOLIO>

let PORTFOLIO_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Desc],[Fund],[Bind],[BindType]"

let pPORTFOLIO_fieldordersArray = [|
    "Caption"
    "Desc"
    "Fund"
    "Bind"
    "BindType" |]

let PORTFOLIO_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Desc]=@Desc,[Fund]=@Fund,[Bind]=@Bind,[BindType]=@BindType"

let pPORTFOLIO_fields = [|
    Chars("Caption", 64)
    Text("Desc")
    FK("Fund")
    Integer("Bind")
    SelectLines("BindType", [| ("EndUser","用户");("Biz","机构") |]) |]

let pPORTFOLIO_empty(): pPORTFOLIO = {
    Caption = ""
    Desc = ""
    Fund = 0L
    Bind = 0L
    BindType = EnumOfValue 0 }

let PORTFOLIO_id = ref 9782937L
let PORTFOLIO_count = ref 0
let PORTFOLIO_table = "Trade_Porfolio"

// [Trade_Trader] (TRADER)

type pTRADER = {
mutable Caption: Chars
mutable Desc: Text
mutable Ins: FK
mutable Stake: Float
mutable Entry: Float
mutable Exist: Float
mutable Fund: FK
mutable Portfolio: FK
mutable EndUser: FK}


type TRADER = Rcd<pTRADER>

let TRADER_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Desc],[Ins],[Stake],[Entry],[Exist],[Fund],[Portfolio],[EndUser]"

let pTRADER_fieldordersArray = [|
    "Caption"
    "Desc"
    "Ins"
    "Stake"
    "Entry"
    "Exist"
    "Fund"
    "Portfolio"
    "EndUser" |]

let TRADER_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Desc]=@Desc,[Ins]=@Ins,[Stake]=@Stake,[Entry]=@Entry,[Exist]=@Exist,[Fund]=@Fund,[Portfolio]=@Portfolio,[EndUser]=@EndUser"

let pTRADER_fields = [|
    Chars("Caption", 64)
    Text("Desc")
    FK("Ins")
    Float("Stake")
    Float("Entry")
    Float("Exist")
    FK("Fund")
    FK("Portfolio")
    FK("EndUser") |]

let pTRADER_empty(): pTRADER = {
    Caption = ""
    Desc = ""
    Ins = 0L
    Stake = 0.0
    Entry = 0.0
    Exist = 0.0
    Fund = 0L
    Portfolio = 0L
    EndUser = 0L }

let TRADER_id = ref 2978739L
let TRADER_count = ref 0
let TRADER_table = "Trade_Trader"
