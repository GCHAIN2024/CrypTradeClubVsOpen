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
| Default = 0 // Ĭ��
| Biz = 1 // ����
| EndUser = 2 // �û�

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
    | addressTypeEnum.Default -> "Ĭ��"
    | addressTypeEnum.Biz -> "����"
    | addressTypeEnum.EndUser -> "�û�"
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
    SelectLines("Type", [| ("Default","Ĭ��");("Biz","����");("EndUser","�û�") |])
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
| Normal = 0 // ����
| Hidden = 1 // ����
| Obsolete = 2 // ��ʱ

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
    | catStateEnum.Normal -> "����"
    | catStateEnum.Hidden -> "����"
    | catStateEnum.Obsolete -> "��ʱ"
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
    SelectLines("State", [| ("Normal","����");("Hidden","����");("Obsolete","��ʱ") |]) |]

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
| Legal = 0 // ����
| Crypto = 1 // ���ֱ�

let curCurTypeEnums = [| curCurTypeEnum.Legal; curCurTypeEnum.Crypto |]
let curCurTypeEnumstrs = [| "curCurTypeEnum"; "curCurTypeEnum" |]
let curCurTypeNum = 2

let int__curCurTypeEnum v =
    match v with
    | 0 -> Some curCurTypeEnum.Legal
    | 1 -> Some curCurTypeEnum.Crypto
    | _ -> None

let str__curCurTypeEnum s =
    match s with
    | "Legal" -> Some curCurTypeEnum.Legal
    | "Crypto" -> Some curCurTypeEnum.Crypto
    | _ -> None

let curCurTypeEnum__caption e =
    match e with
    | curCurTypeEnum.Legal -> "����"
    | curCurTypeEnum.Crypto -> "���ֱ�"
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
    SelectLines("CurType", [| ("Legal","����");("Crypto","���ֱ�") |])
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
| Unknown = 0 // δ֪
| Male = 1 // ��
| Female = 2 // Ů

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
    | euGenderEnum.Unknown -> "δ֪"
    | euGenderEnum.Male -> "��"
    | euGenderEnum.Female -> "Ů"
    | _ -> ""

type euStatusEnum = 
| Normal = 0 // ����
| Frozen = 1 // ����
| Terminated = 2 // ע��

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
    | euStatusEnum.Normal -> "����"
    | euStatusEnum.Frozen -> "����"
    | euStatusEnum.Terminated -> "ע��"
    | _ -> ""

type euAdminEnum = 
| None = 0 // ��
| Admin = 1 // ����Ա

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
    | euAdminEnum.None -> "��"
    | euAdminEnum.Admin -> "����Ա"
    | _ -> ""

type euVerifyEnum = 
| Normal = 0 // ����
| Verified = 1 // ��֤

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
    | euVerifyEnum.Normal -> "����"
    | euVerifyEnum.Verified -> "��֤"
    | _ -> ""

type euAgentableEnum = 
| No = 0 // ��
| Yes = 1 // ��

let euAgentableEnums = [| euAgentableEnum.No; euAgentableEnum.Yes |]
let euAgentableEnumstrs = [| "euAgentableEnum"; "euAgentableEnum" |]
let euAgentableNum = 2

let int__euAgentableEnum v =
    match v with
    | 0 -> Some euAgentableEnum.No
    | 1 -> Some euAgentableEnum.Yes
    | _ -> None

let str__euAgentableEnum s =
    match s with
    | "No" -> Some euAgentableEnum.No
    | "Yes" -> Some euAgentableEnum.Yes
    | _ -> None

let euAgentableEnum__caption e =
    match e with
    | euAgentableEnum.No -> "��"
    | euAgentableEnum.Yes -> "��"
    | _ -> ""

type pEU = {
mutable Caption: Caption
mutable Username: Caption
mutable Penname: Caption
mutable Rolfname: Caption
mutable Email: Chars
mutable Tel: Chars
mutable Domainname: FK
mutable Gender: euGenderEnum
mutable Status: euStatusEnum
mutable Admin: euAdminEnum
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
mutable Discord: Caption
mutable DiscordId: Integer
mutable Google: Caption
mutable GoogleId: Integer
mutable Apple: Caption
mutable AppleId: Integer
mutable OAuthProvider: Caption
mutable OAuthID: Caption
mutable GTV: Caption
mutable Gettr: Caption
mutable Farm: FK
mutable CountFollows: Integer
mutable CountFollowers: Integer
mutable CountMoments: Integer
mutable CountViews: Integer
mutable CountComments: Integer
mutable CountThumbUps: Integer
mutable CountThumbDns: Integer
mutable Lang: FK
mutable BizOperator: FK
mutable Url: Text
mutable About: Text
mutable PublicPoints: Integer
mutable Json: Text
mutable Agentable: euAgentableEnum}


type EU = Rcd<pEU>

let EU_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Username],[Penname],[Rolfname],[Email],[Tel],[Domainname],[Gender],[Status],[Admin],[Privilege],[Verify],[Pwd],[Online],[Icon],[Background],[BasicAcct],[Citizen],[Refer],[Referer],[Discord],[DiscordId],[Google],[GoogleId],[Apple],[AppleId],[OAuthProvider],[OAuthID],[GTV],[Gettr],[Farm],[CountFollows],[CountFollowers],[CountMoments],[CountViews],[CountComments],[CountThumbUps],[CountThumbDns],[Lang],[BizOperator],[Url],[About],[PublicPoints],[Json],[Agentable]"

let pEU_fieldordersArray = [|
    "Caption"
    "Username"
    "Penname"
    "Rolfname"
    "Email"
    "Tel"
    "Domainname"
    "Gender"
    "Status"
    "Admin"
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
    "Discord"
    "DiscordId"
    "Google"
    "GoogleId"
    "Apple"
    "AppleId"
    "OAuthProvider"
    "OAuthID"
    "GTV"
    "Gettr"
    "Farm"
    "CountFollows"
    "CountFollowers"
    "CountMoments"
    "CountViews"
    "CountComments"
    "CountThumbUps"
    "CountThumbDns"
    "Lang"
    "BizOperator"
    "Url"
    "About"
    "PublicPoints"
    "Json"
    "Agentable" |]

let EU_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Username]=@Username,[Penname]=@Penname,[Rolfname]=@Rolfname,[Email]=@Email,[Tel]=@Tel,[Domainname]=@Domainname,[Gender]=@Gender,[Status]=@Status,[Admin]=@Admin,[Privilege]=@Privilege,[Verify]=@Verify,[Pwd]=@Pwd,[Online]=@Online,[Icon]=@Icon,[Background]=@Background,[BasicAcct]=@BasicAcct,[Citizen]=@Citizen,[Refer]=@Refer,[Referer]=@Referer,[Discord]=@Discord,[DiscordId]=@DiscordId,[Google]=@Google,[GoogleId]=@GoogleId,[Apple]=@Apple,[AppleId]=@AppleId,[OAuthProvider]=@OAuthProvider,[OAuthID]=@OAuthID,[GTV]=@GTV,[Gettr]=@Gettr,[Farm]=@Farm,[CountFollows]=@CountFollows,[CountFollowers]=@CountFollowers,[CountMoments]=@CountMoments,[CountViews]=@CountViews,[CountComments]=@CountComments,[CountThumbUps]=@CountThumbUps,[CountThumbDns]=@CountThumbDns,[Lang]=@Lang,[BizOperator]=@BizOperator,[Url]=@Url,[About]=@About,[PublicPoints]=@PublicPoints,[Json]=@Json,[Agentable]=@Agentable"

let pEU_fields = [|
    Caption("Caption", 64)
    Caption("Username", 64)
    Caption("Penname", 64)
    Caption("Rolfname", 64)
    Chars("Email", 256)
    Chars("Tel", 32)
    FK("Domainname")
    SelectLines("Gender", [| ("Unknown","δ֪");("Male","��");("Female","Ů") |])
    SelectLines("Status", [| ("Normal","����");("Frozen","����");("Terminated","ע��") |])
    SelectLines("Admin", [| ("None","��");("Admin","����Ա") |])
    Integer("Privilege")
    SelectLines("Verify", [| ("Normal","����");("Verified","��֤") |])
    Chars("Pwd", 16)
    Boolean("Online")
    Link("Icon", 256)
    Link("Background", 256)
    FK("BasicAcct")
    FK("Citizen")
    Caption("Refer", 7)
    FK("Referer")
    Caption("Discord", 64)
    Integer("DiscordId")
    Caption("Google", 64)
    Integer("GoogleId")
    Caption("Apple", 64)
    Integer("AppleId")
    Caption("OAuthProvider", 64)
    Caption("OAuthID", 256)
    Caption("GTV", 64)
    Caption("Gettr", 64)
    FK("Farm")
    Integer("CountFollows")
    Integer("CountFollowers")
    Integer("CountMoments")
    Integer("CountViews")
    Integer("CountComments")
    Integer("CountThumbUps")
    Integer("CountThumbDns")
    FK("Lang")
    FK("BizOperator")
    Text("Url")
    Text("About")
    Integer("PublicPoints")
    Text("Json")
    SelectLines("Agentable", [| ("No","��");("Yes","��") |]) |]

let pEU_empty(): pEU = {
    Caption = ""
    Username = ""
    Penname = ""
    Rolfname = ""
    Email = ""
    Tel = ""
    Domainname = 0L
    Gender = EnumOfValue 0
    Status = EnumOfValue 0
    Admin = EnumOfValue 0
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
    Discord = ""
    DiscordId = 0L
    Google = ""
    GoogleId = 0L
    Apple = ""
    AppleId = 0L
    OAuthProvider = ""
    OAuthID = ""
    GTV = ""
    Gettr = ""
    Farm = 0L
    CountFollows = 0L
    CountFollowers = 0L
    CountMoments = 0L
    CountViews = 0L
    CountComments = 0L
    CountThumbUps = 0L
    CountThumbDns = 0L
    Lang = 0L
    BizOperator = 0L
    Url = ""
    About = ""
    PublicPoints = 0L
    Json = ""
    Agentable = EnumOfValue 0 }

let EU_id = ref 54367576L
let EU_count = ref 0
let EU_table = "Ca_EndUser"

// [Ca_File] (FILE)

type fileEncryptEnum = 
| None = 0 // δ����
| Sys = 1 // ϵͳ����
| Usr = 2 // �û�����

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
    | fileEncryptEnum.None -> "δ����"
    | fileEncryptEnum.Sys -> "ϵͳ����"
    | fileEncryptEnum.Usr -> "�û�����"
    | _ -> ""

type fileBindTypeEnum = 
| Sys = 0 // ϵͳ
| EndUser = 1 // �û�
| Biz = 2 // ����
| Group = 3 // Ⱥ

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
    | fileBindTypeEnum.Sys -> "ϵͳ"
    | fileBindTypeEnum.EndUser -> "�û�"
    | fileBindTypeEnum.Biz -> "����"
    | fileBindTypeEnum.Group -> "Ⱥ"
    | _ -> ""

type fileStateEnum = 
| Normal = 0 // ����
| Canceled = 1 // ��ȡ��
| Uploading = 2 // �ϴ���
| PendingTranscode = 3 // ��ý��ת��
| PendingBlockchain = 4 // ��������ͬ��
| Deleted = 5 // ��ɾ��

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
    | fileStateEnum.Normal -> "����"
    | fileStateEnum.Canceled -> "��ȡ��"
    | fileStateEnum.Uploading -> "�ϴ���"
    | fileStateEnum.PendingTranscode -> "��ý��ת��"
    | fileStateEnum.PendingBlockchain -> "��������ͬ��"
    | fileStateEnum.Deleted -> "��ɾ��"
    | _ -> ""

type fileFileTypeEnum = 
| Default = 0 // Ĭ��
| Text = 1 // �ı�
| Bin = 2 // ������
| Img = 3 // ͼƬ
| Video = 4 // ��Ƶ

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
    | fileFileTypeEnum.Default -> "Ĭ��"
    | fileFileTypeEnum.Text -> "�ı�"
    | fileFileTypeEnum.Bin -> "������"
    | fileFileTypeEnum.Img -> "ͼƬ"
    | fileFileTypeEnum.Video -> "��Ƶ"
    | _ -> ""

type pFILE = {
mutable Caption: Caption
mutable Ipfs: Text
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

let FILE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Ipfs],[Encrypt],[SHA256],[Size],[Bind],[BindType],[State],[Folder],[FileType],[JSON]"

let pFILE_fieldordersArray = [|
    "Caption"
    "Ipfs"
    "Encrypt"
    "SHA256"
    "Size"
    "Bind"
    "BindType"
    "State"
    "Folder"
    "FileType"
    "JSON" |]

let FILE_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Ipfs]=@Ipfs,[Encrypt]=@Encrypt,[SHA256]=@SHA256,[Size]=@Size,[Bind]=@Bind,[BindType]=@BindType,[State]=@State,[Folder]=@Folder,[FileType]=@FileType,[JSON]=@JSON"

let pFILE_fields = [|
    Caption("Caption", 256)
    Text("Ipfs")
    SelectLines("Encrypt", [| ("None","δ����");("Sys","ϵͳ����");("Usr","�û�����") |])
    Text("SHA256")
    Integer("Size")
    Integer("Bind")
    SelectLines("BindType", [| ("Sys","ϵͳ");("EndUser","�û�");("Biz","����");("Group","Ⱥ") |])
    SelectLines("State", [| ("Normal","����");("Canceled","��ȡ��");("Uploading","�ϴ���");("PendingTranscode","��ý��ת��");("PendingBlockchain","��������ͬ��");("Deleted","��ɾ��") |])
    FK("Folder")
    SelectLines("FileType", [| ("Default","Ĭ��");("Text","�ı�");("Bin","������");("Img","ͼƬ");("Video","��Ƶ") |])
    Text("JSON") |]

let pFILE_empty(): pFILE = {
    Caption = ""
    Ipfs = ""
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
| None = 0 // δ����
| Sys = 1 // ϵͳ����
| Usr = 2 // �û�����

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
    | folderEncryptEnum.None -> "δ����"
    | folderEncryptEnum.Sys -> "ϵͳ����"
    | folderEncryptEnum.Usr -> "�û�����"
    | _ -> ""

type folderBindTypeEnum = 
| Sys = 0 // ϵͳ
| EndUser = 1 // �û�
| Biz = 2 // ����
| Group = 3 // Ⱥ

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
    | folderBindTypeEnum.Sys -> "ϵͳ"
    | folderBindTypeEnum.EndUser -> "�û�"
    | folderBindTypeEnum.Biz -> "����"
    | folderBindTypeEnum.Group -> "Ⱥ"
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
    SelectLines("Encrypt", [| ("None","δ����");("Sys","ϵͳ����");("Usr","�û�����") |])
    Integer("Bind")
    SelectLines("BindType", [| ("Sys","ϵͳ");("EndUser","�û�");("Biz","����");("Group","Ⱥ") |])
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
| Default = 0 // Ĭ��
| RightToLeft = 1 // ����������

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
    | langTextDirectionEnum.Default -> "Ĭ��"
    | langTextDirectionEnum.RightToLeft -> "����������"
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
    SelectLines("TextDirection", [| ("Default","Ĭ��");("RightToLeft","����������") |]) |]

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
| Normal = 0 // ����
| ToplinesGlobalNews = 1 // ȫվ�����ö�
| ToplinesGlobalPerson = 2 // ȫվ�����ö�
| ToplinesGlobalEvent = 3 // ȫվ�¼��ö�

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
    | csiTypeEnum.Normal -> "����"
    | csiTypeEnum.ToplinesGlobalNews -> "ȫվ�����ö�"
    | csiTypeEnum.ToplinesGlobalPerson -> "ȫվ�����ö�"
    | csiTypeEnum.ToplinesGlobalEvent -> "ȫվ�¼��ö�"
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
    SelectLines("Type", [| ("Normal","����");("ToplinesGlobalNews","ȫվ�����ö�");("ToplinesGlobalPerson","ȫվ�����ö�");("ToplinesGlobalEvent","ȫվ�¼��ö�") |])
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

type momentProtectionEnum = 
| Normal = 0 // 常规
| Archive = 1 // 存档

let momentProtectionEnums = [| momentProtectionEnum.Normal; momentProtectionEnum.Archive |]
let momentProtectionEnumstrs = [| "momentProtectionEnum"; "momentProtectionEnum" |]
let momentProtectionNum = 2

let int__momentProtectionEnum v =
    match v with
    | 0 -> Some momentProtectionEnum.Normal
    | 1 -> Some momentProtectionEnum.Archive
    | _ -> None

let str__momentProtectionEnum s =
    match s with
    | "Normal" -> Some momentProtectionEnum.Normal
    | "Archive" -> Some momentProtectionEnum.Archive
    | _ -> None

let momentProtectionEnum__caption e =
    match e with
    | momentProtectionEnum.Normal -> "常规"
    | momentProtectionEnum.Archive -> "存档"
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
mutable Lang: FK
mutable ShortText: Text
mutable MediaUrls: Text
mutable PreviewImgUrl: Text
mutable Link: Text
mutable Type: momentTypeEnum
mutable Question: FK
mutable State: momentStateEnum
mutable Group: FK
mutable AutoTranslate: Integer
mutable OriginalMoment: FK
mutable Postedat: Timestamp
mutable ContentBind: Integer
mutable Keywords: Text
mutable Sticky: Integer
mutable Protection: momentProtectionEnum
mutable MediaType: momentMediaTypeEnum
mutable UrlOriginal: Text
mutable OID: Caption
mutable PostType: momentPostTypeEnum
mutable AudioUrl: Text}


type MOMENT = Rcd<pMOMENT>

let MOMENT_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Agent],[Bind],[BindType],[Lang],[ShortText],[MediaUrls],[PreviewImgUrl],[Link],[Type],[Question],[State],[Group],[AutoTranslate],[OriginalMoment],[Postedat],[ContentBind],[Keywords],[Sticky],[Protection],[MediaType],[UrlOriginal],[OID],[PostType],[AudioUrl]"

let pMOMENT_fieldordersArray = [|
    "Agent"
    "Bind"
    "BindType"
    "Lang"
    "ShortText"
    "MediaUrls"
    "PreviewImgUrl"
    "Link"
    "Type"
    "Question"
    "State"
    "Group"
    "AutoTranslate"
    "OriginalMoment"
    "Postedat"
    "ContentBind"
    "Keywords"
    "Sticky"
    "Protection"
    "MediaType"
    "UrlOriginal"
    "OID"
    "PostType"
    "AudioUrl" |]

let MOMENT_sql_update = "[Updatedat]=@Updatedat,[Agent]=@Agent,[Bind]=@Bind,[BindType]=@BindType,[Lang]=@Lang,[ShortText]=@ShortText,[MediaUrls]=@MediaUrls,[PreviewImgUrl]=@PreviewImgUrl,[Link]=@Link,[Type]=@Type,[Question]=@Question,[State]=@State,[Group]=@Group,[AutoTranslate]=@AutoTranslate,[OriginalMoment]=@OriginalMoment,[Postedat]=@Postedat,[ContentBind]=@ContentBind,[Keywords]=@Keywords,[Sticky]=@Sticky,[Protection]=@Protection,[MediaType]=@MediaType,[UrlOriginal]=@UrlOriginal,[OID]=@OID,[PostType]=@PostType,[AudioUrl]=@AudioUrl"

let pMOMENT_fields = [|
    FK("Agent")
    Integer("Bind")
    SelectLines("BindType", [| ("EndUser","用户");("Biz","机构") |])
    FK("Lang")
    Text("ShortText")
    Text("MediaUrls")
    Text("PreviewImgUrl")
    Text("Link")
    SelectLines("Type", [| ("Original","原创图文视频");("Repost","转发");("Thread","文章");("Forum","论坛");("Question","问题");("Answer","回答");("BookmarkList","收藏夹");("Poll","投票");("Miles","文贵直播文字版");("Dict","辞典");("WebPage","页面");("MediaFile","媒体文件") |])
    FK("Question")
    SelectLines("State", [| ("Normal","正常");("Deleted","标记删除");("Scratch","草稿");("Submitted","已投稿") |])
    FK("Group")
    Integer("AutoTranslate")
    FK("OriginalMoment")
    Timestamp("Postedat")
    Integer("ContentBind")
    Text("Keywords")
    Integer("Sticky")
    SelectLines("Protection", [| ("Normal","常规");("Archive","存档") |])
    SelectLines("MediaType", [| ("None","无");("Video","视频");("Audio","音频") |])
    Text("UrlOriginal")
    Caption("OID", 256)
    SelectLines("PostType", [| ("Normal","正常");("Repost","重发");("Quote","引用") |])
    Text("AudioUrl") |]

let pMOMENT_empty(): pMOMENT = {
    Agent = 0L
    Bind = 0L
    BindType = EnumOfValue 0
    Lang = 0L
    ShortText = ""
    MediaUrls = ""
    PreviewImgUrl = ""
    Link = ""
    Type = EnumOfValue 0
    Question = 0L
    State = EnumOfValue 0
    Group = 0L
    AutoTranslate = 0L
    OriginalMoment = 0L
    Postedat = DateTime.MinValue
    ContentBind = 0L
    Keywords = ""
    Sticky = 0L
    Protection = EnumOfValue 0
    MediaType = EnumOfValue 0
    UrlOriginal = ""
    OID = ""
    PostType = EnumOfValue 0
    AudioUrl = "" }

let MOMENT_id = ref 0L
let MOMENT_count = ref 0
let MOMENT_table = "Social_Moment"
