module Shared.OrmMor

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

open System.Data.SqlClient
open System.Threading
open Util.Bin
open Shared.OrmTypes
open Shared.Types

// [ADDRESS] Structure

let pADDRESS__bin (bb:BytesBuilder) (p:pADDRESS) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binLine1 = p.Line1 |> Encoding.UTF8.GetBytes
    binLine1.Length |> BitConverter.GetBytes |> bb.append
    binLine1 |> bb.append
    
    let binLine2 = p.Line2 |> Encoding.UTF8.GetBytes
    binLine2.Length |> BitConverter.GetBytes |> bb.append
    binLine2 |> bb.append
    
    let binState = p.State |> Encoding.UTF8.GetBytes
    binState.Length |> BitConverter.GetBytes |> bb.append
    binState |> bb.append
    
    let binCounty = p.County |> Encoding.UTF8.GetBytes
    binCounty.Length |> BitConverter.GetBytes |> bb.append
    binCounty |> bb.append
    
    let binTown = p.Town |> Encoding.UTF8.GetBytes
    binTown.Length |> BitConverter.GetBytes |> bb.append
    binTown |> bb.append
    
    let binContact = p.Contact |> Encoding.UTF8.GetBytes
    binContact.Length |> BitConverter.GetBytes |> bb.append
    binContact |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append
    
    let binEmail = p.Email |> Encoding.UTF8.GetBytes
    binEmail.Length |> BitConverter.GetBytes |> bb.append
    binEmail |> bb.append
    
    let binZip = p.Zip |> Encoding.UTF8.GetBytes
    binZip.Length |> BitConverter.GetBytes |> bb.append
    binZip |> bb.append
    
    p.City |> BitConverter.GetBytes |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    let binRemarks = p.Remarks |> Encoding.UTF8.GetBytes
    binRemarks.Length |> BitConverter.GetBytes |> bb.append
    binRemarks |> bb.append

let ADDRESS__bin (bb:BytesBuilder) (v:ADDRESS) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pADDRESS__bin bb v.p

let bin__pADDRESS (bi:BinIndexed):pADDRESS =
    let bin,index = bi

    let p = pADDRESS_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Line1 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Line1 <- Encoding.UTF8.GetString(bin,index.Value,count_Line1)
    index.Value <- index.Value + count_Line1
    
    let count_Line2 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Line2 <- Encoding.UTF8.GetString(bin,index.Value,count_Line2)
    index.Value <- index.Value + count_Line2
    
    let count_State = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.State <- Encoding.UTF8.GetString(bin,index.Value,count_State)
    index.Value <- index.Value + count_State
    
    let count_County = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.County <- Encoding.UTF8.GetString(bin,index.Value,count_County)
    index.Value <- index.Value + count_County
    
    let count_Town = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Town <- Encoding.UTF8.GetString(bin,index.Value,count_Town)
    index.Value <- index.Value + count_Town
    
    let count_Contact = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Contact <- Encoding.UTF8.GetString(bin,index.Value,count_Contact)
    index.Value <- index.Value + count_Contact
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    let count_Email = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Email <- Encoding.UTF8.GetString(bin,index.Value,count_Email)
    index.Value <- index.Value + count_Email
    
    let count_Zip = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Zip <- Encoding.UTF8.GetString(bin,index.Value,count_Zip)
    index.Value <- index.Value + count_Zip
    
    p.City <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Remarks = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Remarks <- Encoding.UTF8.GetString(bin,index.Value,count_Remarks)
    index.Value <- index.Value + count_Remarks
    
    p

let bin__ADDRESS (bi:BinIndexed):ADDRESS =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pADDRESS bi }

let pADDRESS__json (p:pADDRESS) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Line1",p.Line1 |> Json.Str)
        ("Line2",p.Line2 |> Json.Str)
        ("State",p.State |> Json.Str)
        ("County",p.County |> Json.Str)
        ("Town",p.Town |> Json.Str)
        ("Contact",p.Contact |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Zip",p.Zip |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Remarks",p.Remarks |> Json.Str) |]
    |> Json.Braket

let ADDRESS__json (v:ADDRESS) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Line1",p.Line1 |> Json.Str)
        ("Line2",p.Line2 |> Json.Str)
        ("State",p.State |> Json.Str)
        ("County",p.County |> Json.Str)
        ("Town",p.Town |> Json.Str)
        ("Contact",p.Contact |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Zip",p.Zip |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Remarks",p.Remarks |> Json.Str) |]
    |> Json.Braket

let ADDRESS__jsonTbw (w:TextBlockWriter) (v:ADDRESS) =
    json__str w (ADDRESS__json v)

let ADDRESS__jsonStr (v:ADDRESS) =
    (ADDRESS__json v) |> json__strFinal


let json__pADDRESSo (json:Json):pADDRESS option =
    let fields = json |> json__items

    let p = pADDRESS_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Line1 <- checkfieldz fields "Line1" 300
    
    p.Line2 <- checkfieldz fields "Line2" 300
    
    p.State <- checkfieldz fields "State" 16
    
    p.County <- checkfieldz fields "County" 16
    
    p.Town <- checkfieldz fields "Town" 16
    
    p.Contact <- checkfieldz fields "Contact" 64
    
    p.Tel <- checkfieldz fields "Tel" 20
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Zip <- checkfieldz fields "Zip" 16
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Remarks <- checkfield fields "Remarks"
    
    p |> Some
    

let json__ADDRESSo (json:Json):ADDRESS option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pADDRESS_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Line1 <- checkfieldz fields "Line1" 300
    
    p.Line2 <- checkfieldz fields "Line2" 300
    
    p.State <- checkfieldz fields "State" 16
    
    p.County <- checkfieldz fields "County" 16
    
    p.Town <- checkfieldz fields "Town" 16
    
    p.Contact <- checkfieldz fields "Contact" 64
    
    p.Tel <- checkfieldz fields "Tel" 20
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Zip <- checkfieldz fields "Zip" 16
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Remarks <- checkfield fields "Remarks"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [AIRPORT] Structure

let pAIRPORT__bin (bb:BytesBuilder) (p:pAIRPORT) =

    
    let binCode3IATA = p.Code3IATA |> Encoding.UTF8.GetBytes
    binCode3IATA.Length |> BitConverter.GetBytes |> bb.append
    binCode3IATA |> bb.append
    
    let binCode4ICAO = p.Code4ICAO |> Encoding.UTF8.GetBytes
    binCode4ICAO.Length |> BitConverter.GetBytes |> bb.append
    binCode4ICAO |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binCaptionEn = p.CaptionEn |> Encoding.UTF8.GetBytes
    binCaptionEn.Length |> BitConverter.GetBytes |> bb.append
    binCaptionEn |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    p.City |> BitConverter.GetBytes |> bb.append
    
    p.IsMetropolitan |> BitConverter.GetBytes |> bb.append

let AIRPORT__bin (bb:BytesBuilder) (v:AIRPORT) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pAIRPORT__bin bb v.p

let bin__pAIRPORT (bi:BinIndexed):pAIRPORT =
    let bin,index = bi

    let p = pAIRPORT_empty()
    
    let count_Code3IATA = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code3IATA <- Encoding.UTF8.GetString(bin,index.Value,count_Code3IATA)
    index.Value <- index.Value + count_Code3IATA
    
    let count_Code4ICAO = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code4ICAO <- Encoding.UTF8.GetString(bin,index.Value,count_Code4ICAO)
    index.Value <- index.Value + count_Code4ICAO
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_CaptionEn = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.CaptionEn <- Encoding.UTF8.GetString(bin,index.Value,count_CaptionEn)
    index.Value <- index.Value + count_CaptionEn
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.City <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.IsMetropolitan <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p

let bin__AIRPORT (bi:BinIndexed):AIRPORT =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pAIRPORT bi }

let pAIRPORT__json (p:pAIRPORT) =

    [|
        ("Code3IATA",p.Code3IATA |> Json.Str)
        ("Code4ICAO",p.Code4ICAO |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("CaptionEn",p.CaptionEn |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("City",p.City.ToString() |> Json.Num)
        ("IsMetropolitan",if p.IsMetropolitan then Json.True else Json.False) |]
    |> Json.Braket

let AIRPORT__json (v:AIRPORT) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code3IATA",p.Code3IATA |> Json.Str)
        ("Code4ICAO",p.Code4ICAO |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("CaptionEn",p.CaptionEn |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("City",p.City.ToString() |> Json.Num)
        ("IsMetropolitan",if p.IsMetropolitan then Json.True else Json.False) |]
    |> Json.Braket

let AIRPORT__jsonTbw (w:TextBlockWriter) (v:AIRPORT) =
    json__str w (AIRPORT__json v)

let AIRPORT__jsonStr (v:AIRPORT) =
    (AIRPORT__json v) |> json__strFinal


let json__pAIRPORTo (json:Json):pAIRPORT option =
    let fields = json |> json__items

    let p = pAIRPORT_empty()
    
    p.Code3IATA <- checkfieldz fields "Code3IATA" 3
    
    p.Code4ICAO <- checkfieldz fields "Code4ICAO" 4
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.CaptionEn <- checkfieldz fields "CaptionEn" 64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.IsMetropolitan <- checkfield fields "IsMetropolitan" = "true"
    
    p |> Some
    

let json__AIRPORTo (json:Json):AIRPORT option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pAIRPORT_empty()
    
    p.Code3IATA <- checkfieldz fields "Code3IATA" 3
    
    p.Code4ICAO <- checkfieldz fields "Code4ICAO" 4
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.CaptionEn <- checkfieldz fields "CaptionEn" 64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.IsMetropolitan <- checkfield fields "IsMetropolitan" = "true"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [BIZ] Structure

let pBIZ__bin (bb:BytesBuilder) (p:pBIZ) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Parent |> BitConverter.GetBytes |> bb.append
    
    p.BasicAcct |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    let binWebsite = p.Website |> Encoding.UTF8.GetBytes
    binWebsite.Length |> BitConverter.GetBytes |> bb.append
    binWebsite |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.City |> BitConverter.GetBytes |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    p.IsSocial |> BitConverter.GetBytes |> bb.append
    
    p.IsCmsSource |> BitConverter.GetBytes |> bb.append
    
    p.IsPay |> BitConverter.GetBytes |> bb.append
    
    p.MomentLatest |> BitConverter.GetBytes |> bb.append
    
    p.CountFollowers |> BitConverter.GetBytes |> bb.append
    
    p.CountFollows |> BitConverter.GetBytes |> bb.append
    
    p.CountMoments |> BitConverter.GetBytes |> bb.append
    
    p.CountViews |> BitConverter.GetBytes |> bb.append
    
    p.CountComments |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbUps |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbDns |> BitConverter.GetBytes |> bb.append
    
    p.IsCrawling |> BitConverter.GetBytes |> bb.append
    
    p.IsGSeries |> BitConverter.GetBytes |> bb.append
    
    let binRemarksCentral = p.RemarksCentral |> Encoding.UTF8.GetBytes
    binRemarksCentral.Length |> BitConverter.GetBytes |> bb.append
    binRemarksCentral |> bb.append
    
    p.Agent |> BitConverter.GetBytes |> bb.append
    
    let binSiteCats = p.SiteCats |> Encoding.UTF8.GetBytes
    binSiteCats.Length |> BitConverter.GetBytes |> bb.append
    binSiteCats |> bb.append
    
    let binConfiguredCats = p.ConfiguredCats |> Encoding.UTF8.GetBytes
    binConfiguredCats.Length |> BitConverter.GetBytes |> bb.append
    binConfiguredCats |> bb.append

let BIZ__bin (bb:BytesBuilder) (v:BIZ) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pBIZ__bin bb v.p

let bin__pBIZ (bi:BinIndexed):pBIZ =
    let bin,index = bi

    let p = pBIZ_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Parent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BasicAcct <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    let count_Website = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Website <- Encoding.UTF8.GetString(bin,index.Value,count_Website)
    index.Value <- index.Value + count_Website
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.City <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.IsSocial <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsCmsSource <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsPay <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.MomentLatest <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollowers <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollows <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountMoments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountViews <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountComments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbUps <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbDns <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.IsCrawling <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsGSeries <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_RemarksCentral = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RemarksCentral <- Encoding.UTF8.GetString(bin,index.Value,count_RemarksCentral)
    index.Value <- index.Value + count_RemarksCentral
    
    p.Agent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_SiteCats = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.SiteCats <- Encoding.UTF8.GetString(bin,index.Value,count_SiteCats)
    index.Value <- index.Value + count_SiteCats
    
    let count_ConfiguredCats = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ConfiguredCats <- Encoding.UTF8.GetString(bin,index.Value,count_ConfiguredCats)
    index.Value <- index.Value + count_ConfiguredCats
    
    p

let bin__BIZ (bi:BinIndexed):BIZ =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pBIZ bi }

let pBIZ__json (p:pBIZ) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Parent",p.Parent.ToString() |> Json.Num)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Website",p.Website |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("IsSocial",if p.IsSocial then Json.True else Json.False)
        ("IsCmsSource",if p.IsCmsSource then Json.True else Json.False)
        ("IsPay",if p.IsPay then Json.True else Json.False)
        ("MomentLatest",p.MomentLatest.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("IsCrawling",if p.IsCrawling then Json.True else Json.False)
        ("IsGSeries",if p.IsGSeries then Json.True else Json.False)
        ("RemarksCentral",p.RemarksCentral |> Json.Str)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("SiteCats",p.SiteCats |> Json.Str)
        ("ConfiguredCats",p.ConfiguredCats |> Json.Str) |]
    |> Json.Braket

let BIZ__json (v:BIZ) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Parent",p.Parent.ToString() |> Json.Num)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Website",p.Website |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("IsSocial",if p.IsSocial then Json.True else Json.False)
        ("IsCmsSource",if p.IsCmsSource then Json.True else Json.False)
        ("IsPay",if p.IsPay then Json.True else Json.False)
        ("MomentLatest",p.MomentLatest.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("IsCrawling",if p.IsCrawling then Json.True else Json.False)
        ("IsGSeries",if p.IsGSeries then Json.True else Json.False)
        ("RemarksCentral",p.RemarksCentral |> Json.Str)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("SiteCats",p.SiteCats |> Json.Str)
        ("ConfiguredCats",p.ConfiguredCats |> Json.Str) |]
    |> Json.Braket

let BIZ__jsonTbw (w:TextBlockWriter) (v:BIZ) =
    json__str w (BIZ__json v)

let BIZ__jsonStr (v:BIZ) =
    (BIZ__json v) |> json__strFinal


let json__pBIZo (json:Json):pBIZ option =
    let fields = json |> json__items

    let p = pBIZ_empty()
    
    p.Code <- checkfieldz fields "Code" 256
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Website <- checkfieldz fields "Website" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.IsSocial <- checkfield fields "IsSocial" = "true"
    
    p.IsCmsSource <- checkfield fields "IsCmsSource" = "true"
    
    p.IsPay <- checkfield fields "IsPay" = "true"
    
    p.MomentLatest <- checkfield fields "MomentLatest" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.IsCrawling <- checkfield fields "IsCrawling" = "true"
    
    p.IsGSeries <- checkfield fields "IsGSeries" = "true"
    
    p.RemarksCentral <- checkfield fields "RemarksCentral"
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.SiteCats <- checkfield fields "SiteCats"
    
    p.ConfiguredCats <- checkfield fields "ConfiguredCats"
    
    p |> Some
    

let json__BIZo (json:Json):BIZ option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pBIZ_empty()
    
    p.Code <- checkfieldz fields "Code" 256
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Website <- checkfieldz fields "Website" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.IsSocial <- checkfield fields "IsSocial" = "true"
    
    p.IsCmsSource <- checkfield fields "IsCmsSource" = "true"
    
    p.IsPay <- checkfield fields "IsPay" = "true"
    
    p.MomentLatest <- checkfield fields "MomentLatest" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.IsCrawling <- checkfield fields "IsCrawling" = "true"
    
    p.IsGSeries <- checkfield fields "IsGSeries" = "true"
    
    p.RemarksCentral <- checkfield fields "RemarksCentral"
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.SiteCats <- checkfield fields "SiteCats"
    
    p.ConfiguredCats <- checkfield fields "ConfiguredCats"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CAT] Structure

let pCAT__bin (bb:BytesBuilder) (p:pCAT) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    p.Zh |> BitConverter.GetBytes |> bb.append
    
    p.Parent |> BitConverter.GetBytes |> bb.append
    
    p.State |> EnumToValue |> BitConverter.GetBytes |> bb.append

let CAT__bin (bb:BytesBuilder) (v:CAT) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCAT__bin bb v.p

let bin__pCAT (bi:BinIndexed):pCAT =
    let bin,index = bi

    let p = pCAT_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Zh <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Parent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.State <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__CAT (bi:BinIndexed):CAT =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCAT bi }

let pCAT__json (p:pCAT) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Zh",p.Zh.ToString() |> Json.Num)
        ("Parent",p.Parent.ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let CAT__json (v:CAT) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Zh",p.Zh.ToString() |> Json.Num)
        ("Parent",p.Parent.ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let CAT__jsonTbw (w:TextBlockWriter) (v:CAT) =
    json__str w (CAT__json v)

let CAT__jsonStr (v:CAT) =
    (CAT__json v) |> json__strFinal


let json__pCATo (json:Json):pCAT option =
    let fields = json |> json__items

    let p = pCAT_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Zh <- checkfield fields "Zh" |> parse_int64
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__CATo (json:Json):CAT option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCAT_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Zh <- checkfield fields "Zh" |> parse_int64
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CITY] Structure

let pCITY__bin (bb:BytesBuilder) (p:pCITY) =

    
    let binName = p.Name |> Encoding.UTF8.GetBytes
    binName.Length |> BitConverter.GetBytes |> bb.append
    binName |> bb.append
    
    let binMetropolitanCode3IATA = p.MetropolitanCode3IATA |> Encoding.UTF8.GetBytes
    binMetropolitanCode3IATA.Length |> BitConverter.GetBytes |> bb.append
    binMetropolitanCode3IATA |> bb.append
    
    let binNameEn = p.NameEn |> Encoding.UTF8.GetBytes
    binNameEn.Length |> BitConverter.GetBytes |> bb.append
    binNameEn |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    p.Place |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append

let CITY__bin (bb:BytesBuilder) (v:CITY) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCITY__bin bb v.p

let bin__pCITY (bi:BinIndexed):pCITY =
    let bin,index = bi

    let p = pCITY_empty()
    
    let count_Name = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Name <- Encoding.UTF8.GetString(bin,index.Value,count_Name)
    index.Value <- index.Value + count_Name
    
    let count_MetropolitanCode3IATA = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.MetropolitanCode3IATA <- Encoding.UTF8.GetString(bin,index.Value,count_MetropolitanCode3IATA)
    index.Value <- index.Value + count_MetropolitanCode3IATA
    
    let count_NameEn = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.NameEn <- Encoding.UTF8.GetString(bin,index.Value,count_NameEn)
    index.Value <- index.Value + count_NameEn
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Place <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    p

let bin__CITY (bi:BinIndexed):CITY =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCITY bi }

let pCITY__json (p:pCITY) =

    [|
        ("Name",p.Name |> Json.Str)
        ("MetropolitanCode3IATA",p.MetropolitanCode3IATA |> Json.Str)
        ("NameEn",p.NameEn |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Place",p.Place.ToString() |> Json.Num)
        ("Icon",p.Icon |> Json.Str)
        ("Tel",p.Tel |> Json.Str) |]
    |> Json.Braket

let CITY__json (v:CITY) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Name",p.Name |> Json.Str)
        ("MetropolitanCode3IATA",p.MetropolitanCode3IATA |> Json.Str)
        ("NameEn",p.NameEn |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Place",p.Place.ToString() |> Json.Num)
        ("Icon",p.Icon |> Json.Str)
        ("Tel",p.Tel |> Json.Str) |]
    |> Json.Braket

let CITY__jsonTbw (w:TextBlockWriter) (v:CITY) =
    json__str w (CITY__json v)

let CITY__jsonStr (v:CITY) =
    (CITY__json v) |> json__strFinal


let json__pCITYo (json:Json):pCITY option =
    let fields = json |> json__items

    let p = pCITY_empty()
    
    p.Name <- checkfieldz fields "Name" 64
    
    p.MetropolitanCode3IATA <- checkfieldz fields "MetropolitanCode3IATA" 3
    
    p.NameEn <- checkfieldz fields "NameEn" 64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Place <- checkfield fields "Place" |> parse_int64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Tel <- checkfieldz fields "Tel" 4
    
    p |> Some
    

let json__CITYo (json:Json):CITY option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCITY_empty()
    
    p.Name <- checkfieldz fields "Name" 64
    
    p.MetropolitanCode3IATA <- checkfieldz fields "MetropolitanCode3IATA" 3
    
    p.NameEn <- checkfieldz fields "NameEn" 64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Place <- checkfield fields "Place" |> parse_int64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Tel <- checkfieldz fields "Tel" 4
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CRY] Structure

let pCRY__bin (bb:BytesBuilder) (p:pCRY) =

    
    let binCode2 = p.Code2 |> Encoding.UTF8.GetBytes
    binCode2.Length |> BitConverter.GetBytes |> bb.append
    binCode2 |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binFullname = p.Fullname |> Encoding.UTF8.GetBytes
    binFullname.Length |> BitConverter.GetBytes |> bb.append
    binFullname |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append
    
    p.Cur |> BitConverter.GetBytes |> bb.append
    
    p.Capital |> BitConverter.GetBytes |> bb.append
    
    p.Place |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append

let CRY__bin (bb:BytesBuilder) (v:CRY) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCRY__bin bb v.p

let bin__pCRY (bi:BinIndexed):pCRY =
    let bin,index = bi

    let p = pCRY_empty()
    
    let count_Code2 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code2 <- Encoding.UTF8.GetString(bin,index.Value,count_Code2)
    index.Value <- index.Value + count_Code2
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Fullname = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Fullname <- Encoding.UTF8.GetString(bin,index.Value,count_Fullname)
    index.Value <- index.Value + count_Fullname
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    p.Cur <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Capital <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Place <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__CRY (bi:BinIndexed):CRY =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCRY bi }

let pCRY__json (p:pCRY) =

    [|
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Fullname",p.Fullname |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Cur",p.Cur.ToString() |> Json.Num)
        ("Capital",p.Capital.ToString() |> Json.Num)
        ("Place",p.Place.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num) |]
    |> Json.Braket

let CRY__json (v:CRY) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Fullname",p.Fullname |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Cur",p.Cur.ToString() |> Json.Num)
        ("Capital",p.Capital.ToString() |> Json.Num)
        ("Place",p.Place.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num) |]
    |> Json.Braket

let CRY__jsonTbw (w:TextBlockWriter) (v:CRY) =
    json__str w (CRY__json v)

let CRY__jsonStr (v:CRY) =
    (CRY__json v) |> json__strFinal


let json__pCRYo (json:Json):pCRY option =
    let fields = json |> json__items

    let p = pCRY_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Fullname <- checkfieldz fields "Fullname" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Tel <- checkfieldz fields "Tel" 4
    
    p.Cur <- checkfield fields "Cur" |> parse_int64
    
    p.Capital <- checkfield fields "Capital" |> parse_int64
    
    p.Place <- checkfield fields "Place" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p |> Some
    

let json__CRYo (json:Json):CRY option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCRY_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Fullname <- checkfieldz fields "Fullname" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Tel <- checkfieldz fields "Tel" 4
    
    p.Cur <- checkfield fields "Cur" |> parse_int64
    
    p.Capital <- checkfield fields "Capital" |> parse_int64
    
    p.Place <- checkfield fields "Place" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CUR] Structure

let pCUR__bin (bb:BytesBuilder) (p:pCUR) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Hidden |> BitConverter.GetBytes |> bb.append
    
    p.IsSac |> BitConverter.GetBytes |> bb.append
    
    p.IsTransfer |> BitConverter.GetBytes |> bb.append
    
    p.IsCash |> BitConverter.GetBytes |> bb.append
    
    p.EnableReward |> BitConverter.GetBytes |> bb.append
    
    p.EnableOTC |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.CurType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Dec |> BitConverter.GetBytes |> bb.append
    
    p.AnchorRate |> BitConverter.GetBytes |> bb.append
    
    p.Freezable |> BitConverter.GetBytes |> bb.append
    
    p.Authorizable |> BitConverter.GetBytes |> bb.append
    
    let binChaninID = p.ChaninID |> Encoding.UTF8.GetBytes
    binChaninID.Length |> BitConverter.GetBytes |> bb.append
    binChaninID |> bb.append
    
    let binChaninName = p.ChaninName |> Encoding.UTF8.GetBytes
    binChaninName.Length |> BitConverter.GetBytes |> bb.append
    binChaninName |> bb.append
    
    let binContractAddress = p.ContractAddress |> Encoding.UTF8.GetBytes
    binContractAddress.Length |> BitConverter.GetBytes |> bb.append
    binContractAddress |> bb.append
    
    let binWalletAddress = p.WalletAddress |> Encoding.UTF8.GetBytes
    binWalletAddress.Length |> BitConverter.GetBytes |> bb.append
    binWalletAddress |> bb.append
    
    p.BaseRate |> BitConverter.GetBytes |> bb.append

let CUR__bin (bb:BytesBuilder) (v:CUR) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCUR__bin bb v.p

let bin__pCUR (bi:BinIndexed):pCUR =
    let bin,index = bi

    let p = pCUR_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Hidden <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsSac <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsTransfer <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsCash <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.EnableReward <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.EnableOTC <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.CurType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Dec <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.AnchorRate <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Freezable <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.Authorizable <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_ChaninID = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ChaninID <- Encoding.UTF8.GetString(bin,index.Value,count_ChaninID)
    index.Value <- index.Value + count_ChaninID
    
    let count_ChaninName = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ChaninName <- Encoding.UTF8.GetString(bin,index.Value,count_ChaninName)
    index.Value <- index.Value + count_ChaninName
    
    let count_ContractAddress = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ContractAddress <- Encoding.UTF8.GetString(bin,index.Value,count_ContractAddress)
    index.Value <- index.Value + count_ContractAddress
    
    let count_WalletAddress = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.WalletAddress <- Encoding.UTF8.GetString(bin,index.Value,count_WalletAddress)
    index.Value <- index.Value + count_WalletAddress
    
    p.BaseRate <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__CUR (bi:BinIndexed):CUR =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCUR bi }

let pCUR__json (p:pCUR) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Hidden",if p.Hidden then Json.True else Json.False)
        ("IsSac",if p.IsSac then Json.True else Json.False)
        ("IsTransfer",if p.IsTransfer then Json.True else Json.False)
        ("IsCash",if p.IsCash then Json.True else Json.False)
        ("EnableReward",if p.EnableReward then Json.True else Json.False)
        ("EnableOTC",if p.EnableOTC then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("CurType",(p.CurType |> EnumToValue).ToString() |> Json.Num)
        ("Dec",p.Dec.ToString() |> Json.Num)
        ("AnchorRate",p.AnchorRate.ToString() |> Json.Num)
        ("Freezable",if p.Freezable then Json.True else Json.False)
        ("Authorizable",if p.Authorizable then Json.True else Json.False)
        ("ChaninID",p.ChaninID |> Json.Str)
        ("ChaninName",p.ChaninName |> Json.Str)
        ("ContractAddress",p.ContractAddress |> Json.Str)
        ("WalletAddress",p.WalletAddress |> Json.Str)
        ("BaseRate",p.BaseRate.ToString() |> Json.Num) |]
    |> Json.Braket

let CUR__json (v:CUR) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Hidden",if p.Hidden then Json.True else Json.False)
        ("IsSac",if p.IsSac then Json.True else Json.False)
        ("IsTransfer",if p.IsTransfer then Json.True else Json.False)
        ("IsCash",if p.IsCash then Json.True else Json.False)
        ("EnableReward",if p.EnableReward then Json.True else Json.False)
        ("EnableOTC",if p.EnableOTC then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("CurType",(p.CurType |> EnumToValue).ToString() |> Json.Num)
        ("Dec",p.Dec.ToString() |> Json.Num)
        ("AnchorRate",p.AnchorRate.ToString() |> Json.Num)
        ("Freezable",if p.Freezable then Json.True else Json.False)
        ("Authorizable",if p.Authorizable then Json.True else Json.False)
        ("ChaninID",p.ChaninID |> Json.Str)
        ("ChaninName",p.ChaninName |> Json.Str)
        ("ContractAddress",p.ContractAddress |> Json.Str)
        ("WalletAddress",p.WalletAddress |> Json.Str)
        ("BaseRate",p.BaseRate.ToString() |> Json.Num) |]
    |> Json.Braket

let CUR__jsonTbw (w:TextBlockWriter) (v:CUR) =
    json__str w (CUR__json v)

let CUR__jsonStr (v:CUR) =
    (CUR__json v) |> json__strFinal


let json__pCURo (json:Json):pCUR option =
    let fields = json |> json__items

    let p = pCUR_empty()
    
    p.Code <- checkfieldz fields "Code" 16
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Hidden <- checkfield fields "Hidden" = "true"
    
    p.IsSac <- checkfield fields "IsSac" = "true"
    
    p.IsTransfer <- checkfield fields "IsTransfer" = "true"
    
    p.IsCash <- checkfield fields "IsCash" = "true"
    
    p.EnableReward <- checkfield fields "EnableReward" = "true"
    
    p.EnableOTC <- checkfield fields "EnableOTC" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 512
    
    p.CurType <- checkfield fields "CurType" |> parse_int32 |> EnumOfValue
    
    p.Dec <- checkfield fields "Dec" |> parse_int64
    
    p.AnchorRate <- checkfield fields "AnchorRate" |> parse_float
    
    p.Freezable <- checkfield fields "Freezable" = "true"
    
    p.Authorizable <- checkfield fields "Authorizable" = "true"
    
    p.ChaninID <- checkfieldz fields "ChaninID" 256
    
    p.ChaninName <- checkfieldz fields "ChaninName" 256
    
    p.ContractAddress <- checkfieldz fields "ContractAddress" 256
    
    p.WalletAddress <- checkfieldz fields "WalletAddress" 256
    
    p.BaseRate <- checkfield fields "BaseRate" |> parse_float
    
    p |> Some
    

let json__CURo (json:Json):CUR option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCUR_empty()
    
    p.Code <- checkfieldz fields "Code" 16
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Hidden <- checkfield fields "Hidden" = "true"
    
    p.IsSac <- checkfield fields "IsSac" = "true"
    
    p.IsTransfer <- checkfield fields "IsTransfer" = "true"
    
    p.IsCash <- checkfield fields "IsCash" = "true"
    
    p.EnableReward <- checkfield fields "EnableReward" = "true"
    
    p.EnableOTC <- checkfield fields "EnableOTC" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 512
    
    p.CurType <- checkfield fields "CurType" |> parse_int32 |> EnumOfValue
    
    p.Dec <- checkfield fields "Dec" |> parse_int64
    
    p.AnchorRate <- checkfield fields "AnchorRate" |> parse_float
    
    p.Freezable <- checkfield fields "Freezable" = "true"
    
    p.Authorizable <- checkfield fields "Authorizable" = "true"
    
    p.ChaninID <- checkfieldz fields "ChaninID" 256
    
    p.ChaninName <- checkfieldz fields "ChaninName" 256
    
    p.ContractAddress <- checkfieldz fields "ContractAddress" 256
    
    p.WalletAddress <- checkfieldz fields "WalletAddress" 256
    
    p.BaseRate <- checkfield fields "BaseRate" |> parse_float
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [EU] Structure

let pEU__bin (bb:BytesBuilder) (p:pEU) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binUsername = p.Username |> Encoding.UTF8.GetBytes
    binUsername.Length |> BitConverter.GetBytes |> bb.append
    binUsername |> bb.append
    
    let binPenname = p.Penname |> Encoding.UTF8.GetBytes
    binPenname.Length |> BitConverter.GetBytes |> bb.append
    binPenname |> bb.append
    
    let binRolfname = p.Rolfname |> Encoding.UTF8.GetBytes
    binRolfname.Length |> BitConverter.GetBytes |> bb.append
    binRolfname |> bb.append
    
    let binEmail = p.Email |> Encoding.UTF8.GetBytes
    binEmail.Length |> BitConverter.GetBytes |> bb.append
    binEmail |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append
    
    p.Domainname |> BitConverter.GetBytes |> bb.append
    
    p.Gender |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Status |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Admin |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Privilege |> BitConverter.GetBytes |> bb.append
    
    p.Verify |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binPwd = p.Pwd |> Encoding.UTF8.GetBytes
    binPwd.Length |> BitConverter.GetBytes |> bb.append
    binPwd |> bb.append
    
    p.Online |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    let binBackground = p.Background |> Encoding.UTF8.GetBytes
    binBackground.Length |> BitConverter.GetBytes |> bb.append
    binBackground |> bb.append
    
    p.BasicAcct |> BitConverter.GetBytes |> bb.append
    
    p.Citizen |> BitConverter.GetBytes |> bb.append
    
    let binRefer = p.Refer |> Encoding.UTF8.GetBytes
    binRefer.Length |> BitConverter.GetBytes |> bb.append
    binRefer |> bb.append
    
    p.Referer |> BitConverter.GetBytes |> bb.append
    
    let binDiscord = p.Discord |> Encoding.UTF8.GetBytes
    binDiscord.Length |> BitConverter.GetBytes |> bb.append
    binDiscord |> bb.append
    
    p.DiscordId |> BitConverter.GetBytes |> bb.append
    
    let binGoogle = p.Google |> Encoding.UTF8.GetBytes
    binGoogle.Length |> BitConverter.GetBytes |> bb.append
    binGoogle |> bb.append
    
    p.GoogleId |> BitConverter.GetBytes |> bb.append
    
    let binApple = p.Apple |> Encoding.UTF8.GetBytes
    binApple.Length |> BitConverter.GetBytes |> bb.append
    binApple |> bb.append
    
    p.AppleId |> BitConverter.GetBytes |> bb.append
    
    let binOAuthProvider = p.OAuthProvider |> Encoding.UTF8.GetBytes
    binOAuthProvider.Length |> BitConverter.GetBytes |> bb.append
    binOAuthProvider |> bb.append
    
    let binOAuthID = p.OAuthID |> Encoding.UTF8.GetBytes
    binOAuthID.Length |> BitConverter.GetBytes |> bb.append
    binOAuthID |> bb.append
    
    let binGTV = p.GTV |> Encoding.UTF8.GetBytes
    binGTV.Length |> BitConverter.GetBytes |> bb.append
    binGTV |> bb.append
    
    let binGettr = p.Gettr |> Encoding.UTF8.GetBytes
    binGettr.Length |> BitConverter.GetBytes |> bb.append
    binGettr |> bb.append
    
    p.Farm |> BitConverter.GetBytes |> bb.append
    
    p.CountFollows |> BitConverter.GetBytes |> bb.append
    
    p.CountFollowers |> BitConverter.GetBytes |> bb.append
    
    p.CountMoments |> BitConverter.GetBytes |> bb.append
    
    p.CountViews |> BitConverter.GetBytes |> bb.append
    
    p.CountComments |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbUps |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbDns |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    p.BizOperator |> BitConverter.GetBytes |> bb.append
    
    let binUrl = p.Url |> Encoding.UTF8.GetBytes
    binUrl.Length |> BitConverter.GetBytes |> bb.append
    binUrl |> bb.append
    
    let binAbout = p.About |> Encoding.UTF8.GetBytes
    binAbout.Length |> BitConverter.GetBytes |> bb.append
    binAbout |> bb.append
    
    p.PublicPoints |> BitConverter.GetBytes |> bb.append
    
    let binJson = p.Json |> Encoding.UTF8.GetBytes
    binJson.Length |> BitConverter.GetBytes |> bb.append
    binJson |> bb.append
    
    p.Agentable |> EnumToValue |> BitConverter.GetBytes |> bb.append

let EU__bin (bb:BytesBuilder) (v:EU) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pEU__bin bb v.p

let bin__pEU (bi:BinIndexed):pEU =
    let bin,index = bi

    let p = pEU_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Username = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Username <- Encoding.UTF8.GetString(bin,index.Value,count_Username)
    index.Value <- index.Value + count_Username
    
    let count_Penname = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Penname <- Encoding.UTF8.GetString(bin,index.Value,count_Penname)
    index.Value <- index.Value + count_Penname
    
    let count_Rolfname = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Rolfname <- Encoding.UTF8.GetString(bin,index.Value,count_Rolfname)
    index.Value <- index.Value + count_Rolfname
    
    let count_Email = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Email <- Encoding.UTF8.GetString(bin,index.Value,count_Email)
    index.Value <- index.Value + count_Email
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    p.Domainname <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Gender <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Status <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Admin <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Privilege <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Verify <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Pwd = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Pwd <- Encoding.UTF8.GetString(bin,index.Value,count_Pwd)
    index.Value <- index.Value + count_Pwd
    
    p.Online <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    let count_Background = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Background <- Encoding.UTF8.GetString(bin,index.Value,count_Background)
    index.Value <- index.Value + count_Background
    
    p.BasicAcct <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Citizen <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Refer = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Refer <- Encoding.UTF8.GetString(bin,index.Value,count_Refer)
    index.Value <- index.Value + count_Refer
    
    p.Referer <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Discord = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Discord <- Encoding.UTF8.GetString(bin,index.Value,count_Discord)
    index.Value <- index.Value + count_Discord
    
    p.DiscordId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Google = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Google <- Encoding.UTF8.GetString(bin,index.Value,count_Google)
    index.Value <- index.Value + count_Google
    
    p.GoogleId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Apple = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Apple <- Encoding.UTF8.GetString(bin,index.Value,count_Apple)
    index.Value <- index.Value + count_Apple
    
    p.AppleId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_OAuthProvider = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OAuthProvider <- Encoding.UTF8.GetString(bin,index.Value,count_OAuthProvider)
    index.Value <- index.Value + count_OAuthProvider
    
    let count_OAuthID = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OAuthID <- Encoding.UTF8.GetString(bin,index.Value,count_OAuthID)
    index.Value <- index.Value + count_OAuthID
    
    let count_GTV = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.GTV <- Encoding.UTF8.GetString(bin,index.Value,count_GTV)
    index.Value <- index.Value + count_GTV
    
    let count_Gettr = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Gettr <- Encoding.UTF8.GetString(bin,index.Value,count_Gettr)
    index.Value <- index.Value + count_Gettr
    
    p.Farm <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollows <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollowers <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountMoments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountViews <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountComments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbUps <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbDns <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BizOperator <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Url = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Url <- Encoding.UTF8.GetString(bin,index.Value,count_Url)
    index.Value <- index.Value + count_Url
    
    let count_About = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.About <- Encoding.UTF8.GetString(bin,index.Value,count_About)
    index.Value <- index.Value + count_About
    
    p.PublicPoints <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Json = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Json <- Encoding.UTF8.GetString(bin,index.Value,count_Json)
    index.Value <- index.Value + count_Json
    
    p.Agentable <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__EU (bi:BinIndexed):EU =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pEU bi }

let pEU__json (p:pEU) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Username",p.Username |> Json.Str)
        ("Penname",p.Penname |> Json.Str)
        ("Rolfname",p.Rolfname |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Domainname",p.Domainname.ToString() |> Json.Num)
        ("Gender",(p.Gender |> EnumToValue).ToString() |> Json.Num)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("Admin",(p.Admin |> EnumToValue).ToString() |> Json.Num)
        ("Privilege",p.Privilege.ToString() |> Json.Num)
        ("Verify",(p.Verify |> EnumToValue).ToString() |> Json.Num)
        ("Pwd",p.Pwd |> Json.Str)
        ("Online",if p.Online then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("Background",p.Background |> Json.Str)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Citizen",p.Citizen.ToString() |> Json.Num)
        ("Refer",p.Refer |> Json.Str)
        ("Referer",p.Referer.ToString() |> Json.Num)
        ("Discord",p.Discord |> Json.Str)
        ("DiscordId",p.DiscordId.ToString() |> Json.Num)
        ("Google",p.Google |> Json.Str)
        ("GoogleId",p.GoogleId.ToString() |> Json.Num)
        ("Apple",p.Apple |> Json.Str)
        ("AppleId",p.AppleId.ToString() |> Json.Num)
        ("OAuthProvider",p.OAuthProvider |> Json.Str)
        ("OAuthID",p.OAuthID |> Json.Str)
        ("GTV",p.GTV |> Json.Str)
        ("Gettr",p.Gettr |> Json.Str)
        ("Farm",p.Farm.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("BizOperator",p.BizOperator.ToString() |> Json.Num)
        ("Url",p.Url |> Json.Str)
        ("About",p.About |> Json.Str)
        ("PublicPoints",p.PublicPoints.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str)
        ("Agentable",(p.Agentable |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let EU__json (v:EU) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Username",p.Username |> Json.Str)
        ("Penname",p.Penname |> Json.Str)
        ("Rolfname",p.Rolfname |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Domainname",p.Domainname.ToString() |> Json.Num)
        ("Gender",(p.Gender |> EnumToValue).ToString() |> Json.Num)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("Admin",(p.Admin |> EnumToValue).ToString() |> Json.Num)
        ("Privilege",p.Privilege.ToString() |> Json.Num)
        ("Verify",(p.Verify |> EnumToValue).ToString() |> Json.Num)
        ("Pwd",p.Pwd |> Json.Str)
        ("Online",if p.Online then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("Background",p.Background |> Json.Str)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Citizen",p.Citizen.ToString() |> Json.Num)
        ("Refer",p.Refer |> Json.Str)
        ("Referer",p.Referer.ToString() |> Json.Num)
        ("Discord",p.Discord |> Json.Str)
        ("DiscordId",p.DiscordId.ToString() |> Json.Num)
        ("Google",p.Google |> Json.Str)
        ("GoogleId",p.GoogleId.ToString() |> Json.Num)
        ("Apple",p.Apple |> Json.Str)
        ("AppleId",p.AppleId.ToString() |> Json.Num)
        ("OAuthProvider",p.OAuthProvider |> Json.Str)
        ("OAuthID",p.OAuthID |> Json.Str)
        ("GTV",p.GTV |> Json.Str)
        ("Gettr",p.Gettr |> Json.Str)
        ("Farm",p.Farm.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("BizOperator",p.BizOperator.ToString() |> Json.Num)
        ("Url",p.Url |> Json.Str)
        ("About",p.About |> Json.Str)
        ("PublicPoints",p.PublicPoints.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str)
        ("Agentable",(p.Agentable |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let EU__jsonTbw (w:TextBlockWriter) (v:EU) =
    json__str w (EU__json v)

let EU__jsonStr (v:EU) =
    (EU__json v) |> json__strFinal


let json__pEUo (json:Json):pEU option =
    let fields = json |> json__items

    let p = pEU_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Username <- checkfieldz fields "Username" 64
    
    p.Penname <- checkfieldz fields "Penname" 64
    
    p.Rolfname <- checkfieldz fields "Rolfname" 64
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Tel <- checkfieldz fields "Tel" 32
    
    p.Domainname <- checkfield fields "Domainname" |> parse_int64
    
    p.Gender <- checkfield fields "Gender" |> parse_int32 |> EnumOfValue
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.Admin <- checkfield fields "Admin" |> parse_int32 |> EnumOfValue
    
    p.Privilege <- checkfield fields "Privilege" |> parse_int64
    
    p.Verify <- checkfield fields "Verify" |> parse_int32 |> EnumOfValue
    
    p.Pwd <- checkfieldz fields "Pwd" 16
    
    p.Online <- checkfield fields "Online" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Background <- checkfieldz fields "Background" 256
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Citizen <- checkfield fields "Citizen" |> parse_int64
    
    p.Refer <- checkfieldz fields "Refer" 7
    
    p.Referer <- checkfield fields "Referer" |> parse_int64
    
    p.Discord <- checkfieldz fields "Discord" 64
    
    p.DiscordId <- checkfield fields "DiscordId" |> parse_int64
    
    p.Google <- checkfieldz fields "Google" 64
    
    p.GoogleId <- checkfield fields "GoogleId" |> parse_int64
    
    p.Apple <- checkfieldz fields "Apple" 64
    
    p.AppleId <- checkfield fields "AppleId" |> parse_int64
    
    p.OAuthProvider <- checkfieldz fields "OAuthProvider" 64
    
    p.OAuthID <- checkfieldz fields "OAuthID" 256
    
    p.GTV <- checkfieldz fields "GTV" 64
    
    p.Gettr <- checkfieldz fields "Gettr" 64
    
    p.Farm <- checkfield fields "Farm" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.BizOperator <- checkfield fields "BizOperator" |> parse_int64
    
    p.Url <- checkfield fields "Url"
    
    p.About <- checkfield fields "About"
    
    p.PublicPoints <- checkfield fields "PublicPoints" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    p.Agentable <- checkfield fields "Agentable" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__EUo (json:Json):EU option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pEU_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Username <- checkfieldz fields "Username" 64
    
    p.Penname <- checkfieldz fields "Penname" 64
    
    p.Rolfname <- checkfieldz fields "Rolfname" 64
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Tel <- checkfieldz fields "Tel" 32
    
    p.Domainname <- checkfield fields "Domainname" |> parse_int64
    
    p.Gender <- checkfield fields "Gender" |> parse_int32 |> EnumOfValue
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.Admin <- checkfield fields "Admin" |> parse_int32 |> EnumOfValue
    
    p.Privilege <- checkfield fields "Privilege" |> parse_int64
    
    p.Verify <- checkfield fields "Verify" |> parse_int32 |> EnumOfValue
    
    p.Pwd <- checkfieldz fields "Pwd" 16
    
    p.Online <- checkfield fields "Online" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Background <- checkfieldz fields "Background" 256
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Citizen <- checkfield fields "Citizen" |> parse_int64
    
    p.Refer <- checkfieldz fields "Refer" 7
    
    p.Referer <- checkfield fields "Referer" |> parse_int64
    
    p.Discord <- checkfieldz fields "Discord" 64
    
    p.DiscordId <- checkfield fields "DiscordId" |> parse_int64
    
    p.Google <- checkfieldz fields "Google" 64
    
    p.GoogleId <- checkfield fields "GoogleId" |> parse_int64
    
    p.Apple <- checkfieldz fields "Apple" 64
    
    p.AppleId <- checkfield fields "AppleId" |> parse_int64
    
    p.OAuthProvider <- checkfieldz fields "OAuthProvider" 64
    
    p.OAuthID <- checkfieldz fields "OAuthID" 256
    
    p.GTV <- checkfieldz fields "GTV" 64
    
    p.Gettr <- checkfieldz fields "Gettr" 64
    
    p.Farm <- checkfield fields "Farm" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.BizOperator <- checkfield fields "BizOperator" |> parse_int64
    
    p.Url <- checkfield fields "Url"
    
    p.About <- checkfield fields "About"
    
    p.PublicPoints <- checkfield fields "PublicPoints" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    p.Agentable <- checkfield fields "Agentable" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [FILE] Structure

let pFILE__bin (bb:BytesBuilder) (p:pFILE) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binIpfs = p.Ipfs |> Encoding.UTF8.GetBytes
    binIpfs.Length |> BitConverter.GetBytes |> bb.append
    binIpfs |> bb.append
    
    p.Encrypt |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binSHA256 = p.SHA256 |> Encoding.UTF8.GetBytes
    binSHA256.Length |> BitConverter.GetBytes |> bb.append
    binSHA256 |> bb.append
    
    p.Size |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.State |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Folder |> BitConverter.GetBytes |> bb.append
    
    p.FileType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binJSON = p.JSON |> Encoding.UTF8.GetBytes
    binJSON.Length |> BitConverter.GetBytes |> bb.append
    binJSON |> bb.append

let FILE__bin (bb:BytesBuilder) (v:FILE) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pFILE__bin bb v.p

let bin__pFILE (bi:BinIndexed):pFILE =
    let bin,index = bi

    let p = pFILE_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Ipfs = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Ipfs <- Encoding.UTF8.GetString(bin,index.Value,count_Ipfs)
    index.Value <- index.Value + count_Ipfs
    
    p.Encrypt <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_SHA256 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.SHA256 <- Encoding.UTF8.GetString(bin,index.Value,count_SHA256)
    index.Value <- index.Value + count_SHA256
    
    p.Size <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.State <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Folder <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.FileType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_JSON = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.JSON <- Encoding.UTF8.GetString(bin,index.Value,count_JSON)
    index.Value <- index.Value + count_JSON
    
    p

let bin__FILE (bi:BinIndexed):FILE =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pFILE bi }

let pFILE__json (p:pFILE) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Ipfs",p.Ipfs |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("SHA256",p.SHA256 |> Json.Str)
        ("Size",p.Size.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("Folder",p.Folder.ToString() |> Json.Num)
        ("FileType",(p.FileType |> EnumToValue).ToString() |> Json.Num)
        ("JSON",p.JSON |> Json.Str) |]
    |> Json.Braket

let FILE__json (v:FILE) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Ipfs",p.Ipfs |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("SHA256",p.SHA256 |> Json.Str)
        ("Size",p.Size.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("Folder",p.Folder.ToString() |> Json.Num)
        ("FileType",(p.FileType |> EnumToValue).ToString() |> Json.Num)
        ("JSON",p.JSON |> Json.Str) |]
    |> Json.Braket

let FILE__jsonTbw (w:TextBlockWriter) (v:FILE) =
    json__str w (FILE__json v)

let FILE__jsonStr (v:FILE) =
    (FILE__json v) |> json__strFinal


let json__pFILEo (json:Json):pFILE option =
    let fields = json |> json__items

    let p = pFILE_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Ipfs <- checkfield fields "Ipfs"
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.SHA256 <- checkfield fields "SHA256"
    
    p.Size <- checkfield fields "Size" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.Folder <- checkfield fields "Folder" |> parse_int64
    
    p.FileType <- checkfield fields "FileType" |> parse_int32 |> EnumOfValue
    
    p.JSON <- checkfield fields "JSON"
    
    p |> Some
    

let json__FILEo (json:Json):FILE option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pFILE_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Ipfs <- checkfield fields "Ipfs"
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.SHA256 <- checkfield fields "SHA256"
    
    p.Size <- checkfield fields "Size" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.Folder <- checkfield fields "Folder" |> parse_int64
    
    p.FileType <- checkfield fields "FileType" |> parse_int32 |> EnumOfValue
    
    p.JSON <- checkfield fields "JSON"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [FOLDER] Structure

let pFOLDER__bin (bb:BytesBuilder) (p:pFOLDER) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Encrypt |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Parent |> BitConverter.GetBytes |> bb.append

let FOLDER__bin (bb:BytesBuilder) (v:FOLDER) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pFOLDER__bin bb v.p

let bin__pFOLDER (bi:BinIndexed):pFOLDER =
    let bin,index = bi

    let p = pFOLDER_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Encrypt <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Parent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__FOLDER (bi:BinIndexed):FOLDER =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pFOLDER bi }

let pFOLDER__json (p:pFOLDER) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Parent",p.Parent.ToString() |> Json.Num) |]
    |> Json.Braket

let FOLDER__json (v:FOLDER) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Parent",p.Parent.ToString() |> Json.Num) |]
    |> Json.Braket

let FOLDER__jsonTbw (w:TextBlockWriter) (v:FOLDER) =
    json__str w (FOLDER__json v)

let FOLDER__jsonStr (v:FOLDER) =
    (FOLDER__json v) |> json__strFinal


let json__pFOLDERo (json:Json):pFOLDER option =
    let fields = json |> json__items

    let p = pFOLDER_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p |> Some
    

let json__FOLDERo (json:Json):FOLDER option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pFOLDER_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [LANG] Structure

let pLANG__bin (bb:BytesBuilder) (p:pLANG) =

    
    let binCode2 = p.Code2 |> Encoding.UTF8.GetBytes
    binCode2.Length |> BitConverter.GetBytes |> bb.append
    binCode2 |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binNative = p.Native |> Encoding.UTF8.GetBytes
    binNative.Length |> BitConverter.GetBytes |> bb.append
    binNative |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.IsBlank |> BitConverter.GetBytes |> bb.append
    
    p.IsLocale |> BitConverter.GetBytes |> bb.append
    
    p.IsContent |> BitConverter.GetBytes |> bb.append
    
    p.IsAutoTranslate |> BitConverter.GetBytes |> bb.append
    
    p.IsMiles |> BitConverter.GetBytes |> bb.append
    
    p.TextDirection |> EnumToValue |> BitConverter.GetBytes |> bb.append

let LANG__bin (bb:BytesBuilder) (v:LANG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pLANG__bin bb v.p

let bin__pLANG (bi:BinIndexed):pLANG =
    let bin,index = bi

    let p = pLANG_empty()
    
    let count_Code2 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code2 <- Encoding.UTF8.GetString(bin,index.Value,count_Code2)
    index.Value <- index.Value + count_Code2
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Native = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Native <- Encoding.UTF8.GetString(bin,index.Value,count_Native)
    index.Value <- index.Value + count_Native
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.IsBlank <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsLocale <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsContent <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsAutoTranslate <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsMiles <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.TextDirection <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__LANG (bi:BinIndexed):LANG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pLANG bi }

let pLANG__json (p:pLANG) =

    [|
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Native",p.Native |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("IsBlank",if p.IsBlank then Json.True else Json.False)
        ("IsLocale",if p.IsLocale then Json.True else Json.False)
        ("IsContent",if p.IsContent then Json.True else Json.False)
        ("IsAutoTranslate",if p.IsAutoTranslate then Json.True else Json.False)
        ("IsMiles",if p.IsMiles then Json.True else Json.False)
        ("TextDirection",(p.TextDirection |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let LANG__json (v:LANG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Native",p.Native |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("IsBlank",if p.IsBlank then Json.True else Json.False)
        ("IsLocale",if p.IsLocale then Json.True else Json.False)
        ("IsContent",if p.IsContent then Json.True else Json.False)
        ("IsAutoTranslate",if p.IsAutoTranslate then Json.True else Json.False)
        ("IsMiles",if p.IsMiles then Json.True else Json.False)
        ("TextDirection",(p.TextDirection |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let LANG__jsonTbw (w:TextBlockWriter) (v:LANG) =
    json__str w (LANG__json v)

let LANG__jsonStr (v:LANG) =
    (LANG__json v) |> json__strFinal


let json__pLANGo (json:Json):pLANG option =
    let fields = json |> json__items

    let p = pLANG_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Native <- checkfieldz fields "Native" 64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.IsBlank <- checkfield fields "IsBlank" = "true"
    
    p.IsLocale <- checkfield fields "IsLocale" = "true"
    
    p.IsContent <- checkfield fields "IsContent" = "true"
    
    p.IsAutoTranslate <- checkfield fields "IsAutoTranslate" = "true"
    
    p.IsMiles <- checkfield fields "IsMiles" = "true"
    
    p.TextDirection <- checkfield fields "TextDirection" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__LANGo (json:Json):LANG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pLANG_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Native <- checkfieldz fields "Native" 64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.IsBlank <- checkfield fields "IsBlank" = "true"
    
    p.IsLocale <- checkfield fields "IsLocale" = "true"
    
    p.IsContent <- checkfield fields "IsContent" = "true"
    
    p.IsAutoTranslate <- checkfield fields "IsAutoTranslate" = "true"
    
    p.IsMiles <- checkfield fields "IsMiles" = "true"
    
    p.TextDirection <- checkfield fields "TextDirection" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [LOCALE] Structure

let pLOCALE__bin (bb:BytesBuilder) (p:pLOCALE) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    let binZh = p.Zh |> Encoding.UTF8.GetBytes
    binZh.Length |> BitConverter.GetBytes |> bb.append
    binZh |> bb.append
    
    let binText = p.Text |> Encoding.UTF8.GetBytes
    binText.Length |> BitConverter.GetBytes |> bb.append
    binText |> bb.append

let LOCALE__bin (bb:BytesBuilder) (v:LOCALE) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pLOCALE__bin bb v.p

let bin__pLOCALE (bi:BinIndexed):pLOCALE =
    let bin,index = bi

    let p = pLOCALE_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Zh = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Zh <- Encoding.UTF8.GetString(bin,index.Value,count_Zh)
    index.Value <- index.Value + count_Zh
    
    let count_Text = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Text <- Encoding.UTF8.GetString(bin,index.Value,count_Text)
    index.Value <- index.Value + count_Text
    
    p

let bin__LOCALE (bi:BinIndexed):LOCALE =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pLOCALE bi }

let pLOCALE__json (p:pLOCALE) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Zh",p.Zh |> Json.Str)
        ("Text",p.Text |> Json.Str) |]
    |> Json.Braket

let LOCALE__json (v:LOCALE) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Zh",p.Zh |> Json.Str)
        ("Text",p.Text |> Json.Str) |]
    |> Json.Braket

let LOCALE__jsonTbw (w:TextBlockWriter) (v:LOCALE) =
    json__str w (LOCALE__json v)

let LOCALE__jsonStr (v:LOCALE) =
    (LOCALE__json v) |> json__strFinal


let json__pLOCALEo (json:Json):pLOCALE option =
    let fields = json |> json__items

    let p = pLOCALE_empty()
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Zh <- checkfield fields "Zh"
    
    p.Text <- checkfield fields "Text"
    
    p |> Some
    

let json__LOCALEo (json:Json):LOCALE option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pLOCALE_empty()
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Zh <- checkfield fields "Zh"
    
    p.Text <- checkfield fields "Text"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CSI] Structure

let pCSI__bin (bb:BytesBuilder) (p:pCSI) =

    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append

let CSI__bin (bb:BytesBuilder) (v:CSI) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCSI__bin bb v.p

let bin__pCSI (bi:BinIndexed):pCSI =
    let bin,index = bi

    let p = pCSI_empty()
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__CSI (bi:BinIndexed):CSI =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCSI bi }

let pCSI__json (p:pCSI) =

    [|
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num) |]
    |> Json.Braket

let CSI__json (v:CSI) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num) |]
    |> Json.Braket

let CSI__jsonTbw (w:TextBlockWriter) (v:CSI) =
    json__str w (CSI__json v)

let CSI__jsonStr (v:CSI) =
    (CSI__json v) |> json__strFinal


let json__pCSIo (json:Json):pCSI option =
    let fields = json |> json__items

    let p = pCSI_empty()
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p |> Some
    

let json__CSIo (json:Json):CSI option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCSI_empty()
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CWC] Structure

let pCWC__bin (bb:BytesBuilder) (p:pCWC) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.ExternalId |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.EU |> BitConverter.GetBytes |> bb.append
    
    p.Biz |> BitConverter.GetBytes |> bb.append
    
    let binJson = p.Json |> Encoding.UTF8.GetBytes
    binJson.Length |> BitConverter.GetBytes |> bb.append
    binJson |> bb.append

let CWC__bin (bb:BytesBuilder) (v:CWC) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCWC__bin bb v.p

let bin__pCWC (bi:BinIndexed):pCWC =
    let bin,index = bi

    let p = pCWC_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.ExternalId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.EU <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Biz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Json = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Json <- Encoding.UTF8.GetString(bin,index.Value,count_Json)
    index.Value <- index.Value + count_Json
    
    p

let bin__CWC (bi:BinIndexed):CWC =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCWC bi }

let pCWC__json (p:pCWC) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("ExternalId",p.ExternalId.ToString() |> Json.Num)
        ("Icon",p.Icon |> Json.Str)
        ("EU",p.EU.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str) |]
    |> Json.Braket

let CWC__json (v:CWC) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("ExternalId",p.ExternalId.ToString() |> Json.Num)
        ("Icon",p.Icon |> Json.Str)
        ("EU",p.EU.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str) |]
    |> Json.Braket

let CWC__jsonTbw (w:TextBlockWriter) (v:CWC) =
    json__str w (CWC__json v)

let CWC__jsonStr (v:CWC) =
    (CWC__json v) |> json__strFinal


let json__pCWCo (json:Json):pCWC option =
    let fields = json |> json__items

    let p = pCWC_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.ExternalId <- checkfield fields "ExternalId" |> parse_int64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    p |> Some
    

let json__CWCo (json:Json):CWC option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCWC_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.ExternalId <- checkfield fields "ExternalId" |> parse_int64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [INS] Structure

let pINS__bin (bb:BytesBuilder) (p:pINS) =

    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    p.Hidden |> BitConverter.GetBytes |> bb.append
    
    p.EnableQuote |> BitConverter.GetBytes |> bb.append
    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Long |> BitConverter.GetBytes |> bb.append
    
    let binAssetName = p.AssetName |> Encoding.UTF8.GetBytes
    binAssetName.Length |> BitConverter.GetBytes |> bb.append
    binAssetName |> bb.append
    
    p.Short |> BitConverter.GetBytes |> bb.append
    
    p.Convertor |> BitConverter.GetBytes |> bb.append
    
    p.m |> BitConverter.GetBytes |> bb.append
    
    p.mu |> BitConverter.GetBytes |> bb.append
    
    p.eta |> BitConverter.GetBytes |> bb.append
    
    p.psi |> BitConverter.GetBytes |> bb.append
    
    p.MarginCalc |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.MarginRateInit |> BitConverter.GetBytes |> bb.append
    
    p.MarginRateMntn |> BitConverter.GetBytes |> bb.append
    
    p.MarginMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Dec |> BitConverter.GetBytes |> bb.append
    
    let binFormatter = p.Formatter |> Encoding.UTF8.GetBytes
    binFormatter.Length |> BitConverter.GetBytes |> bb.append
    binFormatter |> bb.append
    
    let binPath = p.Path |> Encoding.UTF8.GetBytes
    binPath.Length |> BitConverter.GetBytes |> bb.append
    binPath |> bb.append
    
    p.Ask |> BitConverter.GetBytes |> bb.append
    
    p.Bid |> BitConverter.GetBytes |> bb.append
    
    p.Middle |> BitConverter.GetBytes |> bb.append
    
    p.FixedSpread |> BitConverter.GetBytes |> bb.append
    
    p.PercentageSpread |> BitConverter.GetBytes |> bb.append
    
    p.TaxOpenMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.TaxOpen |> BitConverter.GetBytes |> bb.append
    
    p.TaxCloseMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.TaxClose |> BitConverter.GetBytes |> bb.append
    
    p.Tax |> BitConverter.GetBytes |> bb.append
    
    p.TaxCur |> BitConverter.GetBytes |> bb.append
    
    let binTaxCurCode = p.TaxCurCode |> Encoding.UTF8.GetBytes
    binTaxCurCode.Length |> BitConverter.GetBytes |> bb.append
    binTaxCurCode |> bb.append
    
    p.LastPrice |> BitConverter.GetBytes |> bb.append
    
    p.LastUpdatedat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.LastPriceChange.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.TradeStatus |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.RoMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binSchedule = p.Schedule |> Encoding.UTF8.GetBytes
    binSchedule.Length |> BitConverter.GetBytes |> bb.append
    binSchedule |> bb.append
    
    p.TradeMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.DerivativeMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.OptionsMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.OptionsCP |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.OptionsExpiry.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.OptionsStrike |> BitConverter.GetBytes |> bb.append
    
    let binOptionsPricing = p.OptionsPricing |> Encoding.UTF8.GetBytes
    binOptionsPricing.Length |> BitConverter.GetBytes |> bb.append
    binOptionsPricing |> bb.append
    
    let binOptionsPeriod = p.OptionsPeriod |> Encoding.UTF8.GetBytes
    binOptionsPeriod.Length |> BitConverter.GetBytes |> bb.append
    binOptionsPeriod |> bb.append
    
    p.OptionsTax |> BitConverter.GetBytes |> bb.append
    
    p.OptionsPremiumPerTradeMin |> BitConverter.GetBytes |> bb.append
    
    p.OptionsPremiumPerTradeMax |> BitConverter.GetBytes |> bb.append
    
    p.LimitLotPerTrade |> BitConverter.GetBytes |> bb.append
    
    p.LimitLotPosition |> BitConverter.GetBytes |> bb.append
    
    p.CurrentOpen |> BitConverter.GetBytes |> bb.append
    
    p.CurrentHigh |> BitConverter.GetBytes |> bb.append
    
    p.CurrentLow |> BitConverter.GetBytes |> bb.append
    
    p.PrevClose |> BitConverter.GetBytes |> bb.append
    
    p.PrevClosedat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.CurrentOpenat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.ExtBiz |> BitConverter.GetBytes |> bb.append
    
    let binRefExternal = p.RefExternal |> Encoding.UTF8.GetBytes
    binRefExternal.Length |> BitConverter.GetBytes |> bb.append
    binRefExternal |> bb.append
    
    let binItrnInss = p.ItrnInss |> Encoding.UTF8.GetBytes
    binItrnInss.Length |> BitConverter.GetBytes |> bb.append
    binItrnInss |> bb.append
    
    p.ItrnInssMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.FlushType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.CurTrigger |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.RobotType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binExtLong = p.ExtLong |> Encoding.UTF8.GetBytes
    binExtLong.Length |> BitConverter.GetBytes |> bb.append
    binExtLong |> bb.append
    
    let binExtShort = p.ExtShort |> Encoding.UTF8.GetBytes
    binExtShort.Length |> BitConverter.GetBytes |> bb.append
    binExtShort |> bb.append
    
    p.ExtPrice |> BitConverter.GetBytes |> bb.append
    
    p.SaveM1 |> BitConverter.GetBytes |> bb.append
    
    p.HistSavedat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.SaveD1 |> BitConverter.GetBytes |> bb.append
    
    p.SlPips |> BitConverter.GetBytes |> bb.append
    
    p.TpPips |> BitConverter.GetBytes |> bb.append
    
    p.PendingLimitPips |> BitConverter.GetBytes |> bb.append
    
    p.PendingStopPips |> BitConverter.GetBytes |> bb.append
    
    p.LastDirection |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.LiqMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.LiqPeriodSince.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.LiqPeriodTill |> BitConverter.GetBytes |> bb.append
    
    p.LiqPeriod |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.LiqTime |> BitConverter.GetBytes |> bb.append
    
    p.ConvertRatio |> BitConverter.GetBytes |> bb.append
    
    p.RoBuyMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.RoBuy |> BitConverter.GetBytes |> bb.append
    
    p.RoSellMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.RoSell |> BitConverter.GetBytes |> bb.append
    
    p.PosLimitBuy |> BitConverter.GetBytes |> bb.append
    
    p.PosLimitSell |> BitConverter.GetBytes |> bb.append
    
    p.RoCur |> BitConverter.GetBytes |> bb.append
    
    let binRoCurCode = p.RoCurCode |> Encoding.UTF8.GetBytes
    binRoCurCode.Length |> BitConverter.GetBytes |> bb.append
    binRoCurCode |> bb.append
    
    p.AdjBias |> BitConverter.GetBytes |> bb.append
    
    p.TaxBuy |> BitConverter.GetBytes |> bb.append
    
    p.TaxSell |> BitConverter.GetBytes |> bb.append
    
    let binMisc = p.Misc |> Encoding.UTF8.GetBytes
    binMisc.Length |> BitConverter.GetBytes |> bb.append
    binMisc |> bb.append
    
    p.RefLastPriceChange.Ticks |> BitConverter.GetBytes |> bb.append
    
    let binHedgeExternal = p.HedgeExternal |> Encoding.UTF8.GetBytes
    binHedgeExternal.Length |> BitConverter.GetBytes |> bb.append
    binHedgeExternal |> bb.append
    
    p.OfferingPrice |> BitConverter.GetBytes |> bb.append
    
    p.IssuanceAmount |> BitConverter.GetBytes |> bb.append
    
    p.ListingStatus |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Turnover |> BitConverter.GetBytes |> bb.append
    
    p.PriceOpened |> BitConverter.GetBytes |> bb.append

let INS__bin (bb:BytesBuilder) (v:INS) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pINS__bin bb v.p

let bin__pINS (bi:BinIndexed):pINS =
    let bin,index = bi

    let p = pINS_empty()
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p.Hidden <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.EnableQuote <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Long <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_AssetName = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.AssetName <- Encoding.UTF8.GetString(bin,index.Value,count_AssetName)
    index.Value <- index.Value + count_AssetName
    
    p.Short <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Convertor <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.m <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.mu <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.eta <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.psi <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.MarginCalc <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.MarginRateInit <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.MarginRateMntn <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.MarginMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Dec <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Formatter = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Formatter <- Encoding.UTF8.GetString(bin,index.Value,count_Formatter)
    index.Value <- index.Value + count_Formatter
    
    let count_Path = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Path <- Encoding.UTF8.GetString(bin,index.Value,count_Path)
    index.Value <- index.Value + count_Path
    
    p.Ask <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bid <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Middle <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.FixedSpread <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PercentageSpread <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TaxOpenMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.TaxOpen <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TaxCloseMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.TaxClose <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Tax <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TaxCur <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_TaxCurCode = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.TaxCurCode <- Encoding.UTF8.GetString(bin,index.Value,count_TaxCurCode)
    index.Value <- index.Value + count_TaxCurCode
    
    p.LastPrice <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.LastUpdatedat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.LastPriceChange <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.TradeStatus <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.RoMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Schedule = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Schedule <- Encoding.UTF8.GetString(bin,index.Value,count_Schedule)
    index.Value <- index.Value + count_Schedule
    
    p.TradeMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.DerivativeMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.OptionsMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.OptionsCP <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.OptionsExpiry <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.OptionsStrike <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_OptionsPricing = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OptionsPricing <- Encoding.UTF8.GetString(bin,index.Value,count_OptionsPricing)
    index.Value <- index.Value + count_OptionsPricing
    
    let count_OptionsPeriod = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OptionsPeriod <- Encoding.UTF8.GetString(bin,index.Value,count_OptionsPeriod)
    index.Value <- index.Value + count_OptionsPeriod
    
    p.OptionsTax <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.OptionsPremiumPerTradeMin <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.OptionsPremiumPerTradeMax <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.LimitLotPerTrade <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.LimitLotPosition <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CurrentOpen <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CurrentHigh <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CurrentLow <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PrevClose <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PrevClosedat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.CurrentOpenat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.ExtBiz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_RefExternal = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RefExternal <- Encoding.UTF8.GetString(bin,index.Value,count_RefExternal)
    index.Value <- index.Value + count_RefExternal
    
    let count_ItrnInss = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ItrnInss <- Encoding.UTF8.GetString(bin,index.Value,count_ItrnInss)
    index.Value <- index.Value + count_ItrnInss
    
    p.ItrnInssMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.FlushType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.CurTrigger <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.RobotType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_ExtLong = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ExtLong <- Encoding.UTF8.GetString(bin,index.Value,count_ExtLong)
    index.Value <- index.Value + count_ExtLong
    
    let count_ExtShort = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ExtShort <- Encoding.UTF8.GetString(bin,index.Value,count_ExtShort)
    index.Value <- index.Value + count_ExtShort
    
    p.ExtPrice <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.SaveM1 <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.HistSavedat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.SaveD1 <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.SlPips <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TpPips <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PendingLimitPips <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PendingStopPips <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.LastDirection <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.LiqMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.LiqPeriodSince <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.LiqPeriodTill <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.LiqPeriod <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.LiqTime <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ConvertRatio <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.RoBuyMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.RoBuy <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.RoSellMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.RoSell <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PosLimitBuy <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PosLimitSell <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.RoCur <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_RoCurCode = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RoCurCode <- Encoding.UTF8.GetString(bin,index.Value,count_RoCurCode)
    index.Value <- index.Value + count_RoCurCode
    
    p.AdjBias <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TaxBuy <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TaxSell <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Misc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Misc <- Encoding.UTF8.GetString(bin,index.Value,count_Misc)
    index.Value <- index.Value + count_Misc
    
    p.RefLastPriceChange <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    let count_HedgeExternal = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.HedgeExternal <- Encoding.UTF8.GetString(bin,index.Value,count_HedgeExternal)
    index.Value <- index.Value + count_HedgeExternal
    
    p.OfferingPrice <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.IssuanceAmount <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ListingStatus <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Turnover <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PriceOpened <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__INS (bi:BinIndexed):INS =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pINS bi }

let pINS__json (p:pINS) =

    [|
        ("Desc",p.Desc |> Json.Str)
        ("Hidden",if p.Hidden then Json.True else Json.False)
        ("EnableQuote",if p.EnableQuote then Json.True else Json.False)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Long",p.Long.ToString() |> Json.Num)
        ("AssetName",p.AssetName |> Json.Str)
        ("Short",p.Short.ToString() |> Json.Num)
        ("Convertor",p.Convertor.ToString() |> Json.Num)
        ("m",p.m.ToString() |> Json.Num)
        ("mu",p.mu.ToString() |> Json.Num)
        ("eta",p.eta.ToString() |> Json.Num)
        ("psi",p.psi.ToString() |> Json.Num)
        ("MarginCalc",(p.MarginCalc |> EnumToValue).ToString() |> Json.Num)
        ("MarginRateInit",p.MarginRateInit.ToString() |> Json.Num)
        ("MarginRateMntn",p.MarginRateMntn.ToString() |> Json.Num)
        ("MarginMode",(p.MarginMode |> EnumToValue).ToString() |> Json.Num)
        ("Dec",p.Dec.ToString() |> Json.Num)
        ("Formatter",p.Formatter |> Json.Str)
        ("Path",p.Path |> Json.Str)
        ("Ask",p.Ask.ToString() |> Json.Num)
        ("Bid",p.Bid.ToString() |> Json.Num)
        ("Middle",p.Middle.ToString() |> Json.Num)
        ("FixedSpread",p.FixedSpread.ToString() |> Json.Num)
        ("PercentageSpread",p.PercentageSpread.ToString() |> Json.Num)
        ("TaxOpenMode",(p.TaxOpenMode |> EnumToValue).ToString() |> Json.Num)
        ("TaxOpen",p.TaxOpen.ToString() |> Json.Num)
        ("TaxCloseMode",(p.TaxCloseMode |> EnumToValue).ToString() |> Json.Num)
        ("TaxClose",p.TaxClose.ToString() |> Json.Num)
        ("Tax",p.Tax.ToString() |> Json.Num)
        ("TaxCur",p.TaxCur.ToString() |> Json.Num)
        ("TaxCurCode",p.TaxCurCode |> Json.Str)
        ("LastPrice",p.LastPrice.ToString() |> Json.Num)
        ("LastUpdatedat",(p.LastUpdatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("LastPriceChange",(p.LastPriceChange |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("TradeStatus",(p.TradeStatus |> EnumToValue).ToString() |> Json.Num)
        ("RoMode",(p.RoMode |> EnumToValue).ToString() |> Json.Num)
        ("Schedule",p.Schedule |> Json.Str)
        ("TradeMode",(p.TradeMode |> EnumToValue).ToString() |> Json.Num)
        ("DerivativeMode",(p.DerivativeMode |> EnumToValue).ToString() |> Json.Num)
        ("OptionsMode",(p.OptionsMode |> EnumToValue).ToString() |> Json.Num)
        ("OptionsCP",(p.OptionsCP |> EnumToValue).ToString() |> Json.Num)
        ("OptionsExpiry",(p.OptionsExpiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("OptionsStrike",p.OptionsStrike.ToString() |> Json.Num)
        ("OptionsPricing",p.OptionsPricing |> Json.Str)
        ("OptionsPeriod",p.OptionsPeriod |> Json.Str)
        ("OptionsTax",p.OptionsTax.ToString() |> Json.Num)
        ("OptionsPremiumPerTradeMin",p.OptionsPremiumPerTradeMin.ToString() |> Json.Num)
        ("OptionsPremiumPerTradeMax",p.OptionsPremiumPerTradeMax.ToString() |> Json.Num)
        ("LimitLotPerTrade",p.LimitLotPerTrade.ToString() |> Json.Num)
        ("LimitLotPosition",p.LimitLotPosition.ToString() |> Json.Num)
        ("CurrentOpen",p.CurrentOpen.ToString() |> Json.Num)
        ("CurrentHigh",p.CurrentHigh.ToString() |> Json.Num)
        ("CurrentLow",p.CurrentLow.ToString() |> Json.Num)
        ("PrevClose",p.PrevClose.ToString() |> Json.Num)
        ("PrevClosedat",(p.PrevClosedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("CurrentOpenat",(p.CurrentOpenat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("ExtBiz",p.ExtBiz.ToString() |> Json.Num)
        ("RefExternal",p.RefExternal |> Json.Str)
        ("ItrnInss",p.ItrnInss |> Json.Str)
        ("ItrnInssMode",(p.ItrnInssMode |> EnumToValue).ToString() |> Json.Num)
        ("FlushType",(p.FlushType |> EnumToValue).ToString() |> Json.Num)
        ("CurTrigger",(p.CurTrigger |> EnumToValue).ToString() |> Json.Num)
        ("RobotType",(p.RobotType |> EnumToValue).ToString() |> Json.Num)
        ("ExtLong",p.ExtLong |> Json.Str)
        ("ExtShort",p.ExtShort |> Json.Str)
        ("ExtPrice",p.ExtPrice.ToString() |> Json.Num)
        ("SaveM1",if p.SaveM1 then Json.True else Json.False)
        ("HistSavedat",(p.HistSavedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("SaveD1",if p.SaveD1 then Json.True else Json.False)
        ("SlPips",p.SlPips.ToString() |> Json.Num)
        ("TpPips",p.TpPips.ToString() |> Json.Num)
        ("PendingLimitPips",p.PendingLimitPips.ToString() |> Json.Num)
        ("PendingStopPips",p.PendingStopPips.ToString() |> Json.Num)
        ("LastDirection",(p.LastDirection |> EnumToValue).ToString() |> Json.Num)
        ("LiqMode",(p.LiqMode |> EnumToValue).ToString() |> Json.Num)
        ("LiqPeriodSince",(p.LiqPeriodSince |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("LiqPeriodTill",p.LiqPeriodTill.ToString() |> Json.Num)
        ("LiqPeriod",(p.LiqPeriod |> EnumToValue).ToString() |> Json.Num)
        ("LiqTime",p.LiqTime.ToString() |> Json.Num)
        ("ConvertRatio",p.ConvertRatio.ToString() |> Json.Num)
        ("RoBuyMode",(p.RoBuyMode |> EnumToValue).ToString() |> Json.Num)
        ("RoBuy",p.RoBuy.ToString() |> Json.Num)
        ("RoSellMode",(p.RoSellMode |> EnumToValue).ToString() |> Json.Num)
        ("RoSell",p.RoSell.ToString() |> Json.Num)
        ("PosLimitBuy",p.PosLimitBuy.ToString() |> Json.Num)
        ("PosLimitSell",p.PosLimitSell.ToString() |> Json.Num)
        ("RoCur",p.RoCur.ToString() |> Json.Num)
        ("RoCurCode",p.RoCurCode |> Json.Str)
        ("AdjBias",p.AdjBias.ToString() |> Json.Num)
        ("TaxBuy",p.TaxBuy.ToString() |> Json.Num)
        ("TaxSell",p.TaxSell.ToString() |> Json.Num)
        ("Misc",p.Misc |> Json.Str)
        ("RefLastPriceChange",(p.RefLastPriceChange |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("HedgeExternal",p.HedgeExternal |> Json.Str)
        ("OfferingPrice",p.OfferingPrice.ToString() |> Json.Num)
        ("IssuanceAmount",p.IssuanceAmount.ToString() |> Json.Num)
        ("ListingStatus",(p.ListingStatus |> EnumToValue).ToString() |> Json.Num)
        ("Turnover",p.Turnover.ToString() |> Json.Num)
        ("PriceOpened",p.PriceOpened.ToString() |> Json.Num) |]
    |> Json.Braket

let INS__json (v:INS) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Hidden",if p.Hidden then Json.True else Json.False)
        ("EnableQuote",if p.EnableQuote then Json.True else Json.False)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Long",p.Long.ToString() |> Json.Num)
        ("AssetName",p.AssetName |> Json.Str)
        ("Short",p.Short.ToString() |> Json.Num)
        ("Convertor",p.Convertor.ToString() |> Json.Num)
        ("m",p.m.ToString() |> Json.Num)
        ("mu",p.mu.ToString() |> Json.Num)
        ("eta",p.eta.ToString() |> Json.Num)
        ("psi",p.psi.ToString() |> Json.Num)
        ("MarginCalc",(p.MarginCalc |> EnumToValue).ToString() |> Json.Num)
        ("MarginRateInit",p.MarginRateInit.ToString() |> Json.Num)
        ("MarginRateMntn",p.MarginRateMntn.ToString() |> Json.Num)
        ("MarginMode",(p.MarginMode |> EnumToValue).ToString() |> Json.Num)
        ("Dec",p.Dec.ToString() |> Json.Num)
        ("Formatter",p.Formatter |> Json.Str)
        ("Path",p.Path |> Json.Str)
        ("Ask",p.Ask.ToString() |> Json.Num)
        ("Bid",p.Bid.ToString() |> Json.Num)
        ("Middle",p.Middle.ToString() |> Json.Num)
        ("FixedSpread",p.FixedSpread.ToString() |> Json.Num)
        ("PercentageSpread",p.PercentageSpread.ToString() |> Json.Num)
        ("TaxOpenMode",(p.TaxOpenMode |> EnumToValue).ToString() |> Json.Num)
        ("TaxOpen",p.TaxOpen.ToString() |> Json.Num)
        ("TaxCloseMode",(p.TaxCloseMode |> EnumToValue).ToString() |> Json.Num)
        ("TaxClose",p.TaxClose.ToString() |> Json.Num)
        ("Tax",p.Tax.ToString() |> Json.Num)
        ("TaxCur",p.TaxCur.ToString() |> Json.Num)
        ("TaxCurCode",p.TaxCurCode |> Json.Str)
        ("LastPrice",p.LastPrice.ToString() |> Json.Num)
        ("LastUpdatedat",(p.LastUpdatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("LastPriceChange",(p.LastPriceChange |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("TradeStatus",(p.TradeStatus |> EnumToValue).ToString() |> Json.Num)
        ("RoMode",(p.RoMode |> EnumToValue).ToString() |> Json.Num)
        ("Schedule",p.Schedule |> Json.Str)
        ("TradeMode",(p.TradeMode |> EnumToValue).ToString() |> Json.Num)
        ("DerivativeMode",(p.DerivativeMode |> EnumToValue).ToString() |> Json.Num)
        ("OptionsMode",(p.OptionsMode |> EnumToValue).ToString() |> Json.Num)
        ("OptionsCP",(p.OptionsCP |> EnumToValue).ToString() |> Json.Num)
        ("OptionsExpiry",(p.OptionsExpiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("OptionsStrike",p.OptionsStrike.ToString() |> Json.Num)
        ("OptionsPricing",p.OptionsPricing |> Json.Str)
        ("OptionsPeriod",p.OptionsPeriod |> Json.Str)
        ("OptionsTax",p.OptionsTax.ToString() |> Json.Num)
        ("OptionsPremiumPerTradeMin",p.OptionsPremiumPerTradeMin.ToString() |> Json.Num)
        ("OptionsPremiumPerTradeMax",p.OptionsPremiumPerTradeMax.ToString() |> Json.Num)
        ("LimitLotPerTrade",p.LimitLotPerTrade.ToString() |> Json.Num)
        ("LimitLotPosition",p.LimitLotPosition.ToString() |> Json.Num)
        ("CurrentOpen",p.CurrentOpen.ToString() |> Json.Num)
        ("CurrentHigh",p.CurrentHigh.ToString() |> Json.Num)
        ("CurrentLow",p.CurrentLow.ToString() |> Json.Num)
        ("PrevClose",p.PrevClose.ToString() |> Json.Num)
        ("PrevClosedat",(p.PrevClosedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("CurrentOpenat",(p.CurrentOpenat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("ExtBiz",p.ExtBiz.ToString() |> Json.Num)
        ("RefExternal",p.RefExternal |> Json.Str)
        ("ItrnInss",p.ItrnInss |> Json.Str)
        ("ItrnInssMode",(p.ItrnInssMode |> EnumToValue).ToString() |> Json.Num)
        ("FlushType",(p.FlushType |> EnumToValue).ToString() |> Json.Num)
        ("CurTrigger",(p.CurTrigger |> EnumToValue).ToString() |> Json.Num)
        ("RobotType",(p.RobotType |> EnumToValue).ToString() |> Json.Num)
        ("ExtLong",p.ExtLong |> Json.Str)
        ("ExtShort",p.ExtShort |> Json.Str)
        ("ExtPrice",p.ExtPrice.ToString() |> Json.Num)
        ("SaveM1",if p.SaveM1 then Json.True else Json.False)
        ("HistSavedat",(p.HistSavedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("SaveD1",if p.SaveD1 then Json.True else Json.False)
        ("SlPips",p.SlPips.ToString() |> Json.Num)
        ("TpPips",p.TpPips.ToString() |> Json.Num)
        ("PendingLimitPips",p.PendingLimitPips.ToString() |> Json.Num)
        ("PendingStopPips",p.PendingStopPips.ToString() |> Json.Num)
        ("LastDirection",(p.LastDirection |> EnumToValue).ToString() |> Json.Num)
        ("LiqMode",(p.LiqMode |> EnumToValue).ToString() |> Json.Num)
        ("LiqPeriodSince",(p.LiqPeriodSince |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("LiqPeriodTill",p.LiqPeriodTill.ToString() |> Json.Num)
        ("LiqPeriod",(p.LiqPeriod |> EnumToValue).ToString() |> Json.Num)
        ("LiqTime",p.LiqTime.ToString() |> Json.Num)
        ("ConvertRatio",p.ConvertRatio.ToString() |> Json.Num)
        ("RoBuyMode",(p.RoBuyMode |> EnumToValue).ToString() |> Json.Num)
        ("RoBuy",p.RoBuy.ToString() |> Json.Num)
        ("RoSellMode",(p.RoSellMode |> EnumToValue).ToString() |> Json.Num)
        ("RoSell",p.RoSell.ToString() |> Json.Num)
        ("PosLimitBuy",p.PosLimitBuy.ToString() |> Json.Num)
        ("PosLimitSell",p.PosLimitSell.ToString() |> Json.Num)
        ("RoCur",p.RoCur.ToString() |> Json.Num)
        ("RoCurCode",p.RoCurCode |> Json.Str)
        ("AdjBias",p.AdjBias.ToString() |> Json.Num)
        ("TaxBuy",p.TaxBuy.ToString() |> Json.Num)
        ("TaxSell",p.TaxSell.ToString() |> Json.Num)
        ("Misc",p.Misc |> Json.Str)
        ("RefLastPriceChange",(p.RefLastPriceChange |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("HedgeExternal",p.HedgeExternal |> Json.Str)
        ("OfferingPrice",p.OfferingPrice.ToString() |> Json.Num)
        ("IssuanceAmount",p.IssuanceAmount.ToString() |> Json.Num)
        ("ListingStatus",(p.ListingStatus |> EnumToValue).ToString() |> Json.Num)
        ("Turnover",p.Turnover.ToString() |> Json.Num)
        ("PriceOpened",p.PriceOpened.ToString() |> Json.Num) |]
    |> Json.Braket

let INS__jsonTbw (w:TextBlockWriter) (v:INS) =
    json__str w (INS__json v)

let INS__jsonStr (v:INS) =
    (INS__json v) |> json__strFinal


let json__pINSo (json:Json):pINS option =
    let fields = json |> json__items

    let p = pINS_empty()
    
    p.Desc <- checkfield fields "Desc"
    
    p.Hidden <- checkfield fields "Hidden" = "true"
    
    p.EnableQuote <- checkfield fields "EnableQuote" = "true"
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Long <- checkfield fields "Long" |> parse_int64
    
    p.AssetName <- checkfieldz fields "AssetName" 64
    
    p.Short <- checkfield fields "Short" |> parse_int64
    
    p.Convertor <- checkfield fields "Convertor" |> parse_int64
    
    p.m <- checkfield fields "m" |> parse_float
    
    p.mu <- checkfield fields "mu" |> parse_float
    
    p.eta <- checkfield fields "eta" |> parse_float
    
    p.psi <- checkfield fields "psi" |> parse_float
    
    p.MarginCalc <- checkfield fields "MarginCalc" |> parse_int32 |> EnumOfValue
    
    p.MarginRateInit <- checkfield fields "MarginRateInit" |> parse_float
    
    p.MarginRateMntn <- checkfield fields "MarginRateMntn" |> parse_float
    
    p.MarginMode <- checkfield fields "MarginMode" |> parse_int32 |> EnumOfValue
    
    p.Dec <- checkfield fields "Dec" |> parse_int64
    
    p.Formatter <- checkfieldz fields "Formatter" 64
    
    p.Path <- checkfieldz fields "Path" 256
    
    p.Ask <- checkfield fields "Ask" |> parse_int64
    
    p.Bid <- checkfield fields "Bid" |> parse_int64
    
    p.Middle <- checkfield fields "Middle" |> parse_float
    
    p.FixedSpread <- checkfield fields "FixedSpread" |> parse_float
    
    p.PercentageSpread <- checkfield fields "PercentageSpread" |> parse_float
    
    p.TaxOpenMode <- checkfield fields "TaxOpenMode" |> parse_int32 |> EnumOfValue
    
    p.TaxOpen <- checkfield fields "TaxOpen" |> parse_float
    
    p.TaxCloseMode <- checkfield fields "TaxCloseMode" |> parse_int32 |> EnumOfValue
    
    p.TaxClose <- checkfield fields "TaxClose" |> parse_float
    
    p.Tax <- checkfield fields "Tax" |> parse_float
    
    p.TaxCur <- checkfield fields "TaxCur" |> parse_int64
    
    p.TaxCurCode <- checkfieldz fields "TaxCurCode" 64
    
    p.LastPrice <- checkfield fields "LastPrice" |> parse_float
    
    p.LastUpdatedat <- checkfield fields "LastUpdatedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.LastPriceChange <- checkfield fields "LastPriceChange" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.TradeStatus <- checkfield fields "TradeStatus" |> parse_int32 |> EnumOfValue
    
    p.RoMode <- checkfield fields "RoMode" |> parse_int32 |> EnumOfValue
    
    p.Schedule <- checkfield fields "Schedule"
    
    p.TradeMode <- checkfield fields "TradeMode" |> parse_int32 |> EnumOfValue
    
    p.DerivativeMode <- checkfield fields "DerivativeMode" |> parse_int32 |> EnumOfValue
    
    p.OptionsMode <- checkfield fields "OptionsMode" |> parse_int32 |> EnumOfValue
    
    p.OptionsCP <- checkfield fields "OptionsCP" |> parse_int32 |> EnumOfValue
    
    p.OptionsExpiry <- checkfield fields "OptionsExpiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.OptionsStrike <- checkfield fields "OptionsStrike" |> parse_float
    
    p.OptionsPricing <- checkfield fields "OptionsPricing"
    
    p.OptionsPeriod <- checkfield fields "OptionsPeriod"
    
    p.OptionsTax <- checkfield fields "OptionsTax" |> parse_float
    
    p.OptionsPremiumPerTradeMin <- checkfield fields "OptionsPremiumPerTradeMin" |> parse_float
    
    p.OptionsPremiumPerTradeMax <- checkfield fields "OptionsPremiumPerTradeMax" |> parse_float
    
    p.LimitLotPerTrade <- checkfield fields "LimitLotPerTrade" |> parse_float
    
    p.LimitLotPosition <- checkfield fields "LimitLotPosition" |> parse_float
    
    p.CurrentOpen <- checkfield fields "CurrentOpen" |> parse_float
    
    p.CurrentHigh <- checkfield fields "CurrentHigh" |> parse_float
    
    p.CurrentLow <- checkfield fields "CurrentLow" |> parse_float
    
    p.PrevClose <- checkfield fields "PrevClose" |> parse_float
    
    p.PrevClosedat <- checkfield fields "PrevClosedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.CurrentOpenat <- checkfield fields "CurrentOpenat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.ExtBiz <- checkfield fields "ExtBiz" |> parse_int64
    
    p.RefExternal <- checkfieldz fields "RefExternal" 64
    
    p.ItrnInss <- checkfield fields "ItrnInss"
    
    p.ItrnInssMode <- checkfield fields "ItrnInssMode" |> parse_int32 |> EnumOfValue
    
    p.FlushType <- checkfield fields "FlushType" |> parse_int32 |> EnumOfValue
    
    p.CurTrigger <- checkfield fields "CurTrigger" |> parse_int32 |> EnumOfValue
    
    p.RobotType <- checkfield fields "RobotType" |> parse_int32 |> EnumOfValue
    
    p.ExtLong <- checkfieldz fields "ExtLong" 64
    
    p.ExtShort <- checkfieldz fields "ExtShort" 64
    
    p.ExtPrice <- checkfield fields "ExtPrice" |> parse_float
    
    p.SaveM1 <- checkfield fields "SaveM1" = "true"
    
    p.HistSavedat <- checkfield fields "HistSavedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.SaveD1 <- checkfield fields "SaveD1" = "true"
    
    p.SlPips <- checkfield fields "SlPips" |> parse_float
    
    p.TpPips <- checkfield fields "TpPips" |> parse_float
    
    p.PendingLimitPips <- checkfield fields "PendingLimitPips" |> parse_float
    
    p.PendingStopPips <- checkfield fields "PendingStopPips" |> parse_float
    
    p.LastDirection <- checkfield fields "LastDirection" |> parse_int32 |> EnumOfValue
    
    p.LiqMode <- checkfield fields "LiqMode" |> parse_int32 |> EnumOfValue
    
    p.LiqPeriodSince <- checkfield fields "LiqPeriodSince" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.LiqPeriodTill <- checkfield fields "LiqPeriodTill" |> parse_int64
    
    p.LiqPeriod <- checkfield fields "LiqPeriod" |> parse_int32 |> EnumOfValue
    
    p.LiqTime <- checkfield fields "LiqTime" |> parse_float
    
    p.ConvertRatio <- checkfield fields "ConvertRatio" |> parse_float
    
    p.RoBuyMode <- checkfield fields "RoBuyMode" |> parse_int32 |> EnumOfValue
    
    p.RoBuy <- checkfield fields "RoBuy" |> parse_float
    
    p.RoSellMode <- checkfield fields "RoSellMode" |> parse_int32 |> EnumOfValue
    
    p.RoSell <- checkfield fields "RoSell" |> parse_float
    
    p.PosLimitBuy <- checkfield fields "PosLimitBuy" |> parse_float
    
    p.PosLimitSell <- checkfield fields "PosLimitSell" |> parse_float
    
    p.RoCur <- checkfield fields "RoCur" |> parse_int64
    
    p.RoCurCode <- checkfieldz fields "RoCurCode" 64
    
    p.AdjBias <- checkfield fields "AdjBias" |> parse_float
    
    p.TaxBuy <- checkfield fields "TaxBuy" |> parse_float
    
    p.TaxSell <- checkfield fields "TaxSell" |> parse_float
    
    p.Misc <- checkfield fields "Misc"
    
    p.RefLastPriceChange <- checkfield fields "RefLastPriceChange" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.HedgeExternal <- checkfieldz fields "HedgeExternal" 64
    
    p.OfferingPrice <- checkfield fields "OfferingPrice" |> parse_float
    
    p.IssuanceAmount <- checkfield fields "IssuanceAmount" |> parse_int64
    
    p.ListingStatus <- checkfield fields "ListingStatus" |> parse_int32 |> EnumOfValue
    
    p.Turnover <- checkfield fields "Turnover" |> parse_float
    
    p.PriceOpened <- checkfield fields "PriceOpened" |> parse_int64
    
    p |> Some
    

let json__INSo (json:Json):INS option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pINS_empty()
    
    p.Desc <- checkfield fields "Desc"
    
    p.Hidden <- checkfield fields "Hidden" = "true"
    
    p.EnableQuote <- checkfield fields "EnableQuote" = "true"
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Long <- checkfield fields "Long" |> parse_int64
    
    p.AssetName <- checkfieldz fields "AssetName" 64
    
    p.Short <- checkfield fields "Short" |> parse_int64
    
    p.Convertor <- checkfield fields "Convertor" |> parse_int64
    
    p.m <- checkfield fields "m" |> parse_float
    
    p.mu <- checkfield fields "mu" |> parse_float
    
    p.eta <- checkfield fields "eta" |> parse_float
    
    p.psi <- checkfield fields "psi" |> parse_float
    
    p.MarginCalc <- checkfield fields "MarginCalc" |> parse_int32 |> EnumOfValue
    
    p.MarginRateInit <- checkfield fields "MarginRateInit" |> parse_float
    
    p.MarginRateMntn <- checkfield fields "MarginRateMntn" |> parse_float
    
    p.MarginMode <- checkfield fields "MarginMode" |> parse_int32 |> EnumOfValue
    
    p.Dec <- checkfield fields "Dec" |> parse_int64
    
    p.Formatter <- checkfieldz fields "Formatter" 64
    
    p.Path <- checkfieldz fields "Path" 256
    
    p.Ask <- checkfield fields "Ask" |> parse_int64
    
    p.Bid <- checkfield fields "Bid" |> parse_int64
    
    p.Middle <- checkfield fields "Middle" |> parse_float
    
    p.FixedSpread <- checkfield fields "FixedSpread" |> parse_float
    
    p.PercentageSpread <- checkfield fields "PercentageSpread" |> parse_float
    
    p.TaxOpenMode <- checkfield fields "TaxOpenMode" |> parse_int32 |> EnumOfValue
    
    p.TaxOpen <- checkfield fields "TaxOpen" |> parse_float
    
    p.TaxCloseMode <- checkfield fields "TaxCloseMode" |> parse_int32 |> EnumOfValue
    
    p.TaxClose <- checkfield fields "TaxClose" |> parse_float
    
    p.Tax <- checkfield fields "Tax" |> parse_float
    
    p.TaxCur <- checkfield fields "TaxCur" |> parse_int64
    
    p.TaxCurCode <- checkfieldz fields "TaxCurCode" 64
    
    p.LastPrice <- checkfield fields "LastPrice" |> parse_float
    
    p.LastUpdatedat <- checkfield fields "LastUpdatedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.LastPriceChange <- checkfield fields "LastPriceChange" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.TradeStatus <- checkfield fields "TradeStatus" |> parse_int32 |> EnumOfValue
    
    p.RoMode <- checkfield fields "RoMode" |> parse_int32 |> EnumOfValue
    
    p.Schedule <- checkfield fields "Schedule"
    
    p.TradeMode <- checkfield fields "TradeMode" |> parse_int32 |> EnumOfValue
    
    p.DerivativeMode <- checkfield fields "DerivativeMode" |> parse_int32 |> EnumOfValue
    
    p.OptionsMode <- checkfield fields "OptionsMode" |> parse_int32 |> EnumOfValue
    
    p.OptionsCP <- checkfield fields "OptionsCP" |> parse_int32 |> EnumOfValue
    
    p.OptionsExpiry <- checkfield fields "OptionsExpiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.OptionsStrike <- checkfield fields "OptionsStrike" |> parse_float
    
    p.OptionsPricing <- checkfield fields "OptionsPricing"
    
    p.OptionsPeriod <- checkfield fields "OptionsPeriod"
    
    p.OptionsTax <- checkfield fields "OptionsTax" |> parse_float
    
    p.OptionsPremiumPerTradeMin <- checkfield fields "OptionsPremiumPerTradeMin" |> parse_float
    
    p.OptionsPremiumPerTradeMax <- checkfield fields "OptionsPremiumPerTradeMax" |> parse_float
    
    p.LimitLotPerTrade <- checkfield fields "LimitLotPerTrade" |> parse_float
    
    p.LimitLotPosition <- checkfield fields "LimitLotPosition" |> parse_float
    
    p.CurrentOpen <- checkfield fields "CurrentOpen" |> parse_float
    
    p.CurrentHigh <- checkfield fields "CurrentHigh" |> parse_float
    
    p.CurrentLow <- checkfield fields "CurrentLow" |> parse_float
    
    p.PrevClose <- checkfield fields "PrevClose" |> parse_float
    
    p.PrevClosedat <- checkfield fields "PrevClosedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.CurrentOpenat <- checkfield fields "CurrentOpenat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.ExtBiz <- checkfield fields "ExtBiz" |> parse_int64
    
    p.RefExternal <- checkfieldz fields "RefExternal" 64
    
    p.ItrnInss <- checkfield fields "ItrnInss"
    
    p.ItrnInssMode <- checkfield fields "ItrnInssMode" |> parse_int32 |> EnumOfValue
    
    p.FlushType <- checkfield fields "FlushType" |> parse_int32 |> EnumOfValue
    
    p.CurTrigger <- checkfield fields "CurTrigger" |> parse_int32 |> EnumOfValue
    
    p.RobotType <- checkfield fields "RobotType" |> parse_int32 |> EnumOfValue
    
    p.ExtLong <- checkfieldz fields "ExtLong" 64
    
    p.ExtShort <- checkfieldz fields "ExtShort" 64
    
    p.ExtPrice <- checkfield fields "ExtPrice" |> parse_float
    
    p.SaveM1 <- checkfield fields "SaveM1" = "true"
    
    p.HistSavedat <- checkfield fields "HistSavedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.SaveD1 <- checkfield fields "SaveD1" = "true"
    
    p.SlPips <- checkfield fields "SlPips" |> parse_float
    
    p.TpPips <- checkfield fields "TpPips" |> parse_float
    
    p.PendingLimitPips <- checkfield fields "PendingLimitPips" |> parse_float
    
    p.PendingStopPips <- checkfield fields "PendingStopPips" |> parse_float
    
    p.LastDirection <- checkfield fields "LastDirection" |> parse_int32 |> EnumOfValue
    
    p.LiqMode <- checkfield fields "LiqMode" |> parse_int32 |> EnumOfValue
    
    p.LiqPeriodSince <- checkfield fields "LiqPeriodSince" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.LiqPeriodTill <- checkfield fields "LiqPeriodTill" |> parse_int64
    
    p.LiqPeriod <- checkfield fields "LiqPeriod" |> parse_int32 |> EnumOfValue
    
    p.LiqTime <- checkfield fields "LiqTime" |> parse_float
    
    p.ConvertRatio <- checkfield fields "ConvertRatio" |> parse_float
    
    p.RoBuyMode <- checkfield fields "RoBuyMode" |> parse_int32 |> EnumOfValue
    
    p.RoBuy <- checkfield fields "RoBuy" |> parse_float
    
    p.RoSellMode <- checkfield fields "RoSellMode" |> parse_int32 |> EnumOfValue
    
    p.RoSell <- checkfield fields "RoSell" |> parse_float
    
    p.PosLimitBuy <- checkfield fields "PosLimitBuy" |> parse_float
    
    p.PosLimitSell <- checkfield fields "PosLimitSell" |> parse_float
    
    p.RoCur <- checkfield fields "RoCur" |> parse_int64
    
    p.RoCurCode <- checkfieldz fields "RoCurCode" 64
    
    p.AdjBias <- checkfield fields "AdjBias" |> parse_float
    
    p.TaxBuy <- checkfield fields "TaxBuy" |> parse_float
    
    p.TaxSell <- checkfield fields "TaxSell" |> parse_float
    
    p.Misc <- checkfield fields "Misc"
    
    p.RefLastPriceChange <- checkfield fields "RefLastPriceChange" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.HedgeExternal <- checkfieldz fields "HedgeExternal" 64
    
    p.OfferingPrice <- checkfield fields "OfferingPrice" |> parse_float
    
    p.IssuanceAmount <- checkfield fields "IssuanceAmount" |> parse_int64
    
    p.ListingStatus <- checkfield fields "ListingStatus" |> parse_int32 |> EnumOfValue
    
    p.Turnover <- checkfield fields "Turnover" |> parse_float
    
    p.PriceOpened <- checkfield fields "PriceOpened" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [TICKET] Structure

let pTICKET__bin (bb:BytesBuilder) (p:pTICKET) =

    
    p.EndUser |> BitConverter.GetBytes |> bb.append
    
    p.TradeAcct |> BitConverter.GetBytes |> bb.append
    
    p.Ins |> BitConverter.GetBytes |> bb.append
    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.TradeMode |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Lot |> BitConverter.GetBytes |> bb.append
    
    p.PriceOpened |> BitConverter.GetBytes |> bb.append
    
    p.PriceOpen |> BitConverter.GetBytes |> bb.append
    
    p.PriceSL |> BitConverter.GetBytes |> bb.append
    
    p.PriceTP |> BitConverter.GetBytes |> bb.append
    
    p.PriceClose |> BitConverter.GetBytes |> bb.append
    
    p.Status |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.CP |> BitConverter.GetBytes |> bb.append
    
    p.CptAcct |> BitConverter.GetBytes |> bb.append
    
    p.Ref |> BitConverter.GetBytes |> bb.append
    
    p.OpenRef |> BitConverter.GetBytes |> bb.append
    
    p.CloseRef |> BitConverter.GetBytes |> bb.append
    
    p.Origin |> BitConverter.GetBytes |> bb.append
    
    p.PnL |> BitConverter.GetBytes |> bb.append
    
    p.PnLSpread |> BitConverter.GetBytes |> bb.append
    
    p.Margin |> BitConverter.GetBytes |> bb.append
    
    p.RO |> BitConverter.GetBytes |> bb.append
    
    p.Tax |> BitConverter.GetBytes |> bb.append
    
    p.CloseType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.CommitType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binCmt = p.Cmt |> Encoding.UTF8.GetBytes
    binCmt.Length |> BitConverter.GetBytes |> bb.append
    binCmt |> bb.append
    
    p.Opendat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.Closedat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.CaStrategyAmt |> BitConverter.GetBytes |> bb.append
    
    p.CaRo |> BitConverter.GetBytes |> bb.append
    
    p.CaAsa |> BitConverter.GetBytes |> bb.append
    
    p.CaCmphsvCharge |> BitConverter.GetBytes |> bb.append
    
    p.RoCheckedat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.Expiry.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.HedgetCP |> BitConverter.GetBytes |> bb.append
    
    p.PendingPrice |> BitConverter.GetBytes |> bb.append
    
    p.ClosedLot |> BitConverter.GetBytes |> bb.append
    
    p.ClosedAmt |> BitConverter.GetBytes |> bb.append
    
    p.PendingAmt |> BitConverter.GetBytes |> bb.append
    
    p.DrvPreminum |> BitConverter.GetBytes |> bb.append
    
    p.DrvExpiry.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.DrvPeriod |> BitConverter.GetBytes |> bb.append
    
    p.DrvDirection |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.DrvPrice |> BitConverter.GetBytes |> bb.append
    
    p.DoubleCp |> BitConverter.GetBytes |> bb.append
    
    p.ClearStatus |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.FollowTicket |> BitConverter.GetBytes |> bb.append
    
    let binConfig = p.Config |> Encoding.UTF8.GetBytes
    binConfig.Length |> BitConverter.GetBytes |> bb.append
    binConfig |> bb.append
    
    p.OptionStatus |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.NotionalPrincipal |> BitConverter.GetBytes |> bb.append
    
    p.ExercisedPrincipal |> BitConverter.GetBytes |> bb.append
    
    p.ExerciseMode |> BitConverter.GetBytes |> bb.append
    
    p.ExercisePrice |> BitConverter.GetBytes |> bb.append
    
    p.ExternalTicketOpen |> BitConverter.GetBytes |> bb.append
    
    p.ExternalTicketClose |> BitConverter.GetBytes |> bb.append
    
    p.ExternalTicketPending |> BitConverter.GetBytes |> bb.append
    
    p.ExternalTicketCancel |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append

let TICKET__bin (bb:BytesBuilder) (v:TICKET) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pTICKET__bin bb v.p

let bin__pTICKET (bi:BinIndexed):pTICKET =
    let bin,index = bi

    let p = pTICKET_empty()
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.TradeAcct <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Ins <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.TradeMode <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Lot <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PriceOpened <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PriceOpen <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PriceSL <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PriceTP <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PriceClose <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Status <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.CP <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CptAcct <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Ref <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.OpenRef <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CloseRef <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Origin <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PnL <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PnLSpread <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Margin <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.RO <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Tax <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CloseType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.CommitType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Cmt = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Cmt <- Encoding.UTF8.GetString(bin,index.Value,count_Cmt)
    index.Value <- index.Value + count_Cmt
    
    p.Opendat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.Closedat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.CaStrategyAmt <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CaRo <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.CaAsa <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.CaCmphsvCharge <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.RoCheckedat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.Expiry <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.HedgetCP <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PendingPrice <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ClosedLot <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ClosedAmt <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.PendingAmt <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.DrvPreminum <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.DrvExpiry <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.DrvPeriod <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.DrvDirection <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.DrvPrice <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.DoubleCp <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ClearStatus <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.FollowTicket <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Config = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Config <- Encoding.UTF8.GetString(bin,index.Value,count_Config)
    index.Value <- index.Value + count_Config
    
    p.OptionStatus <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.NotionalPrincipal <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExercisedPrincipal <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExerciseMode <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExercisePrice <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExternalTicketOpen <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExternalTicketClose <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExternalTicketPending <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.ExternalTicketCancel <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p

let bin__TICKET (bi:BinIndexed):TICKET =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pTICKET bi }

let pTICKET__json (p:pTICKET) =

    [|
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("TradeAcct",p.TradeAcct.ToString() |> Json.Num)
        ("Ins",p.Ins.ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("TradeMode",(p.TradeMode |> EnumToValue).ToString() |> Json.Num)
        ("Lot",p.Lot.ToString() |> Json.Num)
        ("PriceOpened",p.PriceOpened.ToString() |> Json.Num)
        ("PriceOpen",p.PriceOpen.ToString() |> Json.Num)
        ("PriceSL",p.PriceSL.ToString() |> Json.Num)
        ("PriceTP",p.PriceTP.ToString() |> Json.Num)
        ("PriceClose",p.PriceClose.ToString() |> Json.Num)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("CP",p.CP.ToString() |> Json.Num)
        ("CptAcct",p.CptAcct.ToString() |> Json.Num)
        ("Ref",p.Ref.ToString() |> Json.Num)
        ("OpenRef",p.OpenRef.ToString() |> Json.Num)
        ("CloseRef",p.CloseRef.ToString() |> Json.Num)
        ("Origin",p.Origin.ToString() |> Json.Num)
        ("PnL",p.PnL.ToString() |> Json.Num)
        ("PnLSpread",p.PnLSpread.ToString() |> Json.Num)
        ("Margin",p.Margin.ToString() |> Json.Num)
        ("RO",p.RO.ToString() |> Json.Num)
        ("Tax",p.Tax.ToString() |> Json.Num)
        ("CloseType",(p.CloseType |> EnumToValue).ToString() |> Json.Num)
        ("CommitType",(p.CommitType |> EnumToValue).ToString() |> Json.Num)
        ("Cmt",p.Cmt |> Json.Str)
        ("Opendat",(p.Opendat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Closedat",(p.Closedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("CaStrategyAmt",p.CaStrategyAmt.ToString() |> Json.Num)
        ("CaRo",if p.CaRo then Json.True else Json.False)
        ("CaAsa",if p.CaAsa then Json.True else Json.False)
        ("CaCmphsvCharge",p.CaCmphsvCharge.ToString() |> Json.Num)
        ("RoCheckedat",(p.RoCheckedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Expiry",(p.Expiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("HedgetCP",p.HedgetCP.ToString() |> Json.Num)
        ("PendingPrice",p.PendingPrice.ToString() |> Json.Num)
        ("ClosedLot",p.ClosedLot.ToString() |> Json.Num)
        ("ClosedAmt",p.ClosedAmt.ToString() |> Json.Num)
        ("PendingAmt",p.PendingAmt.ToString() |> Json.Num)
        ("DrvPreminum",p.DrvPreminum.ToString() |> Json.Num)
        ("DrvExpiry",(p.DrvExpiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("DrvPeriod",p.DrvPeriod.ToString() |> Json.Num)
        ("DrvDirection",(p.DrvDirection |> EnumToValue).ToString() |> Json.Num)
        ("DrvPrice",p.DrvPrice.ToString() |> Json.Num)
        ("DoubleCp",p.DoubleCp.ToString() |> Json.Num)
        ("ClearStatus",(p.ClearStatus |> EnumToValue).ToString() |> Json.Num)
        ("FollowTicket",p.FollowTicket.ToString() |> Json.Num)
        ("Config",p.Config |> Json.Str)
        ("OptionStatus",(p.OptionStatus |> EnumToValue).ToString() |> Json.Num)
        ("NotionalPrincipal",p.NotionalPrincipal.ToString() |> Json.Num)
        ("ExercisedPrincipal",p.ExercisedPrincipal.ToString() |> Json.Num)
        ("ExerciseMode",p.ExerciseMode.ToString() |> Json.Num)
        ("ExercisePrice",p.ExercisePrice.ToString() |> Json.Num)
        ("ExternalTicketOpen",p.ExternalTicketOpen.ToString() |> Json.Num)
        ("ExternalTicketClose",p.ExternalTicketClose.ToString() |> Json.Num)
        ("ExternalTicketPending",p.ExternalTicketPending.ToString() |> Json.Num)
        ("ExternalTicketCancel",p.ExternalTicketCancel.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let TICKET__json (v:TICKET) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("TradeAcct",p.TradeAcct.ToString() |> Json.Num)
        ("Ins",p.Ins.ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("TradeMode",(p.TradeMode |> EnumToValue).ToString() |> Json.Num)
        ("Lot",p.Lot.ToString() |> Json.Num)
        ("PriceOpened",p.PriceOpened.ToString() |> Json.Num)
        ("PriceOpen",p.PriceOpen.ToString() |> Json.Num)
        ("PriceSL",p.PriceSL.ToString() |> Json.Num)
        ("PriceTP",p.PriceTP.ToString() |> Json.Num)
        ("PriceClose",p.PriceClose.ToString() |> Json.Num)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("CP",p.CP.ToString() |> Json.Num)
        ("CptAcct",p.CptAcct.ToString() |> Json.Num)
        ("Ref",p.Ref.ToString() |> Json.Num)
        ("OpenRef",p.OpenRef.ToString() |> Json.Num)
        ("CloseRef",p.CloseRef.ToString() |> Json.Num)
        ("Origin",p.Origin.ToString() |> Json.Num)
        ("PnL",p.PnL.ToString() |> Json.Num)
        ("PnLSpread",p.PnLSpread.ToString() |> Json.Num)
        ("Margin",p.Margin.ToString() |> Json.Num)
        ("RO",p.RO.ToString() |> Json.Num)
        ("Tax",p.Tax.ToString() |> Json.Num)
        ("CloseType",(p.CloseType |> EnumToValue).ToString() |> Json.Num)
        ("CommitType",(p.CommitType |> EnumToValue).ToString() |> Json.Num)
        ("Cmt",p.Cmt |> Json.Str)
        ("Opendat",(p.Opendat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Closedat",(p.Closedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("CaStrategyAmt",p.CaStrategyAmt.ToString() |> Json.Num)
        ("CaRo",if p.CaRo then Json.True else Json.False)
        ("CaAsa",if p.CaAsa then Json.True else Json.False)
        ("CaCmphsvCharge",p.CaCmphsvCharge.ToString() |> Json.Num)
        ("RoCheckedat",(p.RoCheckedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Expiry",(p.Expiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("HedgetCP",p.HedgetCP.ToString() |> Json.Num)
        ("PendingPrice",p.PendingPrice.ToString() |> Json.Num)
        ("ClosedLot",p.ClosedLot.ToString() |> Json.Num)
        ("ClosedAmt",p.ClosedAmt.ToString() |> Json.Num)
        ("PendingAmt",p.PendingAmt.ToString() |> Json.Num)
        ("DrvPreminum",p.DrvPreminum.ToString() |> Json.Num)
        ("DrvExpiry",(p.DrvExpiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("DrvPeriod",p.DrvPeriod.ToString() |> Json.Num)
        ("DrvDirection",(p.DrvDirection |> EnumToValue).ToString() |> Json.Num)
        ("DrvPrice",p.DrvPrice.ToString() |> Json.Num)
        ("DoubleCp",p.DoubleCp.ToString() |> Json.Num)
        ("ClearStatus",(p.ClearStatus |> EnumToValue).ToString() |> Json.Num)
        ("FollowTicket",p.FollowTicket.ToString() |> Json.Num)
        ("Config",p.Config |> Json.Str)
        ("OptionStatus",(p.OptionStatus |> EnumToValue).ToString() |> Json.Num)
        ("NotionalPrincipal",p.NotionalPrincipal.ToString() |> Json.Num)
        ("ExercisedPrincipal",p.ExercisedPrincipal.ToString() |> Json.Num)
        ("ExerciseMode",p.ExerciseMode.ToString() |> Json.Num)
        ("ExercisePrice",p.ExercisePrice.ToString() |> Json.Num)
        ("ExternalTicketOpen",p.ExternalTicketOpen.ToString() |> Json.Num)
        ("ExternalTicketClose",p.ExternalTicketClose.ToString() |> Json.Num)
        ("ExternalTicketPending",p.ExternalTicketPending.ToString() |> Json.Num)
        ("ExternalTicketCancel",p.ExternalTicketCancel.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let TICKET__jsonTbw (w:TextBlockWriter) (v:TICKET) =
    json__str w (TICKET__json v)

let TICKET__jsonStr (v:TICKET) =
    (TICKET__json v) |> json__strFinal


let json__pTICKETo (json:Json):pTICKET option =
    let fields = json |> json__items

    let p = pTICKET_empty()
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.TradeAcct <- checkfield fields "TradeAcct" |> parse_int64
    
    p.Ins <- checkfield fields "Ins" |> parse_int64
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.TradeMode <- checkfield fields "TradeMode" |> parse_int32 |> EnumOfValue
    
    p.Lot <- checkfield fields "Lot" |> parse_int64
    
    p.PriceOpened <- checkfield fields "PriceOpened" |> parse_int64
    
    p.PriceOpen <- checkfield fields "PriceOpen" |> parse_int64
    
    p.PriceSL <- checkfield fields "PriceSL" |> parse_int64
    
    p.PriceTP <- checkfield fields "PriceTP" |> parse_int64
    
    p.PriceClose <- checkfield fields "PriceClose" |> parse_int64
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.CP <- checkfield fields "CP" |> parse_int64
    
    p.CptAcct <- checkfield fields "CptAcct" |> parse_int64
    
    p.Ref <- checkfield fields "Ref" |> parse_int64
    
    p.OpenRef <- checkfield fields "OpenRef" |> parse_int64
    
    p.CloseRef <- checkfield fields "CloseRef" |> parse_int64
    
    p.Origin <- checkfield fields "Origin" |> parse_int64
    
    p.PnL <- checkfield fields "PnL" |> parse_float
    
    p.PnLSpread <- checkfield fields "PnLSpread" |> parse_float
    
    p.Margin <- checkfield fields "Margin" |> parse_float
    
    p.RO <- checkfield fields "RO" |> parse_float
    
    p.Tax <- checkfield fields "Tax" |> parse_float
    
    p.CloseType <- checkfield fields "CloseType" |> parse_int32 |> EnumOfValue
    
    p.CommitType <- checkfield fields "CommitType" |> parse_int32 |> EnumOfValue
    
    p.Cmt <- checkfieldz fields "Cmt" 64
    
    p.Opendat <- checkfield fields "Opendat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.Closedat <- checkfield fields "Closedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.CaStrategyAmt <- checkfield fields "CaStrategyAmt" |> parse_float
    
    p.CaRo <- checkfield fields "CaRo" = "true"
    
    p.CaAsa <- checkfield fields "CaAsa" = "true"
    
    p.CaCmphsvCharge <- checkfield fields "CaCmphsvCharge" |> parse_float
    
    p.RoCheckedat <- checkfield fields "RoCheckedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.Expiry <- checkfield fields "Expiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.HedgetCP <- checkfield fields "HedgetCP" |> parse_int64
    
    p.PendingPrice <- checkfield fields "PendingPrice" |> parse_int64
    
    p.ClosedLot <- checkfield fields "ClosedLot" |> parse_int64
    
    p.ClosedAmt <- checkfield fields "ClosedAmt" |> parse_float
    
    p.PendingAmt <- checkfield fields "PendingAmt" |> parse_float
    
    p.DrvPreminum <- checkfield fields "DrvPreminum" |> parse_float
    
    p.DrvExpiry <- checkfield fields "DrvExpiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.DrvPeriod <- checkfield fields "DrvPeriod" |> parse_int64
    
    p.DrvDirection <- checkfield fields "DrvDirection" |> parse_int32 |> EnumOfValue
    
    p.DrvPrice <- checkfield fields "DrvPrice" |> parse_float
    
    p.DoubleCp <- checkfield fields "DoubleCp" |> parse_int64
    
    p.ClearStatus <- checkfield fields "ClearStatus" |> parse_int32 |> EnumOfValue
    
    p.FollowTicket <- checkfield fields "FollowTicket" |> parse_int64
    
    p.Config <- checkfield fields "Config"
    
    p.OptionStatus <- checkfield fields "OptionStatus" |> parse_int32 |> EnumOfValue
    
    p.NotionalPrincipal <- checkfield fields "NotionalPrincipal" |> parse_float
    
    p.ExercisedPrincipal <- checkfield fields "ExercisedPrincipal" |> parse_float
    
    p.ExerciseMode <- checkfield fields "ExerciseMode" |> parse_float
    
    p.ExercisePrice <- checkfield fields "ExercisePrice" |> parse_float
    
    p.ExternalTicketOpen <- checkfield fields "ExternalTicketOpen" |> parse_int64
    
    p.ExternalTicketClose <- checkfield fields "ExternalTicketClose" |> parse_int64
    
    p.ExternalTicketPending <- checkfield fields "ExternalTicketPending" |> parse_int64
    
    p.ExternalTicketCancel <- checkfield fields "ExternalTicketCancel" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p |> Some
    

let json__TICKETo (json:Json):TICKET option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pTICKET_empty()
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.TradeAcct <- checkfield fields "TradeAcct" |> parse_int64
    
    p.Ins <- checkfield fields "Ins" |> parse_int64
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.TradeMode <- checkfield fields "TradeMode" |> parse_int32 |> EnumOfValue
    
    p.Lot <- checkfield fields "Lot" |> parse_int64
    
    p.PriceOpened <- checkfield fields "PriceOpened" |> parse_int64
    
    p.PriceOpen <- checkfield fields "PriceOpen" |> parse_int64
    
    p.PriceSL <- checkfield fields "PriceSL" |> parse_int64
    
    p.PriceTP <- checkfield fields "PriceTP" |> parse_int64
    
    p.PriceClose <- checkfield fields "PriceClose" |> parse_int64
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.CP <- checkfield fields "CP" |> parse_int64
    
    p.CptAcct <- checkfield fields "CptAcct" |> parse_int64
    
    p.Ref <- checkfield fields "Ref" |> parse_int64
    
    p.OpenRef <- checkfield fields "OpenRef" |> parse_int64
    
    p.CloseRef <- checkfield fields "CloseRef" |> parse_int64
    
    p.Origin <- checkfield fields "Origin" |> parse_int64
    
    p.PnL <- checkfield fields "PnL" |> parse_float
    
    p.PnLSpread <- checkfield fields "PnLSpread" |> parse_float
    
    p.Margin <- checkfield fields "Margin" |> parse_float
    
    p.RO <- checkfield fields "RO" |> parse_float
    
    p.Tax <- checkfield fields "Tax" |> parse_float
    
    p.CloseType <- checkfield fields "CloseType" |> parse_int32 |> EnumOfValue
    
    p.CommitType <- checkfield fields "CommitType" |> parse_int32 |> EnumOfValue
    
    p.Cmt <- checkfieldz fields "Cmt" 64
    
    p.Opendat <- checkfield fields "Opendat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.Closedat <- checkfield fields "Closedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.CaStrategyAmt <- checkfield fields "CaStrategyAmt" |> parse_float
    
    p.CaRo <- checkfield fields "CaRo" = "true"
    
    p.CaAsa <- checkfield fields "CaAsa" = "true"
    
    p.CaCmphsvCharge <- checkfield fields "CaCmphsvCharge" |> parse_float
    
    p.RoCheckedat <- checkfield fields "RoCheckedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.Expiry <- checkfield fields "Expiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.HedgetCP <- checkfield fields "HedgetCP" |> parse_int64
    
    p.PendingPrice <- checkfield fields "PendingPrice" |> parse_int64
    
    p.ClosedLot <- checkfield fields "ClosedLot" |> parse_int64
    
    p.ClosedAmt <- checkfield fields "ClosedAmt" |> parse_float
    
    p.PendingAmt <- checkfield fields "PendingAmt" |> parse_float
    
    p.DrvPreminum <- checkfield fields "DrvPreminum" |> parse_float
    
    p.DrvExpiry <- checkfield fields "DrvExpiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.DrvPeriod <- checkfield fields "DrvPeriod" |> parse_int64
    
    p.DrvDirection <- checkfield fields "DrvDirection" |> parse_int32 |> EnumOfValue
    
    p.DrvPrice <- checkfield fields "DrvPrice" |> parse_float
    
    p.DoubleCp <- checkfield fields "DoubleCp" |> parse_int64
    
    p.ClearStatus <- checkfield fields "ClearStatus" |> parse_int32 |> EnumOfValue
    
    p.FollowTicket <- checkfield fields "FollowTicket" |> parse_int64
    
    p.Config <- checkfield fields "Config"
    
    p.OptionStatus <- checkfield fields "OptionStatus" |> parse_int32 |> EnumOfValue
    
    p.NotionalPrincipal <- checkfield fields "NotionalPrincipal" |> parse_float
    
    p.ExercisedPrincipal <- checkfield fields "ExercisedPrincipal" |> parse_float
    
    p.ExerciseMode <- checkfield fields "ExerciseMode" |> parse_float
    
    p.ExercisePrice <- checkfield fields "ExercisePrice" |> parse_float
    
    p.ExternalTicketOpen <- checkfield fields "ExternalTicketOpen" |> parse_int64
    
    p.ExternalTicketClose <- checkfield fields "ExternalTicketClose" |> parse_int64
    
    p.ExternalTicketPending <- checkfield fields "ExternalTicketPending" |> parse_int64
    
    p.ExternalTicketCancel <- checkfield fields "ExternalTicketCancel" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [TACCT] Structure

let pTACCT__bin (bb:BytesBuilder) (p:pTACCT) =

    
    p.SAC |> BitConverter.GetBytes |> bb.append
    
    p.State |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.TradeType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.RealDemo |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.PnL |> BitConverter.GetBytes |> bb.append
    
    p.Frozen |> BitConverter.GetBytes |> bb.append
    
    p.Leverage |> BitConverter.GetBytes |> bb.append
    
    p.Margin |> BitConverter.GetBytes |> bb.append
    
    p.MarginCallRateWarning |> BitConverter.GetBytes |> bb.append
    
    p.MarginCallRateWarningII |> BitConverter.GetBytes |> bb.append
    
    p.MarginCallRateLiq |> BitConverter.GetBytes |> bb.append
    
    let binPwdTrade = p.PwdTrade |> Encoding.UTF8.GetBytes
    binPwdTrade.Length |> BitConverter.GetBytes |> bb.append
    binPwdTrade |> bb.append
    
    let binPwdReadonly = p.PwdReadonly |> Encoding.UTF8.GetBytes
    binPwdReadonly.Length |> BitConverter.GetBytes |> bb.append
    binPwdReadonly |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append

let TACCT__bin (bb:BytesBuilder) (v:TACCT) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pTACCT__bin bb v.p

let bin__pTACCT (bi:BinIndexed):pTACCT =
    let bin,index = bi

    let p = pTACCT_empty()
    
    p.SAC <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.State <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.TradeType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.RealDemo <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.PnL <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Frozen <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Leverage <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Margin <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.MarginCallRateWarning <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.MarginCallRateWarningII <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.MarginCallRateLiq <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_PwdTrade = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.PwdTrade <- Encoding.UTF8.GetString(bin,index.Value,count_PwdTrade)
    index.Value <- index.Value + count_PwdTrade
    
    let count_PwdReadonly = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.PwdReadonly <- Encoding.UTF8.GetString(bin,index.Value,count_PwdReadonly)
    index.Value <- index.Value + count_PwdReadonly
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p

let bin__TACCT (bi:BinIndexed):TACCT =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pTACCT bi }

let pTACCT__json (p:pTACCT) =

    [|
        ("SAC",p.SAC.ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("TradeType",(p.TradeType |> EnumToValue).ToString() |> Json.Num)
        ("RealDemo",(p.RealDemo |> EnumToValue).ToString() |> Json.Num)
        ("PnL",p.PnL.ToString() |> Json.Num)
        ("Frozen",p.Frozen.ToString() |> Json.Num)
        ("Leverage",p.Leverage.ToString() |> Json.Num)
        ("Margin",p.Margin.ToString() |> Json.Num)
        ("MarginCallRateWarning",p.MarginCallRateWarning.ToString() |> Json.Num)
        ("MarginCallRateWarningII",p.MarginCallRateWarningII.ToString() |> Json.Num)
        ("MarginCallRateLiq",p.MarginCallRateLiq.ToString() |> Json.Num)
        ("PwdTrade",p.PwdTrade |> Json.Str)
        ("PwdReadonly",p.PwdReadonly |> Json.Str)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let TACCT__json (v:TACCT) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("SAC",p.SAC.ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("TradeType",(p.TradeType |> EnumToValue).ToString() |> Json.Num)
        ("RealDemo",(p.RealDemo |> EnumToValue).ToString() |> Json.Num)
        ("PnL",p.PnL.ToString() |> Json.Num)
        ("Frozen",p.Frozen.ToString() |> Json.Num)
        ("Leverage",p.Leverage.ToString() |> Json.Num)
        ("Margin",p.Margin.ToString() |> Json.Num)
        ("MarginCallRateWarning",p.MarginCallRateWarning.ToString() |> Json.Num)
        ("MarginCallRateWarningII",p.MarginCallRateWarningII.ToString() |> Json.Num)
        ("MarginCallRateLiq",p.MarginCallRateLiq.ToString() |> Json.Num)
        ("PwdTrade",p.PwdTrade |> Json.Str)
        ("PwdReadonly",p.PwdReadonly |> Json.Str)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let TACCT__jsonTbw (w:TextBlockWriter) (v:TACCT) =
    json__str w (TACCT__json v)

let TACCT__jsonStr (v:TACCT) =
    (TACCT__json v) |> json__strFinal


let json__pTACCTo (json:Json):pTACCT option =
    let fields = json |> json__items

    let p = pTACCT_empty()
    
    p.SAC <- checkfield fields "SAC" |> parse_int64
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.TradeType <- checkfield fields "TradeType" |> parse_int32 |> EnumOfValue
    
    p.RealDemo <- checkfield fields "RealDemo" |> parse_int32 |> EnumOfValue
    
    p.PnL <- checkfield fields "PnL" |> parse_float
    
    p.Frozen <- checkfield fields "Frozen" |> parse_float
    
    p.Leverage <- checkfield fields "Leverage" |> parse_float
    
    p.Margin <- checkfield fields "Margin" |> parse_float
    
    p.MarginCallRateWarning <- checkfield fields "MarginCallRateWarning" |> parse_float
    
    p.MarginCallRateWarningII <- checkfield fields "MarginCallRateWarningII" |> parse_float
    
    p.MarginCallRateLiq <- checkfield fields "MarginCallRateLiq" |> parse_float
    
    p.PwdTrade <- checkfieldz fields "PwdTrade" 64
    
    p.PwdReadonly <- checkfieldz fields "PwdReadonly" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p |> Some
    

let json__TACCTo (json:Json):TACCT option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pTACCT_empty()
    
    p.SAC <- checkfield fields "SAC" |> parse_int64
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.TradeType <- checkfield fields "TradeType" |> parse_int32 |> EnumOfValue
    
    p.RealDemo <- checkfield fields "RealDemo" |> parse_int32 |> EnumOfValue
    
    p.PnL <- checkfield fields "PnL" |> parse_float
    
    p.Frozen <- checkfield fields "Frozen" |> parse_float
    
    p.Leverage <- checkfield fields "Leverage" |> parse_float
    
    p.Margin <- checkfield fields "Margin" |> parse_float
    
    p.MarginCallRateWarning <- checkfield fields "MarginCallRateWarning" |> parse_float
    
    p.MarginCallRateWarningII <- checkfield fields "MarginCallRateWarningII" |> parse_float
    
    p.MarginCallRateLiq <- checkfield fields "MarginCallRateLiq" |> parse_float
    
    p.PwdTrade <- checkfieldz fields "PwdTrade" 64
    
    p.PwdReadonly <- checkfieldz fields "PwdReadonly" 64
    
    p.Desc <- checkfield fields "Desc"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [BOOKMARK] Structure

let pBOOKMARK__bin (bb:BytesBuilder) (p:pBOOKMARK) =

    
    p.Agent |> BitConverter.GetBytes |> bb.append
    
    p.EndUser |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.BookmarkList |> BitConverter.GetBytes |> bb.append
    
    let binNotes = p.Notes |> Encoding.UTF8.GetBytes
    binNotes.Length |> BitConverter.GetBytes |> bb.append
    binNotes |> bb.append
    
    let binPath = p.Path |> Encoding.UTF8.GetBytes
    binPath.Length |> BitConverter.GetBytes |> bb.append
    binPath |> bb.append
    
    let binGroup = p.Group |> Encoding.UTF8.GetBytes
    binGroup.Length |> BitConverter.GetBytes |> bb.append
    binGroup |> bb.append
    
    p.Type |> BitConverter.GetBytes |> bb.append

let BOOKMARK__bin (bb:BytesBuilder) (v:BOOKMARK) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pBOOKMARK__bin bb v.p

let bin__pBOOKMARK (bi:BinIndexed):pBOOKMARK =
    let bin,index = bi

    let p = pBOOKMARK_empty()
    
    p.Agent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.BookmarkList <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Notes = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Notes <- Encoding.UTF8.GetString(bin,index.Value,count_Notes)
    index.Value <- index.Value + count_Notes
    
    let count_Path = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Path <- Encoding.UTF8.GetString(bin,index.Value,count_Path)
    index.Value <- index.Value + count_Path
    
    let count_Group = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Group <- Encoding.UTF8.GetString(bin,index.Value,count_Group)
    index.Value <- index.Value + count_Group
    
    p.Type <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__BOOKMARK (bi:BinIndexed):BOOKMARK =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pBOOKMARK bi }

let pBOOKMARK__json (p:pBOOKMARK) =

    [|
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("BookmarkList",p.BookmarkList.ToString() |> Json.Num)
        ("Notes",p.Notes |> Json.Str)
        ("Path",p.Path |> Json.Str)
        ("Group",p.Group |> Json.Str)
        ("Type",p.Type.ToString() |> Json.Num) |]
    |> Json.Braket

let BOOKMARK__json (v:BOOKMARK) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("BookmarkList",p.BookmarkList.ToString() |> Json.Num)
        ("Notes",p.Notes |> Json.Str)
        ("Path",p.Path |> Json.Str)
        ("Group",p.Group |> Json.Str)
        ("Type",p.Type.ToString() |> Json.Num) |]
    |> Json.Braket

let BOOKMARK__jsonTbw (w:TextBlockWriter) (v:BOOKMARK) =
    json__str w (BOOKMARK__json v)

let BOOKMARK__jsonStr (v:BOOKMARK) =
    (BOOKMARK__json v) |> json__strFinal


let json__pBOOKMARKo (json:Json):pBOOKMARK option =
    let fields = json |> json__items

    let p = pBOOKMARK_empty()
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.BookmarkList <- checkfield fields "BookmarkList" |> parse_int64
    
    p.Notes <- checkfield fields "Notes"
    
    p.Path <- checkfield fields "Path"
    
    p.Group <- checkfieldz fields "Group" 64
    
    p.Type <- checkfield fields "Type" |> parse_int64
    
    p |> Some
    

let json__BOOKMARKo (json:Json):BOOKMARK option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pBOOKMARK_empty()
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.BookmarkList <- checkfield fields "BookmarkList" |> parse_int64
    
    p.Notes <- checkfield fields "Notes"
    
    p.Path <- checkfield fields "Path"
    
    p.Group <- checkfieldz fields "Group" 64
    
    p.Type <- checkfield fields "Type" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [SBL] Structure

let pSBL__bin (bb:BytesBuilder) (p:pSBL) =

    
    p.EndUser |> BitConverter.GetBytes |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    let binBackground = p.Background |> Encoding.UTF8.GetBytes
    binBackground.Length |> BitConverter.GetBytes |> bb.append
    binBackground |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    p.Privacy |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Moment |> BitConverter.GetBytes |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append

let SBL__bin (bb:BytesBuilder) (v:SBL) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pSBL__bin bb v.p

let bin__pSBL (bi:BinIndexed):pSBL =
    let bin,index = bi

    let p = pSBL_empty()
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    let count_Background = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Background <- Encoding.UTF8.GetString(bin,index.Value,count_Background)
    index.Value <- index.Value + count_Background
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p.Privacy <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Moment <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__SBL (bi:BinIndexed):SBL =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pSBL bi }

let pSBL__json (p:pSBL) =

    [|
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("Background",p.Background |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Privacy",(p.Privacy |> EnumToValue).ToString() |> Json.Num)
        ("Moment",p.Moment.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let SBL__json (v:SBL) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("Background",p.Background |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Privacy",(p.Privacy |> EnumToValue).ToString() |> Json.Num)
        ("Moment",p.Moment.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let SBL__jsonTbw (w:TextBlockWriter) (v:SBL) =
    json__str w (SBL__json v)

let SBL__jsonStr (v:SBL) =
    (SBL__json v) |> json__strFinal


let json__pSBLo (json:Json):pSBL option =
    let fields = json |> json__items

    let p = pSBL_empty()
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Background <- checkfieldz fields "Background" 256
    
    p.Desc <- checkfield fields "Desc"
    
    p.Privacy <- checkfield fields "Privacy" |> parse_int32 |> EnumOfValue
    
    p.Moment <- checkfield fields "Moment" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__SBLo (json:Json):SBL option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pSBL_empty()
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Background <- checkfieldz fields "Background" 256
    
    p.Desc <- checkfield fields "Desc"
    
    p.Privacy <- checkfield fields "Privacy" |> parse_int32 |> EnumOfValue
    
    p.Moment <- checkfield fields "Moment" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [FOLLOW] Structure

let pFOLLOW__bin (bb:BytesBuilder) (p:pFOLLOW) =

    
    p.EndUser |> BitConverter.GetBytes |> bb.append
    
    p.Followee |> BitConverter.GetBytes |> bb.append
    
    p.FollowType |> EnumToValue |> BitConverter.GetBytes |> bb.append

let FOLLOW__bin (bb:BytesBuilder) (v:FOLLOW) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pFOLLOW__bin bb v.p

let bin__pFOLLOW (bi:BinIndexed):pFOLLOW =
    let bin,index = bi

    let p = pFOLLOW_empty()
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Followee <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.FollowType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__FOLLOW (bi:BinIndexed):FOLLOW =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pFOLLOW bi }

let pFOLLOW__json (p:pFOLLOW) =

    [|
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Followee",p.Followee.ToString() |> Json.Num)
        ("FollowType",(p.FollowType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let FOLLOW__json (v:FOLLOW) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Followee",p.Followee.ToString() |> Json.Num)
        ("FollowType",(p.FollowType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let FOLLOW__jsonTbw (w:TextBlockWriter) (v:FOLLOW) =
    json__str w (FOLLOW__json v)

let FOLLOW__jsonStr (v:FOLLOW) =
    (FOLLOW__json v) |> json__strFinal


let json__pFOLLOWo (json:Json):pFOLLOW option =
    let fields = json |> json__items

    let p = pFOLLOW_empty()
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Followee <- checkfield fields "Followee" |> parse_int64
    
    p.FollowType <- checkfield fields "FollowType" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__FOLLOWo (json:Json):FOLLOW option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pFOLLOW_empty()
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Followee <- checkfield fields "Followee" |> parse_int64
    
    p.FollowType <- checkfield fields "FollowType" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [MOMENT] Structure

let pMOMENT__bin (bb:BytesBuilder) (p:pMOMENT) =

    
    p.Agent |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    let binTitle = p.Title |> Encoding.UTF8.GetBytes
    binTitle.Length |> BitConverter.GetBytes |> bb.append
    binTitle |> bb.append
    
    let binSummary = p.Summary |> Encoding.UTF8.GetBytes
    binSummary.Length |> BitConverter.GetBytes |> bb.append
    binSummary |> bb.append
    
    let binFullText = p.FullText |> Encoding.UTF8.GetBytes
    binFullText.Length |> BitConverter.GetBytes |> bb.append
    binFullText |> bb.append
    
    let binPreviewImgUrl = p.PreviewImgUrl |> Encoding.UTF8.GetBytes
    binPreviewImgUrl.Length |> BitConverter.GetBytes |> bb.append
    binPreviewImgUrl |> bb.append
    
    let binLink = p.Link |> Encoding.UTF8.GetBytes
    binLink.Length |> BitConverter.GetBytes |> bb.append
    binLink |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Question |> BitConverter.GetBytes |> bb.append
    
    p.State |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Group |> BitConverter.GetBytes |> bb.append
    
    p.AutoTranslate |> BitConverter.GetBytes |> bb.append
    
    p.OriginalMoment |> BitConverter.GetBytes |> bb.append
    
    p.Postedat.Ticks |> BitConverter.GetBytes |> bb.append
    
    p.ContentBind |> BitConverter.GetBytes |> bb.append
    
    let binKeywords = p.Keywords |> Encoding.UTF8.GetBytes
    binKeywords.Length |> BitConverter.GetBytes |> bb.append
    binKeywords |> bb.append
    
    p.Sticky |> BitConverter.GetBytes |> bb.append
    
    p.Protection |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.MediaType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binUrlOriginal = p.UrlOriginal |> Encoding.UTF8.GetBytes
    binUrlOriginal.Length |> BitConverter.GetBytes |> bb.append
    binUrlOriginal |> bb.append
    
    let binOID = p.OID |> Encoding.UTF8.GetBytes
    binOID.Length |> BitConverter.GetBytes |> bb.append
    binOID |> bb.append
    
    p.PostType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binAudioUrl = p.AudioUrl |> Encoding.UTF8.GetBytes
    binAudioUrl.Length |> BitConverter.GetBytes |> bb.append
    binAudioUrl |> bb.append

let MOMENT__bin (bb:BytesBuilder) (v:MOMENT) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pMOMENT__bin bb v.p

let bin__pMOMENT (bi:BinIndexed):pMOMENT =
    let bin,index = bi

    let p = pMOMENT_empty()
    
    p.Agent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Title = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Title <- Encoding.UTF8.GetString(bin,index.Value,count_Title)
    index.Value <- index.Value + count_Title
    
    let count_Summary = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Summary <- Encoding.UTF8.GetString(bin,index.Value,count_Summary)
    index.Value <- index.Value + count_Summary
    
    let count_FullText = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.FullText <- Encoding.UTF8.GetString(bin,index.Value,count_FullText)
    index.Value <- index.Value + count_FullText
    
    let count_PreviewImgUrl = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.PreviewImgUrl <- Encoding.UTF8.GetString(bin,index.Value,count_PreviewImgUrl)
    index.Value <- index.Value + count_PreviewImgUrl
    
    let count_Link = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Link <- Encoding.UTF8.GetString(bin,index.Value,count_Link)
    index.Value <- index.Value + count_Link
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Question <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.State <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Group <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.AutoTranslate <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.OriginalMoment <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Postedat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p.ContentBind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Keywords = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Keywords <- Encoding.UTF8.GetString(bin,index.Value,count_Keywords)
    index.Value <- index.Value + count_Keywords
    
    p.Sticky <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Protection <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.MediaType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_UrlOriginal = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.UrlOriginal <- Encoding.UTF8.GetString(bin,index.Value,count_UrlOriginal)
    index.Value <- index.Value + count_UrlOriginal
    
    let count_OID = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OID <- Encoding.UTF8.GetString(bin,index.Value,count_OID)
    index.Value <- index.Value + count_OID
    
    p.PostType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_AudioUrl = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.AudioUrl <- Encoding.UTF8.GetString(bin,index.Value,count_AudioUrl)
    index.Value <- index.Value + count_AudioUrl
    
    p

let bin__MOMENT (bi:BinIndexed):MOMENT =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pMOMENT bi }

let pMOMENT__json (p:pMOMENT) =

    [|
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Title",p.Title |> Json.Str)
        ("Summary",p.Summary |> Json.Str)
        ("FullText",p.FullText |> Json.Str)
        ("PreviewImgUrl",p.PreviewImgUrl |> Json.Str)
        ("Link",p.Link |> Json.Str)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Question",p.Question.ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("Group",p.Group.ToString() |> Json.Num)
        ("AutoTranslate",p.AutoTranslate.ToString() |> Json.Num)
        ("OriginalMoment",p.OriginalMoment.ToString() |> Json.Num)
        ("Postedat",(p.Postedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("ContentBind",p.ContentBind.ToString() |> Json.Num)
        ("Keywords",p.Keywords |> Json.Str)
        ("Sticky",p.Sticky.ToString() |> Json.Num)
        ("Protection",(p.Protection |> EnumToValue).ToString() |> Json.Num)
        ("MediaType",(p.MediaType |> EnumToValue).ToString() |> Json.Num)
        ("UrlOriginal",p.UrlOriginal |> Json.Str)
        ("OID",p.OID |> Json.Str)
        ("PostType",(p.PostType |> EnumToValue).ToString() |> Json.Num)
        ("AudioUrl",p.AudioUrl |> Json.Str) |]
    |> Json.Braket

let MOMENT__json (v:MOMENT) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("Title",p.Title |> Json.Str)
        ("Summary",p.Summary |> Json.Str)
        ("FullText",p.FullText |> Json.Str)
        ("PreviewImgUrl",p.PreviewImgUrl |> Json.Str)
        ("Link",p.Link |> Json.Str)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Question",p.Question.ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("Group",p.Group.ToString() |> Json.Num)
        ("AutoTranslate",p.AutoTranslate.ToString() |> Json.Num)
        ("OriginalMoment",p.OriginalMoment.ToString() |> Json.Num)
        ("Postedat",(p.Postedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("ContentBind",p.ContentBind.ToString() |> Json.Num)
        ("Keywords",p.Keywords |> Json.Str)
        ("Sticky",p.Sticky.ToString() |> Json.Num)
        ("Protection",(p.Protection |> EnumToValue).ToString() |> Json.Num)
        ("MediaType",(p.MediaType |> EnumToValue).ToString() |> Json.Num)
        ("UrlOriginal",p.UrlOriginal |> Json.Str)
        ("OID",p.OID |> Json.Str)
        ("PostType",(p.PostType |> EnumToValue).ToString() |> Json.Num)
        ("AudioUrl",p.AudioUrl |> Json.Str) |]
    |> Json.Braket

let MOMENT__jsonTbw (w:TextBlockWriter) (v:MOMENT) =
    json__str w (MOMENT__json v)

let MOMENT__jsonStr (v:MOMENT) =
    (MOMENT__json v) |> json__strFinal


let json__pMOMENTo (json:Json):pMOMENT option =
    let fields = json |> json__items

    let p = pMOMENT_empty()
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Title <- checkfield fields "Title"
    
    p.Summary <- checkfield fields "Summary"
    
    p.FullText <- checkfield fields "FullText"
    
    p.PreviewImgUrl <- checkfield fields "PreviewImgUrl"
    
    p.Link <- checkfield fields "Link"
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Question <- checkfield fields "Question" |> parse_int64
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.Group <- checkfield fields "Group" |> parse_int64
    
    p.AutoTranslate <- checkfield fields "AutoTranslate" |> parse_int64
    
    p.OriginalMoment <- checkfield fields "OriginalMoment" |> parse_int64
    
    p.Postedat <- checkfield fields "Postedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.ContentBind <- checkfield fields "ContentBind" |> parse_int64
    
    p.Keywords <- checkfield fields "Keywords"
    
    p.Sticky <- checkfield fields "Sticky" |> parse_int64
    
    p.Protection <- checkfield fields "Protection" |> parse_int32 |> EnumOfValue
    
    p.MediaType <- checkfield fields "MediaType" |> parse_int32 |> EnumOfValue
    
    p.UrlOriginal <- checkfield fields "UrlOriginal"
    
    p.OID <- checkfieldz fields "OID" 256
    
    p.PostType <- checkfield fields "PostType" |> parse_int32 |> EnumOfValue
    
    p.AudioUrl <- checkfield fields "AudioUrl"
    
    p |> Some
    

let json__MOMENTo (json:Json):MOMENT option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pMOMENT_empty()
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.Title <- checkfield fields "Title"
    
    p.Summary <- checkfield fields "Summary"
    
    p.FullText <- checkfield fields "FullText"
    
    p.PreviewImgUrl <- checkfield fields "PreviewImgUrl"
    
    p.Link <- checkfield fields "Link"
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Question <- checkfield fields "Question" |> parse_int64
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.Group <- checkfield fields "Group" |> parse_int64
    
    p.AutoTranslate <- checkfield fields "AutoTranslate" |> parse_int64
    
    p.OriginalMoment <- checkfield fields "OriginalMoment" |> parse_int64
    
    p.Postedat <- checkfield fields "Postedat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.ContentBind <- checkfield fields "ContentBind" |> parse_int64
    
    p.Keywords <- checkfield fields "Keywords"
    
    p.Sticky <- checkfield fields "Sticky" |> parse_int64
    
    p.Protection <- checkfield fields "Protection" |> parse_int32 |> EnumOfValue
    
    p.MediaType <- checkfield fields "MediaType" |> parse_int32 |> EnumOfValue
    
    p.UrlOriginal <- checkfield fields "UrlOriginal"
    
    p.OID <- checkfieldz fields "OID" 256
    
    p.PostType <- checkfield fields "PostType" |> parse_int32 |> EnumOfValue
    
    p.AudioUrl <- checkfield fields "AudioUrl"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [LOG] Structure

let pLOG__bin (bb:BytesBuilder) (p:pLOG) =

    
    let binLocation = p.Location |> Encoding.UTF8.GetBytes
    binLocation.Length |> BitConverter.GetBytes |> bb.append
    binLocation |> bb.append
    
    let binContent = p.Content |> Encoding.UTF8.GetBytes
    binContent.Length |> BitConverter.GetBytes |> bb.append
    binContent |> bb.append
    
    let binSql = p.Sql |> Encoding.UTF8.GetBytes
    binSql.Length |> BitConverter.GetBytes |> bb.append
    binSql |> bb.append

let LOG__bin (bb:BytesBuilder) (v:LOG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pLOG__bin bb v.p

let bin__pLOG (bi:BinIndexed):pLOG =
    let bin,index = bi

    let p = pLOG_empty()
    
    let count_Location = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Location <- Encoding.UTF8.GetString(bin,index.Value,count_Location)
    index.Value <- index.Value + count_Location
    
    let count_Content = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Content <- Encoding.UTF8.GetString(bin,index.Value,count_Content)
    index.Value <- index.Value + count_Content
    
    let count_Sql = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Sql <- Encoding.UTF8.GetString(bin,index.Value,count_Sql)
    index.Value <- index.Value + count_Sql
    
    p

let bin__LOG (bi:BinIndexed):LOG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pLOG bi }

let pLOG__json (p:pLOG) =

    [|
        ("Location",p.Location |> Json.Str)
        ("Content",p.Content |> Json.Str)
        ("Sql",p.Sql |> Json.Str) |]
    |> Json.Braket

let LOG__json (v:LOG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Location",p.Location |> Json.Str)
        ("Content",p.Content |> Json.Str)
        ("Sql",p.Sql |> Json.Str) |]
    |> Json.Braket

let LOG__jsonTbw (w:TextBlockWriter) (v:LOG) =
    json__str w (LOG__json v)

let LOG__jsonStr (v:LOG) =
    (LOG__json v) |> json__strFinal


let json__pLOGo (json:Json):pLOG option =
    let fields = json |> json__items

    let p = pLOG_empty()
    
    p.Location <- checkfield fields "Location"
    
    p.Content <- checkfield fields "Content"
    
    p.Sql <- checkfield fields "Sql"
    
    p |> Some
    

let json__LOGo (json:Json):LOG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pLOG_empty()
    
    p.Location <- checkfield fields "Location"
    
    p.Content <- checkfield fields "Content"
    
    p.Sql <- checkfield fields "Sql"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [FUND] Structure

let pFUND__bin (bb:BytesBuilder) (p:pFUND) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append

let FUND__bin (bb:BytesBuilder) (v:FUND) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pFUND__bin bb v.p

let bin__pFUND (bi:BinIndexed):pFUND =
    let bin,index = bi

    let p = pFUND_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__FUND (bi:BinIndexed):FUND =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pFUND bi }

let pFUND__json (p:pFUND) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let FUND__json (v:FUND) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let FUND__jsonTbw (w:TextBlockWriter) (v:FUND) =
    json__str w (FUND__json v)

let FUND__jsonStr (v:FUND) =
    (FUND__json v) |> json__strFinal


let json__pFUNDo (json:Json):pFUND option =
    let fields = json |> json__items

    let p = pFUND_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__FUNDo (json:Json):FUND option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pFUND_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [PORTFOLIO] Structure

let pPORTFOLIO__bin (bb:BytesBuilder) (p:pPORTFOLIO) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    p.Fund |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append

let PORTFOLIO__bin (bb:BytesBuilder) (v:PORTFOLIO) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pPORTFOLIO__bin bb v.p

let bin__pPORTFOLIO (bi:BinIndexed):pPORTFOLIO =
    let bin,index = bi

    let p = pPORTFOLIO_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p.Fund <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__PORTFOLIO (bi:BinIndexed):PORTFOLIO =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pPORTFOLIO bi }

let pPORTFOLIO__json (p:pPORTFOLIO) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Fund",p.Fund.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let PORTFOLIO__json (v:PORTFOLIO) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Fund",p.Fund.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let PORTFOLIO__jsonTbw (w:TextBlockWriter) (v:PORTFOLIO) =
    json__str w (PORTFOLIO__json v)

let PORTFOLIO__jsonStr (v:PORTFOLIO) =
    (PORTFOLIO__json v) |> json__strFinal


let json__pPORTFOLIOo (json:Json):pPORTFOLIO option =
    let fields = json |> json__items

    let p = pPORTFOLIO_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Fund <- checkfield fields "Fund" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__PORTFOLIOo (json:Json):PORTFOLIO option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pPORTFOLIO_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Fund <- checkfield fields "Fund" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [TRADER] Structure

let pTRADER__bin (bb:BytesBuilder) (p:pTRADER) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    p.Fund |> BitConverter.GetBytes |> bb.append
    
    p.EndUser |> BitConverter.GetBytes |> bb.append

let TRADER__bin (bb:BytesBuilder) (v:TRADER) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pTRADER__bin bb v.p

let bin__pTRADER (bi:BinIndexed):pTRADER =
    let bin,index = bi

    let p = pTRADER_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p.Fund <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__TRADER (bi:BinIndexed):TRADER =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pTRADER bi }

let pTRADER__json (p:pTRADER) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Fund",p.Fund.ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num) |]
    |> Json.Braket

let TRADER__json (v:TRADER) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Fund",p.Fund.ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num) |]
    |> Json.Braket

let TRADER__jsonTbw (w:TextBlockWriter) (v:TRADER) =
    json__str w (TRADER__json v)

let TRADER__jsonStr (v:TRADER) =
    (TRADER__json v) |> json__strFinal


let json__pTRADERo (json:Json):pTRADER option =
    let fields = json |> json__items

    let p = pTRADER_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Fund <- checkfield fields "Fund" |> parse_int64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p |> Some
    

let json__TRADERo (json:Json):TRADER option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pTRADER_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Fund <- checkfield fields "Fund" |> parse_int64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

let mutable conn = ""

let db__pADDRESS(line:Object[]): pADDRESS =
    let p = pADDRESS_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Bind <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.Line1 <- string(line.[7]).TrimEnd()
    p.Line2 <- string(line.[8]).TrimEnd()
    p.State <- string(line.[9]).TrimEnd()
    p.County <- string(line.[10]).TrimEnd()
    p.Town <- string(line.[11]).TrimEnd()
    p.Contact <- string(line.[12]).TrimEnd()
    p.Tel <- string(line.[13]).TrimEnd()
    p.Email <- string(line.[14]).TrimEnd()
    p.Zip <- string(line.[15]).TrimEnd()
    p.City <- if Convert.IsDBNull(line.[16]) then 0L else line.[16] :?> int64
    p.Country <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.Remarks <- string(line.[18]).TrimEnd()

    p

let pADDRESS__sps (p:pADDRESS) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("Type", p.Type)
    new SqlParameter("Line1", p.Line1)
    new SqlParameter("Line2", p.Line2)
    new SqlParameter("State", p.State)
    new SqlParameter("County", p.County)
    new SqlParameter("Town", p.Town)
    new SqlParameter("Contact", p.Contact)
    new SqlParameter("Tel", p.Tel)
    new SqlParameter("Email", p.Email)
    new SqlParameter("Zip", p.Zip)
    new SqlParameter("City", p.City)
    new SqlParameter("Country", p.Country)
    new SqlParameter("Remarks", p.Remarks) |]

let db__ADDRESS = db__Rcd db__pADDRESS

let ADDRESS_wrapper item: ADDRESS =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pADDRESS_clone (p:pADDRESS): pADDRESS = {
    Caption = p.Caption
    Bind = p.Bind
    Type = p.Type
    Line1 = p.Line1
    Line2 = p.Line2
    State = p.State
    County = p.County
    Town = p.Town
    Contact = p.Contact
    Tel = p.Tel
    Email = p.Email
    Zip = p.Zip
    City = p.City
    Country = p.Country
    Remarks = p.Remarks }

let ADDRESS_update_transaction output (updater,suc,fail) (rcd:ADDRESS) =
    let rollback_p = rcd.p |> pADDRESS_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,ADDRESS_table,ADDRESS_sql_update,pADDRESS__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let ADDRESS_update output (rcd:ADDRESS) =
    rcd
    |> ADDRESS_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let ADDRESS_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment ADDRESS_id
    let ctime = DateTime.UtcNow
    match create (conn,output,ADDRESS_table,pADDRESS__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> ADDRESS_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let ADDRESS_create output p =
    ADDRESS_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__ADDRESSo id: ADDRESS option = id__rcd(conn,ADDRESS_fieldorders,ADDRESS_table,db__ADDRESS) id

let ADDRESS_metadata = {
    fieldorders = ADDRESS_fieldorders
    db__rcd = db__ADDRESS 
    wrapper = ADDRESS_wrapper
    sps = pADDRESS__sps
    id = ADDRESS_id
    id__rcdo = id__ADDRESSo
    clone = pADDRESS_clone
    empty__p = pADDRESS_empty
    rcd__bin = ADDRESS__bin
    bin__rcd = bin__ADDRESS
    sql_update = ADDRESS_sql_update
    rcd_update = ADDRESS_update
    table = ADDRESS_table
    shorthand = "address" }

let ADDRESSTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Address' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Address ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Bind]
    ,[Type]
    ,[Line1]
    ,[Line2]
    ,[State]
    ,[County]
    ,[Town]
    ,[Contact]
    ,[Tel]
    ,[Email]
    ,[Zip]
    ,[City]
    ,[Country]
    ,[Remarks])
    END
    """


let db__pAIRPORT(line:Object[]): pAIRPORT =
    let p = pAIRPORT_empty()

    p.Code3IATA <- string(line.[4]).TrimEnd()
    p.Code4ICAO <- string(line.[5]).TrimEnd()
    p.Caption <- string(line.[6]).TrimEnd()
    p.CaptionEn <- string(line.[7]).TrimEnd()
    p.Country <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.City <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.IsMetropolitan <- if Convert.IsDBNull(line.[10]) then false else line.[10] :?> bool

    p

let pAIRPORT__sps (p:pAIRPORT) = [|
    new SqlParameter("Code3IATA", p.Code3IATA)
    new SqlParameter("Code4ICAO", p.Code4ICAO)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("CaptionEn", p.CaptionEn)
    new SqlParameter("Country", p.Country)
    new SqlParameter("City", p.City)
    new SqlParameter("IsMetropolitan", p.IsMetropolitan) |]

let db__AIRPORT = db__Rcd db__pAIRPORT

let AIRPORT_wrapper item: AIRPORT =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pAIRPORT_clone (p:pAIRPORT): pAIRPORT = {
    Code3IATA = p.Code3IATA
    Code4ICAO = p.Code4ICAO
    Caption = p.Caption
    CaptionEn = p.CaptionEn
    Country = p.Country
    City = p.City
    IsMetropolitan = p.IsMetropolitan }

let AIRPORT_update_transaction output (updater,suc,fail) (rcd:AIRPORT) =
    let rollback_p = rcd.p |> pAIRPORT_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,AIRPORT_table,AIRPORT_sql_update,pAIRPORT__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let AIRPORT_update output (rcd:AIRPORT) =
    rcd
    |> AIRPORT_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let AIRPORT_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment AIRPORT_id
    let ctime = DateTime.UtcNow
    match create (conn,output,AIRPORT_table,pAIRPORT__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> AIRPORT_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let AIRPORT_create output p =
    AIRPORT_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__AIRPORTo id: AIRPORT option = id__rcd(conn,AIRPORT_fieldorders,AIRPORT_table,db__AIRPORT) id

let AIRPORT_metadata = {
    fieldorders = AIRPORT_fieldorders
    db__rcd = db__AIRPORT 
    wrapper = AIRPORT_wrapper
    sps = pAIRPORT__sps
    id = AIRPORT_id
    id__rcdo = id__AIRPORTo
    clone = pAIRPORT_clone
    empty__p = pAIRPORT_empty
    rcd__bin = AIRPORT__bin
    bin__rcd = bin__AIRPORT
    sql_update = AIRPORT_sql_update
    rcd_update = AIRPORT_update
    table = AIRPORT_table
    shorthand = "airport" }

let AIRPORTTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Airport' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Airport ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code3IATA]
    ,[Code4ICAO]
    ,[Caption]
    ,[CaptionEn]
    ,[Country]
    ,[City]
    ,[IsMetropolitan])
    END
    """


let db__pBIZ(line:Object[]): pBIZ =
    let p = pBIZ_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Parent <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.BasicAcct <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Desc <- string(line.[8]).TrimEnd()
    p.Website <- string(line.[9]).TrimEnd()
    p.Icon <- string(line.[10]).TrimEnd()
    p.City <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Country <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.Lang <- if Convert.IsDBNull(line.[13]) then 0L else line.[13] :?> int64
    p.IsSocial <- if Convert.IsDBNull(line.[14]) then false else line.[14] :?> bool
    p.IsCmsSource <- if Convert.IsDBNull(line.[15]) then false else line.[15] :?> bool
    p.IsPay <- if Convert.IsDBNull(line.[16]) then false else line.[16] :?> bool
    p.MomentLatest <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.CountFollowers <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.CountFollows <- if Convert.IsDBNull(line.[19]) then 0L else line.[19] :?> int64
    p.CountMoments <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.CountViews <- if Convert.IsDBNull(line.[21]) then 0L else line.[21] :?> int64
    p.CountComments <- if Convert.IsDBNull(line.[22]) then 0L else line.[22] :?> int64
    p.CountThumbUps <- if Convert.IsDBNull(line.[23]) then 0L else line.[23] :?> int64
    p.CountThumbDns <- if Convert.IsDBNull(line.[24]) then 0L else line.[24] :?> int64
    p.IsCrawling <- if Convert.IsDBNull(line.[25]) then false else line.[25] :?> bool
    p.IsGSeries <- if Convert.IsDBNull(line.[26]) then false else line.[26] :?> bool
    p.RemarksCentral <- string(line.[27]).TrimEnd()
    p.Agent <- if Convert.IsDBNull(line.[28]) then 0L else line.[28] :?> int64
    p.SiteCats <- string(line.[29]).TrimEnd()
    p.ConfiguredCats <- string(line.[30]).TrimEnd()

    p

let pBIZ__sps (p:pBIZ) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Parent", p.Parent)
    new SqlParameter("BasicAcct", p.BasicAcct)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Website", p.Website)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("City", p.City)
    new SqlParameter("Country", p.Country)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("IsSocial", p.IsSocial)
    new SqlParameter("IsCmsSource", p.IsCmsSource)
    new SqlParameter("IsPay", p.IsPay)
    new SqlParameter("MomentLatest", p.MomentLatest)
    new SqlParameter("CountFollowers", p.CountFollowers)
    new SqlParameter("CountFollows", p.CountFollows)
    new SqlParameter("CountMoments", p.CountMoments)
    new SqlParameter("CountViews", p.CountViews)
    new SqlParameter("CountComments", p.CountComments)
    new SqlParameter("CountThumbUps", p.CountThumbUps)
    new SqlParameter("CountThumbDns", p.CountThumbDns)
    new SqlParameter("IsCrawling", p.IsCrawling)
    new SqlParameter("IsGSeries", p.IsGSeries)
    new SqlParameter("RemarksCentral", p.RemarksCentral)
    new SqlParameter("Agent", p.Agent)
    new SqlParameter("SiteCats", p.SiteCats)
    new SqlParameter("ConfiguredCats", p.ConfiguredCats) |]

let db__BIZ = db__Rcd db__pBIZ

let BIZ_wrapper item: BIZ =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pBIZ_clone (p:pBIZ): pBIZ = {
    Code = p.Code
    Caption = p.Caption
    Parent = p.Parent
    BasicAcct = p.BasicAcct
    Desc = p.Desc
    Website = p.Website
    Icon = p.Icon
    City = p.City
    Country = p.Country
    Lang = p.Lang
    IsSocial = p.IsSocial
    IsCmsSource = p.IsCmsSource
    IsPay = p.IsPay
    MomentLatest = p.MomentLatest
    CountFollowers = p.CountFollowers
    CountFollows = p.CountFollows
    CountMoments = p.CountMoments
    CountViews = p.CountViews
    CountComments = p.CountComments
    CountThumbUps = p.CountThumbUps
    CountThumbDns = p.CountThumbDns
    IsCrawling = p.IsCrawling
    IsGSeries = p.IsGSeries
    RemarksCentral = p.RemarksCentral
    Agent = p.Agent
    SiteCats = p.SiteCats
    ConfiguredCats = p.ConfiguredCats }

let BIZ_update_transaction output (updater,suc,fail) (rcd:BIZ) =
    let rollback_p = rcd.p |> pBIZ_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,BIZ_table,BIZ_sql_update,pBIZ__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let BIZ_update output (rcd:BIZ) =
    rcd
    |> BIZ_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let BIZ_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment BIZ_id
    let ctime = DateTime.UtcNow
    match create (conn,output,BIZ_table,pBIZ__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> BIZ_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let BIZ_create output p =
    BIZ_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__BIZo id: BIZ option = id__rcd(conn,BIZ_fieldorders,BIZ_table,db__BIZ) id

let BIZ_metadata = {
    fieldorders = BIZ_fieldorders
    db__rcd = db__BIZ 
    wrapper = BIZ_wrapper
    sps = pBIZ__sps
    id = BIZ_id
    id__rcdo = id__BIZo
    clone = pBIZ_clone
    empty__p = pBIZ_empty
    rcd__bin = BIZ__bin
    bin__rcd = bin__BIZ
    sql_update = BIZ_sql_update
    rcd_update = BIZ_update
    table = BIZ_table
    shorthand = "biz" }

let BIZTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Biz' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Biz ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Caption]
    ,[Parent]
    ,[BasicAcct]
    ,[Desc]
    ,[Website]
    ,[Icon]
    ,[City]
    ,[Country]
    ,[Lang]
    ,[IsSocial]
    ,[IsCmsSource]
    ,[IsPay]
    ,[MomentLatest]
    ,[CountFollowers]
    ,[CountFollows]
    ,[CountMoments]
    ,[CountViews]
    ,[CountComments]
    ,[CountThumbUps]
    ,[CountThumbDns]
    ,[IsCrawling]
    ,[IsGSeries]
    ,[RemarksCentral]
    ,[Agent]
    ,[SiteCats]
    ,[ConfiguredCats])
    END
    """


let db__pCAT(line:Object[]): pCAT =
    let p = pCAT_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Lang <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Zh <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.Parent <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.State <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)

    p

let pCAT__sps (p:pCAT) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("Zh", p.Zh)
    new SqlParameter("Parent", p.Parent)
    new SqlParameter("State", p.State) |]

let db__CAT = db__Rcd db__pCAT

let CAT_wrapper item: CAT =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCAT_clone (p:pCAT): pCAT = {
    Caption = p.Caption
    Lang = p.Lang
    Zh = p.Zh
    Parent = p.Parent
    State = p.State }

let CAT_update_transaction output (updater,suc,fail) (rcd:CAT) =
    let rollback_p = rcd.p |> pCAT_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CAT_table,CAT_sql_update,pCAT__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CAT_update output (rcd:CAT) =
    rcd
    |> CAT_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CAT_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CAT_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CAT_table,pCAT__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CAT_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CAT_create output p =
    CAT_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CATo id: CAT option = id__rcd(conn,CAT_fieldorders,CAT_table,db__CAT) id

let CAT_metadata = {
    fieldorders = CAT_fieldorders
    db__rcd = db__CAT 
    wrapper = CAT_wrapper
    sps = pCAT__sps
    id = CAT_id
    id__rcdo = id__CATo
    clone = pCAT_clone
    empty__p = pCAT_empty
    rcd__bin = CAT__bin
    bin__rcd = bin__CAT
    sql_update = CAT_sql_update
    rcd_update = CAT_update
    table = CAT_table
    shorthand = "cat" }

let CATTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cat' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Cat ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Lang]
    ,[Zh]
    ,[Parent]
    ,[State])
    END
    """


let db__pCITY(line:Object[]): pCITY =
    let p = pCITY_empty()

    p.Name <- string(line.[4]).TrimEnd()
    p.MetropolitanCode3IATA <- string(line.[5]).TrimEnd()
    p.NameEn <- string(line.[6]).TrimEnd()
    p.Country <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Place <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Icon <- string(line.[9]).TrimEnd()
    p.Tel <- string(line.[10]).TrimEnd()

    p

let pCITY__sps (p:pCITY) = [|
    new SqlParameter("Name", p.Name)
    new SqlParameter("MetropolitanCode3IATA", p.MetropolitanCode3IATA)
    new SqlParameter("NameEn", p.NameEn)
    new SqlParameter("Country", p.Country)
    new SqlParameter("Place", p.Place)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("Tel", p.Tel) |]

let db__CITY = db__Rcd db__pCITY

let CITY_wrapper item: CITY =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCITY_clone (p:pCITY): pCITY = {
    Name = p.Name
    MetropolitanCode3IATA = p.MetropolitanCode3IATA
    NameEn = p.NameEn
    Country = p.Country
    Place = p.Place
    Icon = p.Icon
    Tel = p.Tel }

let CITY_update_transaction output (updater,suc,fail) (rcd:CITY) =
    let rollback_p = rcd.p |> pCITY_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CITY_table,CITY_sql_update,pCITY__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CITY_update output (rcd:CITY) =
    rcd
    |> CITY_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CITY_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CITY_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CITY_table,pCITY__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CITY_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CITY_create output p =
    CITY_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CITYo id: CITY option = id__rcd(conn,CITY_fieldorders,CITY_table,db__CITY) id

let CITY_metadata = {
    fieldorders = CITY_fieldorders
    db__rcd = db__CITY 
    wrapper = CITY_wrapper
    sps = pCITY__sps
    id = CITY_id
    id__rcdo = id__CITYo
    clone = pCITY_clone
    empty__p = pCITY_empty
    rcd__bin = CITY__bin
    bin__rcd = bin__CITY
    sql_update = CITY_sql_update
    rcd_update = CITY_update
    table = CITY_table
    shorthand = "city" }

let CITYTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_City' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_City ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Name]
    ,[MetropolitanCode3IATA]
    ,[NameEn]
    ,[Country]
    ,[Place]
    ,[Icon]
    ,[Tel])
    END
    """


let db__pCRY(line:Object[]): pCRY =
    let p = pCRY_empty()

    p.Code2 <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Fullname <- string(line.[6]).TrimEnd()
    p.Icon <- string(line.[7]).TrimEnd()
    p.Tel <- string(line.[8]).TrimEnd()
    p.Cur <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.Capital <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64
    p.Place <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Lang <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64

    p

let pCRY__sps (p:pCRY) = [|
    new SqlParameter("Code2", p.Code2)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Fullname", p.Fullname)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("Tel", p.Tel)
    new SqlParameter("Cur", p.Cur)
    new SqlParameter("Capital", p.Capital)
    new SqlParameter("Place", p.Place)
    new SqlParameter("Lang", p.Lang) |]

let db__CRY = db__Rcd db__pCRY

let CRY_wrapper item: CRY =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCRY_clone (p:pCRY): pCRY = {
    Code2 = p.Code2
    Caption = p.Caption
    Fullname = p.Fullname
    Icon = p.Icon
    Tel = p.Tel
    Cur = p.Cur
    Capital = p.Capital
    Place = p.Place
    Lang = p.Lang }

let CRY_update_transaction output (updater,suc,fail) (rcd:CRY) =
    let rollback_p = rcd.p |> pCRY_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CRY_table,CRY_sql_update,pCRY__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CRY_update output (rcd:CRY) =
    rcd
    |> CRY_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CRY_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CRY_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CRY_table,pCRY__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CRY_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CRY_create output p =
    CRY_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CRYo id: CRY option = id__rcd(conn,CRY_fieldorders,CRY_table,db__CRY) id

let CRY_metadata = {
    fieldorders = CRY_fieldorders
    db__rcd = db__CRY 
    wrapper = CRY_wrapper
    sps = pCRY__sps
    id = CRY_id
    id__rcdo = id__CRYo
    clone = pCRY_clone
    empty__p = pCRY_empty
    rcd__bin = CRY__bin
    bin__rcd = bin__CRY
    sql_update = CRY_sql_update
    rcd_update = CRY_update
    table = CRY_table
    shorthand = "cry" }

let CRYTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Country' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Country ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code2]
    ,[Caption]
    ,[Fullname]
    ,[Icon]
    ,[Tel]
    ,[Cur]
    ,[Capital]
    ,[Place]
    ,[Lang])
    END
    """


let db__pCUR(line:Object[]): pCUR =
    let p = pCUR_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Hidden <- if Convert.IsDBNull(line.[6]) then false else line.[6] :?> bool
    p.IsSac <- if Convert.IsDBNull(line.[7]) then false else line.[7] :?> bool
    p.IsTransfer <- if Convert.IsDBNull(line.[8]) then false else line.[8] :?> bool
    p.IsCash <- if Convert.IsDBNull(line.[9]) then false else line.[9] :?> bool
    p.EnableReward <- if Convert.IsDBNull(line.[10]) then false else line.[10] :?> bool
    p.EnableOTC <- if Convert.IsDBNull(line.[11]) then false else line.[11] :?> bool
    p.Icon <- string(line.[12]).TrimEnd()
    p.CurType <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.Dec <- if Convert.IsDBNull(line.[14]) then 0L else line.[14] :?> int64
    p.AnchorRate <- if Convert.IsDBNull(line.[15]) then 0.0 else line.[15] :?> float
    p.Freezable <- if Convert.IsDBNull(line.[16]) then false else line.[16] :?> bool
    p.Authorizable <- if Convert.IsDBNull(line.[17]) then false else line.[17] :?> bool
    p.ChaninID <- string(line.[18]).TrimEnd()
    p.ChaninName <- string(line.[19]).TrimEnd()
    p.ContractAddress <- string(line.[20]).TrimEnd()
    p.WalletAddress <- string(line.[21]).TrimEnd()
    p.BaseRate <- if Convert.IsDBNull(line.[22]) then 0.0 else line.[22] :?> float

    p

let pCUR__sps (p:pCUR) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Hidden", p.Hidden)
    new SqlParameter("IsSac", p.IsSac)
    new SqlParameter("IsTransfer", p.IsTransfer)
    new SqlParameter("IsCash", p.IsCash)
    new SqlParameter("EnableReward", p.EnableReward)
    new SqlParameter("EnableOTC", p.EnableOTC)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("CurType", p.CurType)
    new SqlParameter("Dec", p.Dec)
    new SqlParameter("AnchorRate", p.AnchorRate)
    new SqlParameter("Freezable", p.Freezable)
    new SqlParameter("Authorizable", p.Authorizable)
    new SqlParameter("ChaninID", p.ChaninID)
    new SqlParameter("ChaninName", p.ChaninName)
    new SqlParameter("ContractAddress", p.ContractAddress)
    new SqlParameter("WalletAddress", p.WalletAddress)
    new SqlParameter("BaseRate", p.BaseRate) |]

let db__CUR = db__Rcd db__pCUR

let CUR_wrapper item: CUR =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCUR_clone (p:pCUR): pCUR = {
    Code = p.Code
    Caption = p.Caption
    Hidden = p.Hidden
    IsSac = p.IsSac
    IsTransfer = p.IsTransfer
    IsCash = p.IsCash
    EnableReward = p.EnableReward
    EnableOTC = p.EnableOTC
    Icon = p.Icon
    CurType = p.CurType
    Dec = p.Dec
    AnchorRate = p.AnchorRate
    Freezable = p.Freezable
    Authorizable = p.Authorizable
    ChaninID = p.ChaninID
    ChaninName = p.ChaninName
    ContractAddress = p.ContractAddress
    WalletAddress = p.WalletAddress
    BaseRate = p.BaseRate }

let CUR_update_transaction output (updater,suc,fail) (rcd:CUR) =
    let rollback_p = rcd.p |> pCUR_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CUR_table,CUR_sql_update,pCUR__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CUR_update output (rcd:CUR) =
    rcd
    |> CUR_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CUR_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CUR_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CUR_table,pCUR__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CUR_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CUR_create output p =
    CUR_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CURo id: CUR option = id__rcd(conn,CUR_fieldorders,CUR_table,db__CUR) id

let CUR_metadata = {
    fieldorders = CUR_fieldorders
    db__rcd = db__CUR 
    wrapper = CUR_wrapper
    sps = pCUR__sps
    id = CUR_id
    id__rcdo = id__CURo
    clone = pCUR_clone
    empty__p = pCUR_empty
    rcd__bin = CUR__bin
    bin__rcd = bin__CUR
    sql_update = CUR_sql_update
    rcd_update = CUR_update
    table = CUR_table
    shorthand = "cur" }

let CURTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cur' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Cur ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Caption]
    ,[Hidden]
    ,[IsSac]
    ,[IsTransfer]
    ,[IsCash]
    ,[EnableReward]
    ,[EnableOTC]
    ,[Icon]
    ,[CurType]
    ,[Dec]
    ,[AnchorRate]
    ,[Freezable]
    ,[Authorizable]
    ,[ChaninID]
    ,[ChaninName]
    ,[ContractAddress]
    ,[WalletAddress]
    ,[BaseRate])
    END
    """


let db__pEU(line:Object[]): pEU =
    let p = pEU_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Username <- string(line.[5]).TrimEnd()
    p.Penname <- string(line.[6]).TrimEnd()
    p.Rolfname <- string(line.[7]).TrimEnd()
    p.Email <- string(line.[8]).TrimEnd()
    p.Tel <- string(line.[9]).TrimEnd()
    p.Domainname <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64
    p.Gender <- EnumOfValue(if Convert.IsDBNull(line.[11]) then 0 else line.[11] :?> int)
    p.Status <- EnumOfValue(if Convert.IsDBNull(line.[12]) then 0 else line.[12] :?> int)
    p.Admin <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.Privilege <- if Convert.IsDBNull(line.[14]) then 0L else line.[14] :?> int64
    p.Verify <- EnumOfValue(if Convert.IsDBNull(line.[15]) then 0 else line.[15] :?> int)
    p.Pwd <- string(line.[16]).TrimEnd()
    p.Online <- if Convert.IsDBNull(line.[17]) then false else line.[17] :?> bool
    p.Icon <- string(line.[18]).TrimEnd()
    p.Background <- string(line.[19]).TrimEnd()
    p.BasicAcct <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.Citizen <- if Convert.IsDBNull(line.[21]) then 0L else line.[21] :?> int64
    p.Refer <- string(line.[22]).TrimEnd()
    p.Referer <- if Convert.IsDBNull(line.[23]) then 0L else line.[23] :?> int64
    p.Discord <- string(line.[24]).TrimEnd()
    p.DiscordId <- if Convert.IsDBNull(line.[25]) then 0L else line.[25] :?> int64
    p.Google <- string(line.[26]).TrimEnd()
    p.GoogleId <- if Convert.IsDBNull(line.[27]) then 0L else line.[27] :?> int64
    p.Apple <- string(line.[28]).TrimEnd()
    p.AppleId <- if Convert.IsDBNull(line.[29]) then 0L else line.[29] :?> int64
    p.OAuthProvider <- string(line.[30]).TrimEnd()
    p.OAuthID <- string(line.[31]).TrimEnd()
    p.GTV <- string(line.[32]).TrimEnd()
    p.Gettr <- string(line.[33]).TrimEnd()
    p.Farm <- if Convert.IsDBNull(line.[34]) then 0L else line.[34] :?> int64
    p.CountFollows <- if Convert.IsDBNull(line.[35]) then 0L else line.[35] :?> int64
    p.CountFollowers <- if Convert.IsDBNull(line.[36]) then 0L else line.[36] :?> int64
    p.CountMoments <- if Convert.IsDBNull(line.[37]) then 0L else line.[37] :?> int64
    p.CountViews <- if Convert.IsDBNull(line.[38]) then 0L else line.[38] :?> int64
    p.CountComments <- if Convert.IsDBNull(line.[39]) then 0L else line.[39] :?> int64
    p.CountThumbUps <- if Convert.IsDBNull(line.[40]) then 0L else line.[40] :?> int64
    p.CountThumbDns <- if Convert.IsDBNull(line.[41]) then 0L else line.[41] :?> int64
    p.Lang <- if Convert.IsDBNull(line.[42]) then 0L else line.[42] :?> int64
    p.BizOperator <- if Convert.IsDBNull(line.[43]) then 0L else line.[43] :?> int64
    p.Url <- string(line.[44]).TrimEnd()
    p.About <- string(line.[45]).TrimEnd()
    p.PublicPoints <- if Convert.IsDBNull(line.[46]) then 0L else line.[46] :?> int64
    p.Json <- string(line.[47]).TrimEnd()
    p.Agentable <- EnumOfValue(if Convert.IsDBNull(line.[48]) then 0 else line.[48] :?> int)

    p

let pEU__sps (p:pEU) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Username", p.Username)
    new SqlParameter("Penname", p.Penname)
    new SqlParameter("Rolfname", p.Rolfname)
    new SqlParameter("Email", p.Email)
    new SqlParameter("Tel", p.Tel)
    new SqlParameter("Domainname", p.Domainname)
    new SqlParameter("Gender", p.Gender)
    new SqlParameter("Status", p.Status)
    new SqlParameter("Admin", p.Admin)
    new SqlParameter("Privilege", p.Privilege)
    new SqlParameter("Verify", p.Verify)
    new SqlParameter("Pwd", p.Pwd)
    new SqlParameter("Online", p.Online)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("Background", p.Background)
    new SqlParameter("BasicAcct", p.BasicAcct)
    new SqlParameter("Citizen", p.Citizen)
    new SqlParameter("Refer", p.Refer)
    new SqlParameter("Referer", p.Referer)
    new SqlParameter("Discord", p.Discord)
    new SqlParameter("DiscordId", p.DiscordId)
    new SqlParameter("Google", p.Google)
    new SqlParameter("GoogleId", p.GoogleId)
    new SqlParameter("Apple", p.Apple)
    new SqlParameter("AppleId", p.AppleId)
    new SqlParameter("OAuthProvider", p.OAuthProvider)
    new SqlParameter("OAuthID", p.OAuthID)
    new SqlParameter("GTV", p.GTV)
    new SqlParameter("Gettr", p.Gettr)
    new SqlParameter("Farm", p.Farm)
    new SqlParameter("CountFollows", p.CountFollows)
    new SqlParameter("CountFollowers", p.CountFollowers)
    new SqlParameter("CountMoments", p.CountMoments)
    new SqlParameter("CountViews", p.CountViews)
    new SqlParameter("CountComments", p.CountComments)
    new SqlParameter("CountThumbUps", p.CountThumbUps)
    new SqlParameter("CountThumbDns", p.CountThumbDns)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("BizOperator", p.BizOperator)
    new SqlParameter("Url", p.Url)
    new SqlParameter("About", p.About)
    new SqlParameter("PublicPoints", p.PublicPoints)
    new SqlParameter("Json", p.Json)
    new SqlParameter("Agentable", p.Agentable) |]

let db__EU = db__Rcd db__pEU

let EU_wrapper item: EU =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pEU_clone (p:pEU): pEU = {
    Caption = p.Caption
    Username = p.Username
    Penname = p.Penname
    Rolfname = p.Rolfname
    Email = p.Email
    Tel = p.Tel
    Domainname = p.Domainname
    Gender = p.Gender
    Status = p.Status
    Admin = p.Admin
    Privilege = p.Privilege
    Verify = p.Verify
    Pwd = p.Pwd
    Online = p.Online
    Icon = p.Icon
    Background = p.Background
    BasicAcct = p.BasicAcct
    Citizen = p.Citizen
    Refer = p.Refer
    Referer = p.Referer
    Discord = p.Discord
    DiscordId = p.DiscordId
    Google = p.Google
    GoogleId = p.GoogleId
    Apple = p.Apple
    AppleId = p.AppleId
    OAuthProvider = p.OAuthProvider
    OAuthID = p.OAuthID
    GTV = p.GTV
    Gettr = p.Gettr
    Farm = p.Farm
    CountFollows = p.CountFollows
    CountFollowers = p.CountFollowers
    CountMoments = p.CountMoments
    CountViews = p.CountViews
    CountComments = p.CountComments
    CountThumbUps = p.CountThumbUps
    CountThumbDns = p.CountThumbDns
    Lang = p.Lang
    BizOperator = p.BizOperator
    Url = p.Url
    About = p.About
    PublicPoints = p.PublicPoints
    Json = p.Json
    Agentable = p.Agentable }

let EU_update_transaction output (updater,suc,fail) (rcd:EU) =
    let rollback_p = rcd.p |> pEU_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,EU_table,EU_sql_update,pEU__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let EU_update output (rcd:EU) =
    rcd
    |> EU_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let EU_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment EU_id
    let ctime = DateTime.UtcNow
    match create (conn,output,EU_table,pEU__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> EU_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let EU_create output p =
    EU_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__EUo id: EU option = id__rcd(conn,EU_fieldorders,EU_table,db__EU) id

let EU_metadata = {
    fieldorders = EU_fieldorders
    db__rcd = db__EU 
    wrapper = EU_wrapper
    sps = pEU__sps
    id = EU_id
    id__rcdo = id__EUo
    clone = pEU_clone
    empty__p = pEU_empty
    rcd__bin = EU__bin
    bin__rcd = bin__EU
    sql_update = EU_sql_update
    rcd_update = EU_update
    table = EU_table
    shorthand = "eu" }

let EUTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_EndUser' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Username]
    ,[Penname]
    ,[Rolfname]
    ,[Email]
    ,[Tel]
    ,[Domainname]
    ,[Gender]
    ,[Status]
    ,[Admin]
    ,[Privilege]
    ,[Verify]
    ,[Pwd]
    ,[Online]
    ,[Icon]
    ,[Background]
    ,[BasicAcct]
    ,[Citizen]
    ,[Refer]
    ,[Referer]
    ,[Discord]
    ,[DiscordId]
    ,[Google]
    ,[GoogleId]
    ,[Apple]
    ,[AppleId]
    ,[OAuthProvider]
    ,[OAuthID]
    ,[GTV]
    ,[Gettr]
    ,[Farm]
    ,[CountFollows]
    ,[CountFollowers]
    ,[CountMoments]
    ,[CountViews]
    ,[CountComments]
    ,[CountThumbUps]
    ,[CountThumbDns]
    ,[Lang]
    ,[BizOperator]
    ,[Url]
    ,[About]
    ,[PublicPoints]
    ,[Json]
    ,[Agentable])
    END
    """


let db__pFILE(line:Object[]): pFILE =
    let p = pFILE_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Ipfs <- string(line.[5]).TrimEnd()
    p.Encrypt <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.SHA256 <- string(line.[7]).TrimEnd()
    p.Size <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[10]) then 0 else line.[10] :?> int)
    p.State <- EnumOfValue(if Convert.IsDBNull(line.[11]) then 0 else line.[11] :?> int)
    p.Folder <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.FileType <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.JSON <- string(line.[14]).TrimEnd()

    p

let pFILE__sps (p:pFILE) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Ipfs", p.Ipfs)
    new SqlParameter("Encrypt", p.Encrypt)
    new SqlParameter("SHA256", p.SHA256)
    new SqlParameter("Size", p.Size)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("State", p.State)
    new SqlParameter("Folder", p.Folder)
    new SqlParameter("FileType", p.FileType)
    new SqlParameter("JSON", p.JSON) |]

let db__FILE = db__Rcd db__pFILE

let FILE_wrapper item: FILE =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pFILE_clone (p:pFILE): pFILE = {
    Caption = p.Caption
    Ipfs = p.Ipfs
    Encrypt = p.Encrypt
    SHA256 = p.SHA256
    Size = p.Size
    Bind = p.Bind
    BindType = p.BindType
    State = p.State
    Folder = p.Folder
    FileType = p.FileType
    JSON = p.JSON }

let FILE_update_transaction output (updater,suc,fail) (rcd:FILE) =
    let rollback_p = rcd.p |> pFILE_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,FILE_table,FILE_sql_update,pFILE__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let FILE_update output (rcd:FILE) =
    rcd
    |> FILE_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let FILE_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment FILE_id
    let ctime = DateTime.UtcNow
    match create (conn,output,FILE_table,pFILE__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> FILE_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let FILE_create output p =
    FILE_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__FILEo id: FILE option = id__rcd(conn,FILE_fieldorders,FILE_table,db__FILE) id

let FILE_metadata = {
    fieldorders = FILE_fieldorders
    db__rcd = db__FILE 
    wrapper = FILE_wrapper
    sps = pFILE__sps
    id = FILE_id
    id__rcdo = id__FILEo
    clone = pFILE_clone
    empty__p = pFILE_empty
    rcd__bin = FILE__bin
    bin__rcd = bin__FILE
    sql_update = FILE_sql_update
    rcd_update = FILE_update
    table = FILE_table
    shorthand = "file" }

let FILETxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_File' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_File ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Ipfs]
    ,[Encrypt]
    ,[SHA256]
    ,[Size]
    ,[Bind]
    ,[BindType]
    ,[State]
    ,[Folder]
    ,[FileType]
    ,[JSON])
    END
    """


let db__pFOLDER(line:Object[]): pFOLDER =
    let p = pFOLDER_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Encrypt <- EnumOfValue(if Convert.IsDBNull(line.[5]) then 0 else line.[5] :?> int)
    p.Bind <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)
    p.Parent <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64

    p

let pFOLDER__sps (p:pFOLDER) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Encrypt", p.Encrypt)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("Parent", p.Parent) |]

let db__FOLDER = db__Rcd db__pFOLDER

let FOLDER_wrapper item: FOLDER =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pFOLDER_clone (p:pFOLDER): pFOLDER = {
    Caption = p.Caption
    Encrypt = p.Encrypt
    Bind = p.Bind
    BindType = p.BindType
    Parent = p.Parent }

let FOLDER_update_transaction output (updater,suc,fail) (rcd:FOLDER) =
    let rollback_p = rcd.p |> pFOLDER_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,FOLDER_table,FOLDER_sql_update,pFOLDER__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let FOLDER_update output (rcd:FOLDER) =
    rcd
    |> FOLDER_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let FOLDER_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment FOLDER_id
    let ctime = DateTime.UtcNow
    match create (conn,output,FOLDER_table,pFOLDER__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> FOLDER_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let FOLDER_create output p =
    FOLDER_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__FOLDERo id: FOLDER option = id__rcd(conn,FOLDER_fieldorders,FOLDER_table,db__FOLDER) id

let FOLDER_metadata = {
    fieldorders = FOLDER_fieldorders
    db__rcd = db__FOLDER 
    wrapper = FOLDER_wrapper
    sps = pFOLDER__sps
    id = FOLDER_id
    id__rcdo = id__FOLDERo
    clone = pFOLDER_clone
    empty__p = pFOLDER_empty
    rcd__bin = FOLDER__bin
    bin__rcd = bin__FOLDER
    sql_update = FOLDER_sql_update
    rcd_update = FOLDER_update
    table = FOLDER_table
    shorthand = "folder" }

let FOLDERTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Folder' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Folder ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Encrypt]
    ,[Bind]
    ,[BindType]
    ,[Parent])
    END
    """


let db__pLANG(line:Object[]): pLANG =
    let p = pLANG_empty()

    p.Code2 <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Native <- string(line.[6]).TrimEnd()
    p.Icon <- string(line.[7]).TrimEnd()
    p.IsBlank <- if Convert.IsDBNull(line.[8]) then false else line.[8] :?> bool
    p.IsLocale <- if Convert.IsDBNull(line.[9]) then false else line.[9] :?> bool
    p.IsContent <- if Convert.IsDBNull(line.[10]) then false else line.[10] :?> bool
    p.IsAutoTranslate <- if Convert.IsDBNull(line.[11]) then false else line.[11] :?> bool
    p.IsMiles <- if Convert.IsDBNull(line.[12]) then false else line.[12] :?> bool
    p.TextDirection <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)

    p

let pLANG__sps (p:pLANG) = [|
    new SqlParameter("Code2", p.Code2)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Native", p.Native)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("IsBlank", p.IsBlank)
    new SqlParameter("IsLocale", p.IsLocale)
    new SqlParameter("IsContent", p.IsContent)
    new SqlParameter("IsAutoTranslate", p.IsAutoTranslate)
    new SqlParameter("IsMiles", p.IsMiles)
    new SqlParameter("TextDirection", p.TextDirection) |]

let db__LANG = db__Rcd db__pLANG

let LANG_wrapper item: LANG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pLANG_clone (p:pLANG): pLANG = {
    Code2 = p.Code2
    Caption = p.Caption
    Native = p.Native
    Icon = p.Icon
    IsBlank = p.IsBlank
    IsLocale = p.IsLocale
    IsContent = p.IsContent
    IsAutoTranslate = p.IsAutoTranslate
    IsMiles = p.IsMiles
    TextDirection = p.TextDirection }

let LANG_update_transaction output (updater,suc,fail) (rcd:LANG) =
    let rollback_p = rcd.p |> pLANG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,LANG_table,LANG_sql_update,pLANG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let LANG_update output (rcd:LANG) =
    rcd
    |> LANG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let LANG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment LANG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,LANG_table,pLANG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> LANG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let LANG_create output p =
    LANG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__LANGo id: LANG option = id__rcd(conn,LANG_fieldorders,LANG_table,db__LANG) id

let LANG_metadata = {
    fieldorders = LANG_fieldorders
    db__rcd = db__LANG 
    wrapper = LANG_wrapper
    sps = pLANG__sps
    id = LANG_id
    id__rcdo = id__LANGo
    clone = pLANG_clone
    empty__p = pLANG_empty
    rcd__bin = LANG__bin
    bin__rcd = bin__LANG
    sql_update = LANG_sql_update
    rcd_update = LANG_update
    table = LANG_table
    shorthand = "lang" }

let LANGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Lang' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Lang ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code2]
    ,[Caption]
    ,[Native]
    ,[Icon]
    ,[IsBlank]
    ,[IsLocale]
    ,[IsContent]
    ,[IsAutoTranslate]
    ,[IsMiles]
    ,[TextDirection])
    END
    """


let db__pLOCALE(line:Object[]): pLOCALE =
    let p = pLOCALE_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Lang <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Zh <- string(line.[6]).TrimEnd()
    p.Text <- string(line.[7]).TrimEnd()

    p

let pLOCALE__sps (p:pLOCALE) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("Zh", p.Zh)
    new SqlParameter("Text", p.Text) |]

let db__LOCALE = db__Rcd db__pLOCALE

let LOCALE_wrapper item: LOCALE =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pLOCALE_clone (p:pLOCALE): pLOCALE = {
    Code = p.Code
    Lang = p.Lang
    Zh = p.Zh
    Text = p.Text }

let LOCALE_update_transaction output (updater,suc,fail) (rcd:LOCALE) =
    let rollback_p = rcd.p |> pLOCALE_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,LOCALE_table,LOCALE_sql_update,pLOCALE__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let LOCALE_update output (rcd:LOCALE) =
    rcd
    |> LOCALE_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let LOCALE_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment LOCALE_id
    let ctime = DateTime.UtcNow
    match create (conn,output,LOCALE_table,pLOCALE__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> LOCALE_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let LOCALE_create output p =
    LOCALE_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__LOCALEo id: LOCALE option = id__rcd(conn,LOCALE_fieldorders,LOCALE_table,db__LOCALE) id

let LOCALE_metadata = {
    fieldorders = LOCALE_fieldorders
    db__rcd = db__LOCALE 
    wrapper = LOCALE_wrapper
    sps = pLOCALE__sps
    id = LOCALE_id
    id__rcdo = id__LOCALEo
    clone = pLOCALE_clone
    empty__p = pLOCALE_empty
    rcd__bin = LOCALE__bin
    bin__rcd = bin__LOCALE
    sql_update = LOCALE_sql_update
    rcd_update = LOCALE_update
    table = LOCALE_table
    shorthand = "locale" }

let LOCALETxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Locale' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Locale ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Lang]
    ,[Zh]
    ,[Text])
    END
    """


let db__pCSI(line:Object[]): pCSI =
    let p = pCSI_empty()

    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[4]) then 0 else line.[4] :?> int)
    p.Lang <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64

    p

let pCSI__sps (p:pCSI) = [|
    new SqlParameter("Type", p.Type)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("Bind", p.Bind) |]

let db__CSI = db__Rcd db__pCSI

let CSI_wrapper item: CSI =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCSI_clone (p:pCSI): pCSI = {
    Type = p.Type
    Lang = p.Lang
    Bind = p.Bind }

let CSI_update_transaction output (updater,suc,fail) (rcd:CSI) =
    let rollback_p = rcd.p |> pCSI_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CSI_table,CSI_sql_update,pCSI__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CSI_update output (rcd:CSI) =
    rcd
    |> CSI_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CSI_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CSI_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CSI_table,pCSI__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CSI_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CSI_create output p =
    CSI_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CSIo id: CSI option = id__rcd(conn,CSI_fieldorders,CSI_table,db__CSI) id

let CSI_metadata = {
    fieldorders = CSI_fieldorders
    db__rcd = db__CSI 
    wrapper = CSI_wrapper
    sps = pCSI__sps
    id = CSI_id
    id__rcdo = id__CSIo
    clone = pCSI_clone
    empty__p = pCSI_empty
    rcd__bin = CSI__bin
    bin__rcd = bin__CSI
    sql_update = CSI_sql_update
    rcd_update = CSI_update
    table = CSI_table
    shorthand = "csi" }

let CSITxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_SpecialItem' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_SpecialItem ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Type]
    ,[Lang]
    ,[Bind])
    END
    """


let db__pCWC(line:Object[]): pCWC =
    let p = pCWC_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.ExternalId <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Icon <- string(line.[6]).TrimEnd()
    p.EU <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Biz <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Json <- string(line.[9]).TrimEnd()

    p

let pCWC__sps (p:pCWC) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("ExternalId", p.ExternalId)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("EU", p.EU)
    new SqlParameter("Biz", p.Biz)
    new SqlParameter("Json", p.Json) |]

let db__CWC = db__Rcd db__pCWC

let CWC_wrapper item: CWC =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCWC_clone (p:pCWC): pCWC = {
    Caption = p.Caption
    ExternalId = p.ExternalId
    Icon = p.Icon
    EU = p.EU
    Biz = p.Biz
    Json = p.Json }

let CWC_update_transaction output (updater,suc,fail) (rcd:CWC) =
    let rollback_p = rcd.p |> pCWC_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CWC_table,CWC_sql_update,pCWC__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CWC_update output (rcd:CWC) =
    rcd
    |> CWC_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CWC_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CWC_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CWC_table,pCWC__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CWC_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CWC_create output p =
    CWC_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CWCo id: CWC option = id__rcd(conn,CWC_fieldorders,CWC_table,db__CWC) id

let CWC_metadata = {
    fieldorders = CWC_fieldorders
    db__rcd = db__CWC 
    wrapper = CWC_wrapper
    sps = pCWC__sps
    id = CWC_id
    id__rcdo = id__CWCo
    clone = pCWC_clone
    empty__p = pCWC_empty
    rcd__bin = CWC__bin
    bin__rcd = bin__CWC
    sql_update = CWC_sql_update
    rcd_update = CWC_update
    table = CWC_table
    shorthand = "cwc" }

let CWCTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_WebCredential' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_WebCredential ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[ExternalId]
    ,[Icon]
    ,[EU]
    ,[Biz]
    ,[Json])
    END
    """


let db__pINS(line:Object[]): pINS =
    let p = pINS_empty()

    p.Desc <- string(line.[4]).TrimEnd()
    p.Hidden <- if Convert.IsDBNull(line.[5]) then false else line.[5] :?> bool
    p.EnableQuote <- if Convert.IsDBNull(line.[6]) then false else line.[6] :?> bool
    p.Code <- string(line.[7]).TrimEnd()
    p.Caption <- string(line.[8]).TrimEnd()
    p.Long <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.AssetName <- string(line.[10]).TrimEnd()
    p.Short <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Convertor <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.m <- if Convert.IsDBNull(line.[13]) then 0.0 else line.[13] :?> float
    p.mu <- if Convert.IsDBNull(line.[14]) then 0.0 else line.[14] :?> float
    p.eta <- if Convert.IsDBNull(line.[15]) then 0.0 else line.[15] :?> float
    p.psi <- if Convert.IsDBNull(line.[16]) then 0.0 else line.[16] :?> float
    p.MarginCalc <- EnumOfValue(if Convert.IsDBNull(line.[17]) then 0 else line.[17] :?> int)
    p.MarginRateInit <- if Convert.IsDBNull(line.[18]) then 0.0 else line.[18] :?> float
    p.MarginRateMntn <- if Convert.IsDBNull(line.[19]) then 0.0 else line.[19] :?> float
    p.MarginMode <- EnumOfValue(if Convert.IsDBNull(line.[20]) then 0 else line.[20] :?> int)
    p.Dec <- if Convert.IsDBNull(line.[21]) then 0L else line.[21] :?> int64
    p.Formatter <- string(line.[22]).TrimEnd()
    p.Path <- string(line.[23]).TrimEnd()
    p.Ask <- if Convert.IsDBNull(line.[24]) then 0L else line.[24] :?> int64
    p.Bid <- if Convert.IsDBNull(line.[25]) then 0L else line.[25] :?> int64
    p.Middle <- if Convert.IsDBNull(line.[26]) then 0.0 else line.[26] :?> float
    p.FixedSpread <- if Convert.IsDBNull(line.[27]) then 0.0 else line.[27] :?> float
    p.PercentageSpread <- if Convert.IsDBNull(line.[28]) then 0.0 else line.[28] :?> float
    p.TaxOpenMode <- EnumOfValue(if Convert.IsDBNull(line.[29]) then 0 else line.[29] :?> int)
    p.TaxOpen <- if Convert.IsDBNull(line.[30]) then 0.0 else line.[30] :?> float
    p.TaxCloseMode <- EnumOfValue(if Convert.IsDBNull(line.[31]) then 0 else line.[31] :?> int)
    p.TaxClose <- if Convert.IsDBNull(line.[32]) then 0.0 else line.[32] :?> float
    p.Tax <- if Convert.IsDBNull(line.[33]) then 0.0 else line.[33] :?> float
    p.TaxCur <- if Convert.IsDBNull(line.[34]) then 0L else line.[34] :?> int64
    p.TaxCurCode <- string(line.[35]).TrimEnd()
    p.LastPrice <- if Convert.IsDBNull(line.[36]) then 0.0 else line.[36] :?> float
    p.LastUpdatedat <- DateTime.FromBinary(if Convert.IsDBNull(line.[37]) then DateTime.MinValue.Ticks else line.[37] :?> int64)
    p.LastPriceChange <- DateTime.FromBinary(if Convert.IsDBNull(line.[38]) then DateTime.MinValue.Ticks else line.[38] :?> int64)
    p.TradeStatus <- EnumOfValue(if Convert.IsDBNull(line.[39]) then 0 else line.[39] :?> int)
    p.RoMode <- EnumOfValue(if Convert.IsDBNull(line.[40]) then 0 else line.[40] :?> int)
    p.Schedule <- string(line.[41]).TrimEnd()
    p.TradeMode <- EnumOfValue(if Convert.IsDBNull(line.[42]) then 0 else line.[42] :?> int)
    p.DerivativeMode <- EnumOfValue(if Convert.IsDBNull(line.[43]) then 0 else line.[43] :?> int)
    p.OptionsMode <- EnumOfValue(if Convert.IsDBNull(line.[44]) then 0 else line.[44] :?> int)
    p.OptionsCP <- EnumOfValue(if Convert.IsDBNull(line.[45]) then 0 else line.[45] :?> int)
    p.OptionsExpiry <- DateTime.FromBinary(if Convert.IsDBNull(line.[46]) then DateTime.MinValue.Ticks else line.[46] :?> int64)
    p.OptionsStrike <- if Convert.IsDBNull(line.[47]) then 0.0 else line.[47] :?> float
    p.OptionsPricing <- string(line.[48]).TrimEnd()
    p.OptionsPeriod <- string(line.[49]).TrimEnd()
    p.OptionsTax <- if Convert.IsDBNull(line.[50]) then 0.0 else line.[50] :?> float
    p.OptionsPremiumPerTradeMin <- if Convert.IsDBNull(line.[51]) then 0.0 else line.[51] :?> float
    p.OptionsPremiumPerTradeMax <- if Convert.IsDBNull(line.[52]) then 0.0 else line.[52] :?> float
    p.LimitLotPerTrade <- if Convert.IsDBNull(line.[53]) then 0.0 else line.[53] :?> float
    p.LimitLotPosition <- if Convert.IsDBNull(line.[54]) then 0.0 else line.[54] :?> float
    p.CurrentOpen <- if Convert.IsDBNull(line.[55]) then 0.0 else line.[55] :?> float
    p.CurrentHigh <- if Convert.IsDBNull(line.[56]) then 0.0 else line.[56] :?> float
    p.CurrentLow <- if Convert.IsDBNull(line.[57]) then 0.0 else line.[57] :?> float
    p.PrevClose <- if Convert.IsDBNull(line.[58]) then 0.0 else line.[58] :?> float
    p.PrevClosedat <- DateTime.FromBinary(if Convert.IsDBNull(line.[59]) then DateTime.MinValue.Ticks else line.[59] :?> int64)
    p.CurrentOpenat <- DateTime.FromBinary(if Convert.IsDBNull(line.[60]) then DateTime.MinValue.Ticks else line.[60] :?> int64)
    p.ExtBiz <- if Convert.IsDBNull(line.[61]) then 0L else line.[61] :?> int64
    p.RefExternal <- string(line.[62]).TrimEnd()
    p.ItrnInss <- string(line.[63]).TrimEnd()
    p.ItrnInssMode <- EnumOfValue(if Convert.IsDBNull(line.[64]) then 0 else line.[64] :?> int)
    p.FlushType <- EnumOfValue(if Convert.IsDBNull(line.[65]) then 0 else line.[65] :?> int)
    p.CurTrigger <- EnumOfValue(if Convert.IsDBNull(line.[66]) then 0 else line.[66] :?> int)
    p.RobotType <- EnumOfValue(if Convert.IsDBNull(line.[67]) then 0 else line.[67] :?> int)
    p.ExtLong <- string(line.[68]).TrimEnd()
    p.ExtShort <- string(line.[69]).TrimEnd()
    p.ExtPrice <- if Convert.IsDBNull(line.[70]) then 0.0 else line.[70] :?> float
    p.SaveM1 <- if Convert.IsDBNull(line.[71]) then false else line.[71] :?> bool
    p.HistSavedat <- DateTime.FromBinary(if Convert.IsDBNull(line.[72]) then DateTime.MinValue.Ticks else line.[72] :?> int64)
    p.SaveD1 <- if Convert.IsDBNull(line.[73]) then false else line.[73] :?> bool
    p.SlPips <- if Convert.IsDBNull(line.[74]) then 0.0 else line.[74] :?> float
    p.TpPips <- if Convert.IsDBNull(line.[75]) then 0.0 else line.[75] :?> float
    p.PendingLimitPips <- if Convert.IsDBNull(line.[76]) then 0.0 else line.[76] :?> float
    p.PendingStopPips <- if Convert.IsDBNull(line.[77]) then 0.0 else line.[77] :?> float
    p.LastDirection <- EnumOfValue(if Convert.IsDBNull(line.[78]) then 0 else line.[78] :?> int)
    p.LiqMode <- EnumOfValue(if Convert.IsDBNull(line.[79]) then 0 else line.[79] :?> int)
    p.LiqPeriodSince <- DateTime.FromBinary(if Convert.IsDBNull(line.[80]) then DateTime.MinValue.Ticks else line.[80] :?> int64)
    p.LiqPeriodTill <- if Convert.IsDBNull(line.[81]) then 0L else line.[81] :?> int64
    p.LiqPeriod <- EnumOfValue(if Convert.IsDBNull(line.[82]) then 0 else line.[82] :?> int)
    p.LiqTime <- if Convert.IsDBNull(line.[83]) then 0.0 else line.[83] :?> float
    p.ConvertRatio <- if Convert.IsDBNull(line.[84]) then 0.0 else line.[84] :?> float
    p.RoBuyMode <- EnumOfValue(if Convert.IsDBNull(line.[85]) then 0 else line.[85] :?> int)
    p.RoBuy <- if Convert.IsDBNull(line.[86]) then 0.0 else line.[86] :?> float
    p.RoSellMode <- EnumOfValue(if Convert.IsDBNull(line.[87]) then 0 else line.[87] :?> int)
    p.RoSell <- if Convert.IsDBNull(line.[88]) then 0.0 else line.[88] :?> float
    p.PosLimitBuy <- if Convert.IsDBNull(line.[89]) then 0.0 else line.[89] :?> float
    p.PosLimitSell <- if Convert.IsDBNull(line.[90]) then 0.0 else line.[90] :?> float
    p.RoCur <- if Convert.IsDBNull(line.[91]) then 0L else line.[91] :?> int64
    p.RoCurCode <- string(line.[92]).TrimEnd()
    p.AdjBias <- if Convert.IsDBNull(line.[93]) then 0.0 else line.[93] :?> float
    p.TaxBuy <- if Convert.IsDBNull(line.[94]) then 0.0 else line.[94] :?> float
    p.TaxSell <- if Convert.IsDBNull(line.[95]) then 0.0 else line.[95] :?> float
    p.Misc <- string(line.[96]).TrimEnd()
    p.RefLastPriceChange <- DateTime.FromBinary(if Convert.IsDBNull(line.[97]) then DateTime.MinValue.Ticks else line.[97] :?> int64)
    p.HedgeExternal <- string(line.[98]).TrimEnd()
    p.OfferingPrice <- if Convert.IsDBNull(line.[99]) then 0.0 else line.[99] :?> float
    p.IssuanceAmount <- if Convert.IsDBNull(line.[100]) then 0L else line.[100] :?> int64
    p.ListingStatus <- EnumOfValue(if Convert.IsDBNull(line.[101]) then 0 else line.[101] :?> int)
    p.Turnover <- if Convert.IsDBNull(line.[102]) then 0.0 else line.[102] :?> float
    p.PriceOpened <- if Convert.IsDBNull(line.[103]) then 0L else line.[103] :?> int64

    p

let pINS__sps (p:pINS) = [|
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Hidden", p.Hidden)
    new SqlParameter("EnableQuote", p.EnableQuote)
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Long", p.Long)
    new SqlParameter("AssetName", p.AssetName)
    new SqlParameter("Short", p.Short)
    new SqlParameter("Convertor", p.Convertor)
    new SqlParameter("m", p.m)
    new SqlParameter("mu", p.mu)
    new SqlParameter("eta", p.eta)
    new SqlParameter("psi", p.psi)
    new SqlParameter("MarginCalc", p.MarginCalc)
    new SqlParameter("MarginRateInit", p.MarginRateInit)
    new SqlParameter("MarginRateMntn", p.MarginRateMntn)
    new SqlParameter("MarginMode", p.MarginMode)
    new SqlParameter("Dec", p.Dec)
    new SqlParameter("Formatter", p.Formatter)
    new SqlParameter("Path", p.Path)
    new SqlParameter("Ask", p.Ask)
    new SqlParameter("Bid", p.Bid)
    new SqlParameter("Middle", p.Middle)
    new SqlParameter("FixedSpread", p.FixedSpread)
    new SqlParameter("PercentageSpread", p.PercentageSpread)
    new SqlParameter("TaxOpenMode", p.TaxOpenMode)
    new SqlParameter("TaxOpen", p.TaxOpen)
    new SqlParameter("TaxCloseMode", p.TaxCloseMode)
    new SqlParameter("TaxClose", p.TaxClose)
    new SqlParameter("Tax", p.Tax)
    new SqlParameter("TaxCur", p.TaxCur)
    new SqlParameter("TaxCurCode", p.TaxCurCode)
    new SqlParameter("LastPrice", p.LastPrice)
    new SqlParameter("LastUpdatedat", p.LastUpdatedat.Ticks)
    new SqlParameter("LastPriceChange", p.LastPriceChange.Ticks)
    new SqlParameter("TradeStatus", p.TradeStatus)
    new SqlParameter("RoMode", p.RoMode)
    new SqlParameter("Schedule", p.Schedule)
    new SqlParameter("TradeMode", p.TradeMode)
    new SqlParameter("DerivativeMode", p.DerivativeMode)
    new SqlParameter("OptionsMode", p.OptionsMode)
    new SqlParameter("OptionsCP", p.OptionsCP)
    new SqlParameter("OptionsExpiry", p.OptionsExpiry.Ticks)
    new SqlParameter("OptionsStrike", p.OptionsStrike)
    new SqlParameter("OptionsPricing", p.OptionsPricing)
    new SqlParameter("OptionsPeriod", p.OptionsPeriod)
    new SqlParameter("OptionsTax", p.OptionsTax)
    new SqlParameter("OptionsPremiumPerTradeMin", p.OptionsPremiumPerTradeMin)
    new SqlParameter("OptionsPremiumPerTradeMax", p.OptionsPremiumPerTradeMax)
    new SqlParameter("LimitLotPerTrade", p.LimitLotPerTrade)
    new SqlParameter("LimitLotPosition", p.LimitLotPosition)
    new SqlParameter("CurrentOpen", p.CurrentOpen)
    new SqlParameter("CurrentHigh", p.CurrentHigh)
    new SqlParameter("CurrentLow", p.CurrentLow)
    new SqlParameter("PrevClose", p.PrevClose)
    new SqlParameter("PrevClosedat", p.PrevClosedat.Ticks)
    new SqlParameter("CurrentOpenat", p.CurrentOpenat.Ticks)
    new SqlParameter("ExtBiz", p.ExtBiz)
    new SqlParameter("RefExternal", p.RefExternal)
    new SqlParameter("ItrnInss", p.ItrnInss)
    new SqlParameter("ItrnInssMode", p.ItrnInssMode)
    new SqlParameter("FlushType", p.FlushType)
    new SqlParameter("CurTrigger", p.CurTrigger)
    new SqlParameter("RobotType", p.RobotType)
    new SqlParameter("ExtLong", p.ExtLong)
    new SqlParameter("ExtShort", p.ExtShort)
    new SqlParameter("ExtPrice", p.ExtPrice)
    new SqlParameter("SaveM1", p.SaveM1)
    new SqlParameter("HistSavedat", p.HistSavedat.Ticks)
    new SqlParameter("SaveD1", p.SaveD1)
    new SqlParameter("SlPips", p.SlPips)
    new SqlParameter("TpPips", p.TpPips)
    new SqlParameter("PendingLimitPips", p.PendingLimitPips)
    new SqlParameter("PendingStopPips", p.PendingStopPips)
    new SqlParameter("LastDirection", p.LastDirection)
    new SqlParameter("LiqMode", p.LiqMode)
    new SqlParameter("LiqPeriodSince", p.LiqPeriodSince.Ticks)
    new SqlParameter("LiqPeriodTill", p.LiqPeriodTill)
    new SqlParameter("LiqPeriod", p.LiqPeriod)
    new SqlParameter("LiqTime", p.LiqTime)
    new SqlParameter("ConvertRatio", p.ConvertRatio)
    new SqlParameter("RoBuyMode", p.RoBuyMode)
    new SqlParameter("RoBuy", p.RoBuy)
    new SqlParameter("RoSellMode", p.RoSellMode)
    new SqlParameter("RoSell", p.RoSell)
    new SqlParameter("PosLimitBuy", p.PosLimitBuy)
    new SqlParameter("PosLimitSell", p.PosLimitSell)
    new SqlParameter("RoCur", p.RoCur)
    new SqlParameter("RoCurCode", p.RoCurCode)
    new SqlParameter("AdjBias", p.AdjBias)
    new SqlParameter("TaxBuy", p.TaxBuy)
    new SqlParameter("TaxSell", p.TaxSell)
    new SqlParameter("Misc", p.Misc)
    new SqlParameter("RefLastPriceChange", p.RefLastPriceChange.Ticks)
    new SqlParameter("HedgeExternal", p.HedgeExternal)
    new SqlParameter("OfferingPrice", p.OfferingPrice)
    new SqlParameter("IssuanceAmount", p.IssuanceAmount)
    new SqlParameter("ListingStatus", p.ListingStatus)
    new SqlParameter("Turnover", p.Turnover)
    new SqlParameter("PriceOpened", p.PriceOpened) |]

let db__INS = db__Rcd db__pINS

let INS_wrapper item: INS =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pINS_clone (p:pINS): pINS = {
    Desc = p.Desc
    Hidden = p.Hidden
    EnableQuote = p.EnableQuote
    Code = p.Code
    Caption = p.Caption
    Long = p.Long
    AssetName = p.AssetName
    Short = p.Short
    Convertor = p.Convertor
    m = p.m
    mu = p.mu
    eta = p.eta
    psi = p.psi
    MarginCalc = p.MarginCalc
    MarginRateInit = p.MarginRateInit
    MarginRateMntn = p.MarginRateMntn
    MarginMode = p.MarginMode
    Dec = p.Dec
    Formatter = p.Formatter
    Path = p.Path
    Ask = p.Ask
    Bid = p.Bid
    Middle = p.Middle
    FixedSpread = p.FixedSpread
    PercentageSpread = p.PercentageSpread
    TaxOpenMode = p.TaxOpenMode
    TaxOpen = p.TaxOpen
    TaxCloseMode = p.TaxCloseMode
    TaxClose = p.TaxClose
    Tax = p.Tax
    TaxCur = p.TaxCur
    TaxCurCode = p.TaxCurCode
    LastPrice = p.LastPrice
    LastUpdatedat = p.LastUpdatedat
    LastPriceChange = p.LastPriceChange
    TradeStatus = p.TradeStatus
    RoMode = p.RoMode
    Schedule = p.Schedule
    TradeMode = p.TradeMode
    DerivativeMode = p.DerivativeMode
    OptionsMode = p.OptionsMode
    OptionsCP = p.OptionsCP
    OptionsExpiry = p.OptionsExpiry
    OptionsStrike = p.OptionsStrike
    OptionsPricing = p.OptionsPricing
    OptionsPeriod = p.OptionsPeriod
    OptionsTax = p.OptionsTax
    OptionsPremiumPerTradeMin = p.OptionsPremiumPerTradeMin
    OptionsPremiumPerTradeMax = p.OptionsPremiumPerTradeMax
    LimitLotPerTrade = p.LimitLotPerTrade
    LimitLotPosition = p.LimitLotPosition
    CurrentOpen = p.CurrentOpen
    CurrentHigh = p.CurrentHigh
    CurrentLow = p.CurrentLow
    PrevClose = p.PrevClose
    PrevClosedat = p.PrevClosedat
    CurrentOpenat = p.CurrentOpenat
    ExtBiz = p.ExtBiz
    RefExternal = p.RefExternal
    ItrnInss = p.ItrnInss
    ItrnInssMode = p.ItrnInssMode
    FlushType = p.FlushType
    CurTrigger = p.CurTrigger
    RobotType = p.RobotType
    ExtLong = p.ExtLong
    ExtShort = p.ExtShort
    ExtPrice = p.ExtPrice
    SaveM1 = p.SaveM1
    HistSavedat = p.HistSavedat
    SaveD1 = p.SaveD1
    SlPips = p.SlPips
    TpPips = p.TpPips
    PendingLimitPips = p.PendingLimitPips
    PendingStopPips = p.PendingStopPips
    LastDirection = p.LastDirection
    LiqMode = p.LiqMode
    LiqPeriodSince = p.LiqPeriodSince
    LiqPeriodTill = p.LiqPeriodTill
    LiqPeriod = p.LiqPeriod
    LiqTime = p.LiqTime
    ConvertRatio = p.ConvertRatio
    RoBuyMode = p.RoBuyMode
    RoBuy = p.RoBuy
    RoSellMode = p.RoSellMode
    RoSell = p.RoSell
    PosLimitBuy = p.PosLimitBuy
    PosLimitSell = p.PosLimitSell
    RoCur = p.RoCur
    RoCurCode = p.RoCurCode
    AdjBias = p.AdjBias
    TaxBuy = p.TaxBuy
    TaxSell = p.TaxSell
    Misc = p.Misc
    RefLastPriceChange = p.RefLastPriceChange
    HedgeExternal = p.HedgeExternal
    OfferingPrice = p.OfferingPrice
    IssuanceAmount = p.IssuanceAmount
    ListingStatus = p.ListingStatus
    Turnover = p.Turnover
    PriceOpened = p.PriceOpened }

let INS_update_transaction output (updater,suc,fail) (rcd:INS) =
    let rollback_p = rcd.p |> pINS_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,INS_table,INS_sql_update,pINS__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let INS_update output (rcd:INS) =
    rcd
    |> INS_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let INS_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment INS_id
    let ctime = DateTime.UtcNow
    match create (conn,output,INS_table,pINS__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> INS_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let INS_create output p =
    INS_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__INSo id: INS option = id__rcd(conn,INS_fieldorders,INS_table,db__INS) id

let INS_metadata = {
    fieldorders = INS_fieldorders
    db__rcd = db__INS 
    wrapper = INS_wrapper
    sps = pINS__sps
    id = INS_id
    id__rcdo = id__INSo
    clone = pINS_clone
    empty__p = pINS_empty
    rcd__bin = INS__bin
    bin__rcd = bin__INS
    sql_update = INS_sql_update
    rcd_update = INS_update
    table = INS_table
    shorthand = "ins" }

let INSTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ex_Instrument' AND xtype='U')
    BEGIN

        CREATE TABLE Ex_Instrument ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Desc]
    ,[Hidden]
    ,[EnableQuote]
    ,[Code]
    ,[Caption]
    ,[Long]
    ,[AssetName]
    ,[Short]
    ,[Convertor]
    ,[m]
    ,[mu]
    ,[eta]
    ,[psi]
    ,[MarginCalc]
    ,[MarginRateInit]
    ,[MarginRateMntn]
    ,[MarginMode]
    ,[Dec]
    ,[Formatter]
    ,[Path]
    ,[Ask]
    ,[Bid]
    ,[Middle]
    ,[FixedSpread]
    ,[PercentageSpread]
    ,[TaxOpenMode]
    ,[TaxOpen]
    ,[TaxCloseMode]
    ,[TaxClose]
    ,[Tax]
    ,[TaxCur]
    ,[TaxCurCode]
    ,[LastPrice]
    ,[LastUpdatedat]
    ,[LastPriceChange]
    ,[TradeStatus]
    ,[RoMode]
    ,[Schedule]
    ,[TradeMode]
    ,[DerivativeMode]
    ,[OptionsMode]
    ,[OptionsCP]
    ,[OptionsExpiry]
    ,[OptionsStrike]
    ,[OptionsPricing]
    ,[OptionsPeriod]
    ,[OptionsTax]
    ,[OptionsPremiumPerTradeMin]
    ,[OptionsPremiumPerTradeMax]
    ,[LimitLotPerTrade]
    ,[LimitLotPosition]
    ,[CurrentOpen]
    ,[CurrentHigh]
    ,[CurrentLow]
    ,[PrevClose]
    ,[PrevClosedat]
    ,[CurrentOpenat]
    ,[ExtBiz]
    ,[RefExternal]
    ,[ItrnInss]
    ,[ItrnInssMode]
    ,[FlushType]
    ,[CurTrigger]
    ,[RobotType]
    ,[ExtLong]
    ,[ExtShort]
    ,[ExtPrice]
    ,[SaveM1]
    ,[HistSavedat]
    ,[SaveD1]
    ,[SlPips]
    ,[TpPips]
    ,[PendingLimitPips]
    ,[PendingStopPips]
    ,[LastDirection]
    ,[LiqMode]
    ,[LiqPeriodSince]
    ,[LiqPeriodTill]
    ,[LiqPeriod]
    ,[LiqTime]
    ,[ConvertRatio]
    ,[RoBuyMode]
    ,[RoBuy]
    ,[RoSellMode]
    ,[RoSell]
    ,[PosLimitBuy]
    ,[PosLimitSell]
    ,[RoCur]
    ,[RoCurCode]
    ,[AdjBias]
    ,[TaxBuy]
    ,[TaxSell]
    ,[Misc]
    ,[RefLastPriceChange]
    ,[HedgeExternal]
    ,[OfferingPrice]
    ,[IssuanceAmount]
    ,[ListingStatus]
    ,[Turnover]
    ,[PriceOpened])
    END
    """


let db__pTICKET(line:Object[]): pTICKET =
    let p = pTICKET_empty()

    p.EndUser <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.TradeAcct <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Ins <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.Code <- string(line.[7]).TrimEnd()
    p.Caption <- string(line.[8]).TrimEnd()
    p.TradeMode <- EnumOfValue(if Convert.IsDBNull(line.[9]) then 0 else line.[9] :?> int)
    p.Lot <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64
    p.PriceOpened <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.PriceOpen <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.PriceSL <- if Convert.IsDBNull(line.[13]) then 0L else line.[13] :?> int64
    p.PriceTP <- if Convert.IsDBNull(line.[14]) then 0L else line.[14] :?> int64
    p.PriceClose <- if Convert.IsDBNull(line.[15]) then 0L else line.[15] :?> int64
    p.Status <- EnumOfValue(if Convert.IsDBNull(line.[16]) then 0 else line.[16] :?> int)
    p.CP <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.CptAcct <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.Ref <- if Convert.IsDBNull(line.[19]) then 0L else line.[19] :?> int64
    p.OpenRef <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.CloseRef <- if Convert.IsDBNull(line.[21]) then 0L else line.[21] :?> int64
    p.Origin <- if Convert.IsDBNull(line.[22]) then 0L else line.[22] :?> int64
    p.PnL <- if Convert.IsDBNull(line.[23]) then 0.0 else line.[23] :?> float
    p.PnLSpread <- if Convert.IsDBNull(line.[24]) then 0.0 else line.[24] :?> float
    p.Margin <- if Convert.IsDBNull(line.[25]) then 0.0 else line.[25] :?> float
    p.RO <- if Convert.IsDBNull(line.[26]) then 0.0 else line.[26] :?> float
    p.Tax <- if Convert.IsDBNull(line.[27]) then 0.0 else line.[27] :?> float
    p.CloseType <- EnumOfValue(if Convert.IsDBNull(line.[28]) then 0 else line.[28] :?> int)
    p.CommitType <- EnumOfValue(if Convert.IsDBNull(line.[29]) then 0 else line.[29] :?> int)
    p.Cmt <- string(line.[30]).TrimEnd()
    p.Opendat <- DateTime.FromBinary(if Convert.IsDBNull(line.[31]) then DateTime.MinValue.Ticks else line.[31] :?> int64)
    p.Closedat <- DateTime.FromBinary(if Convert.IsDBNull(line.[32]) then DateTime.MinValue.Ticks else line.[32] :?> int64)
    p.CaStrategyAmt <- if Convert.IsDBNull(line.[33]) then 0.0 else line.[33] :?> float
    p.CaRo <- if Convert.IsDBNull(line.[34]) then false else line.[34] :?> bool
    p.CaAsa <- if Convert.IsDBNull(line.[35]) then false else line.[35] :?> bool
    p.CaCmphsvCharge <- if Convert.IsDBNull(line.[36]) then 0.0 else line.[36] :?> float
    p.RoCheckedat <- DateTime.FromBinary(if Convert.IsDBNull(line.[37]) then DateTime.MinValue.Ticks else line.[37] :?> int64)
    p.Expiry <- DateTime.FromBinary(if Convert.IsDBNull(line.[38]) then DateTime.MinValue.Ticks else line.[38] :?> int64)
    p.HedgetCP <- if Convert.IsDBNull(line.[39]) then 0L else line.[39] :?> int64
    p.PendingPrice <- if Convert.IsDBNull(line.[40]) then 0L else line.[40] :?> int64
    p.ClosedLot <- if Convert.IsDBNull(line.[41]) then 0L else line.[41] :?> int64
    p.ClosedAmt <- if Convert.IsDBNull(line.[42]) then 0.0 else line.[42] :?> float
    p.PendingAmt <- if Convert.IsDBNull(line.[43]) then 0.0 else line.[43] :?> float
    p.DrvPreminum <- if Convert.IsDBNull(line.[44]) then 0.0 else line.[44] :?> float
    p.DrvExpiry <- DateTime.FromBinary(if Convert.IsDBNull(line.[45]) then DateTime.MinValue.Ticks else line.[45] :?> int64)
    p.DrvPeriod <- if Convert.IsDBNull(line.[46]) then 0L else line.[46] :?> int64
    p.DrvDirection <- EnumOfValue(if Convert.IsDBNull(line.[47]) then 0 else line.[47] :?> int)
    p.DrvPrice <- if Convert.IsDBNull(line.[48]) then 0.0 else line.[48] :?> float
    p.DoubleCp <- if Convert.IsDBNull(line.[49]) then 0L else line.[49] :?> int64
    p.ClearStatus <- EnumOfValue(if Convert.IsDBNull(line.[50]) then 0 else line.[50] :?> int)
    p.FollowTicket <- if Convert.IsDBNull(line.[51]) then 0L else line.[51] :?> int64
    p.Config <- string(line.[52]).TrimEnd()
    p.OptionStatus <- EnumOfValue(if Convert.IsDBNull(line.[53]) then 0 else line.[53] :?> int)
    p.NotionalPrincipal <- if Convert.IsDBNull(line.[54]) then 0.0 else line.[54] :?> float
    p.ExercisedPrincipal <- if Convert.IsDBNull(line.[55]) then 0.0 else line.[55] :?> float
    p.ExerciseMode <- if Convert.IsDBNull(line.[56]) then 0.0 else line.[56] :?> float
    p.ExercisePrice <- if Convert.IsDBNull(line.[57]) then 0.0 else line.[57] :?> float
    p.ExternalTicketOpen <- if Convert.IsDBNull(line.[58]) then 0L else line.[58] :?> int64
    p.ExternalTicketClose <- if Convert.IsDBNull(line.[59]) then 0L else line.[59] :?> int64
    p.ExternalTicketPending <- if Convert.IsDBNull(line.[60]) then 0L else line.[60] :?> int64
    p.ExternalTicketCancel <- if Convert.IsDBNull(line.[61]) then 0L else line.[61] :?> int64
    p.Desc <- string(line.[62]).TrimEnd()

    p

let pTICKET__sps (p:pTICKET) = [|
    new SqlParameter("EndUser", p.EndUser)
    new SqlParameter("TradeAcct", p.TradeAcct)
    new SqlParameter("Ins", p.Ins)
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("TradeMode", p.TradeMode)
    new SqlParameter("Lot", p.Lot)
    new SqlParameter("PriceOpened", p.PriceOpened)
    new SqlParameter("PriceOpen", p.PriceOpen)
    new SqlParameter("PriceSL", p.PriceSL)
    new SqlParameter("PriceTP", p.PriceTP)
    new SqlParameter("PriceClose", p.PriceClose)
    new SqlParameter("Status", p.Status)
    new SqlParameter("CP", p.CP)
    new SqlParameter("CptAcct", p.CptAcct)
    new SqlParameter("Ref", p.Ref)
    new SqlParameter("OpenRef", p.OpenRef)
    new SqlParameter("CloseRef", p.CloseRef)
    new SqlParameter("Origin", p.Origin)
    new SqlParameter("PnL", p.PnL)
    new SqlParameter("PnLSpread", p.PnLSpread)
    new SqlParameter("Margin", p.Margin)
    new SqlParameter("RO", p.RO)
    new SqlParameter("Tax", p.Tax)
    new SqlParameter("CloseType", p.CloseType)
    new SqlParameter("CommitType", p.CommitType)
    new SqlParameter("Cmt", p.Cmt)
    new SqlParameter("Opendat", p.Opendat.Ticks)
    new SqlParameter("Closedat", p.Closedat.Ticks)
    new SqlParameter("CaStrategyAmt", p.CaStrategyAmt)
    new SqlParameter("CaRo", p.CaRo)
    new SqlParameter("CaAsa", p.CaAsa)
    new SqlParameter("CaCmphsvCharge", p.CaCmphsvCharge)
    new SqlParameter("RoCheckedat", p.RoCheckedat.Ticks)
    new SqlParameter("Expiry", p.Expiry.Ticks)
    new SqlParameter("HedgetCP", p.HedgetCP)
    new SqlParameter("PendingPrice", p.PendingPrice)
    new SqlParameter("ClosedLot", p.ClosedLot)
    new SqlParameter("ClosedAmt", p.ClosedAmt)
    new SqlParameter("PendingAmt", p.PendingAmt)
    new SqlParameter("DrvPreminum", p.DrvPreminum)
    new SqlParameter("DrvExpiry", p.DrvExpiry.Ticks)
    new SqlParameter("DrvPeriod", p.DrvPeriod)
    new SqlParameter("DrvDirection", p.DrvDirection)
    new SqlParameter("DrvPrice", p.DrvPrice)
    new SqlParameter("DoubleCp", p.DoubleCp)
    new SqlParameter("ClearStatus", p.ClearStatus)
    new SqlParameter("FollowTicket", p.FollowTicket)
    new SqlParameter("Config", p.Config)
    new SqlParameter("OptionStatus", p.OptionStatus)
    new SqlParameter("NotionalPrincipal", p.NotionalPrincipal)
    new SqlParameter("ExercisedPrincipal", p.ExercisedPrincipal)
    new SqlParameter("ExerciseMode", p.ExerciseMode)
    new SqlParameter("ExercisePrice", p.ExercisePrice)
    new SqlParameter("ExternalTicketOpen", p.ExternalTicketOpen)
    new SqlParameter("ExternalTicketClose", p.ExternalTicketClose)
    new SqlParameter("ExternalTicketPending", p.ExternalTicketPending)
    new SqlParameter("ExternalTicketCancel", p.ExternalTicketCancel)
    new SqlParameter("Desc", p.Desc) |]

let db__TICKET = db__Rcd db__pTICKET

let TICKET_wrapper item: TICKET =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pTICKET_clone (p:pTICKET): pTICKET = {
    EndUser = p.EndUser
    TradeAcct = p.TradeAcct
    Ins = p.Ins
    Code = p.Code
    Caption = p.Caption
    TradeMode = p.TradeMode
    Lot = p.Lot
    PriceOpened = p.PriceOpened
    PriceOpen = p.PriceOpen
    PriceSL = p.PriceSL
    PriceTP = p.PriceTP
    PriceClose = p.PriceClose
    Status = p.Status
    CP = p.CP
    CptAcct = p.CptAcct
    Ref = p.Ref
    OpenRef = p.OpenRef
    CloseRef = p.CloseRef
    Origin = p.Origin
    PnL = p.PnL
    PnLSpread = p.PnLSpread
    Margin = p.Margin
    RO = p.RO
    Tax = p.Tax
    CloseType = p.CloseType
    CommitType = p.CommitType
    Cmt = p.Cmt
    Opendat = p.Opendat
    Closedat = p.Closedat
    CaStrategyAmt = p.CaStrategyAmt
    CaRo = p.CaRo
    CaAsa = p.CaAsa
    CaCmphsvCharge = p.CaCmphsvCharge
    RoCheckedat = p.RoCheckedat
    Expiry = p.Expiry
    HedgetCP = p.HedgetCP
    PendingPrice = p.PendingPrice
    ClosedLot = p.ClosedLot
    ClosedAmt = p.ClosedAmt
    PendingAmt = p.PendingAmt
    DrvPreminum = p.DrvPreminum
    DrvExpiry = p.DrvExpiry
    DrvPeriod = p.DrvPeriod
    DrvDirection = p.DrvDirection
    DrvPrice = p.DrvPrice
    DoubleCp = p.DoubleCp
    ClearStatus = p.ClearStatus
    FollowTicket = p.FollowTicket
    Config = p.Config
    OptionStatus = p.OptionStatus
    NotionalPrincipal = p.NotionalPrincipal
    ExercisedPrincipal = p.ExercisedPrincipal
    ExerciseMode = p.ExerciseMode
    ExercisePrice = p.ExercisePrice
    ExternalTicketOpen = p.ExternalTicketOpen
    ExternalTicketClose = p.ExternalTicketClose
    ExternalTicketPending = p.ExternalTicketPending
    ExternalTicketCancel = p.ExternalTicketCancel
    Desc = p.Desc }

let TICKET_update_transaction output (updater,suc,fail) (rcd:TICKET) =
    let rollback_p = rcd.p |> pTICKET_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,TICKET_table,TICKET_sql_update,pTICKET__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let TICKET_update output (rcd:TICKET) =
    rcd
    |> TICKET_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let TICKET_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment TICKET_id
    let ctime = DateTime.UtcNow
    match create (conn,output,TICKET_table,pTICKET__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> TICKET_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let TICKET_create output p =
    TICKET_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__TICKETo id: TICKET option = id__rcd(conn,TICKET_fieldorders,TICKET_table,db__TICKET) id

let TICKET_metadata = {
    fieldorders = TICKET_fieldorders
    db__rcd = db__TICKET 
    wrapper = TICKET_wrapper
    sps = pTICKET__sps
    id = TICKET_id
    id__rcdo = id__TICKETo
    clone = pTICKET_clone
    empty__p = pTICKET_empty
    rcd__bin = TICKET__bin
    bin__rcd = bin__TICKET
    sql_update = TICKET_sql_update
    rcd_update = TICKET_update
    table = TICKET_table
    shorthand = "ticket" }

let TICKETTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ex_Ticket' AND xtype='U')
    BEGIN

        CREATE TABLE Ex_Ticket ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[EndUser]
    ,[TradeAcct]
    ,[Ins]
    ,[Code]
    ,[Caption]
    ,[TradeMode]
    ,[Lot]
    ,[PriceOpened]
    ,[PriceOpen]
    ,[PriceSL]
    ,[PriceTP]
    ,[PriceClose]
    ,[Status]
    ,[CP]
    ,[CptAcct]
    ,[Ref]
    ,[OpenRef]
    ,[CloseRef]
    ,[Origin]
    ,[PnL]
    ,[PnLSpread]
    ,[Margin]
    ,[RO]
    ,[Tax]
    ,[CloseType]
    ,[CommitType]
    ,[Cmt]
    ,[Opendat]
    ,[Closedat]
    ,[CaStrategyAmt]
    ,[CaRo]
    ,[CaAsa]
    ,[CaCmphsvCharge]
    ,[RoCheckedat]
    ,[Expiry]
    ,[HedgetCP]
    ,[PendingPrice]
    ,[ClosedLot]
    ,[ClosedAmt]
    ,[PendingAmt]
    ,[DrvPreminum]
    ,[DrvExpiry]
    ,[DrvPeriod]
    ,[DrvDirection]
    ,[DrvPrice]
    ,[DoubleCp]
    ,[ClearStatus]
    ,[FollowTicket]
    ,[Config]
    ,[OptionStatus]
    ,[NotionalPrincipal]
    ,[ExercisedPrincipal]
    ,[ExerciseMode]
    ,[ExercisePrice]
    ,[ExternalTicketOpen]
    ,[ExternalTicketClose]
    ,[ExternalTicketPending]
    ,[ExternalTicketCancel]
    ,[Desc])
    END
    """


let db__pTACCT(line:Object[]): pTACCT =
    let p = pTACCT_empty()

    p.SAC <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.State <- EnumOfValue(if Convert.IsDBNull(line.[5]) then 0 else line.[5] :?> int)
    p.TradeType <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.RealDemo <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)
    p.PnL <- if Convert.IsDBNull(line.[8]) then 0.0 else line.[8] :?> float
    p.Frozen <- if Convert.IsDBNull(line.[9]) then 0.0 else line.[9] :?> float
    p.Leverage <- if Convert.IsDBNull(line.[10]) then 0.0 else line.[10] :?> float
    p.Margin <- if Convert.IsDBNull(line.[11]) then 0.0 else line.[11] :?> float
    p.MarginCallRateWarning <- if Convert.IsDBNull(line.[12]) then 0.0 else line.[12] :?> float
    p.MarginCallRateWarningII <- if Convert.IsDBNull(line.[13]) then 0.0 else line.[13] :?> float
    p.MarginCallRateLiq <- if Convert.IsDBNull(line.[14]) then 0.0 else line.[14] :?> float
    p.PwdTrade <- string(line.[15]).TrimEnd()
    p.PwdReadonly <- string(line.[16]).TrimEnd()
    p.Desc <- string(line.[17]).TrimEnd()

    p

let pTACCT__sps (p:pTACCT) = [|
    new SqlParameter("SAC", p.SAC)
    new SqlParameter("State", p.State)
    new SqlParameter("TradeType", p.TradeType)
    new SqlParameter("RealDemo", p.RealDemo)
    new SqlParameter("PnL", p.PnL)
    new SqlParameter("Frozen", p.Frozen)
    new SqlParameter("Leverage", p.Leverage)
    new SqlParameter("Margin", p.Margin)
    new SqlParameter("MarginCallRateWarning", p.MarginCallRateWarning)
    new SqlParameter("MarginCallRateWarningII", p.MarginCallRateWarningII)
    new SqlParameter("MarginCallRateLiq", p.MarginCallRateLiq)
    new SqlParameter("PwdTrade", p.PwdTrade)
    new SqlParameter("PwdReadonly", p.PwdReadonly)
    new SqlParameter("Desc", p.Desc) |]

let db__TACCT = db__Rcd db__pTACCT

let TACCT_wrapper item: TACCT =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pTACCT_clone (p:pTACCT): pTACCT = {
    SAC = p.SAC
    State = p.State
    TradeType = p.TradeType
    RealDemo = p.RealDemo
    PnL = p.PnL
    Frozen = p.Frozen
    Leverage = p.Leverage
    Margin = p.Margin
    MarginCallRateWarning = p.MarginCallRateWarning
    MarginCallRateWarningII = p.MarginCallRateWarningII
    MarginCallRateLiq = p.MarginCallRateLiq
    PwdTrade = p.PwdTrade
    PwdReadonly = p.PwdReadonly
    Desc = p.Desc }

let TACCT_update_transaction output (updater,suc,fail) (rcd:TACCT) =
    let rollback_p = rcd.p |> pTACCT_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,TACCT_table,TACCT_sql_update,pTACCT__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let TACCT_update output (rcd:TACCT) =
    rcd
    |> TACCT_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let TACCT_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment TACCT_id
    let ctime = DateTime.UtcNow
    match create (conn,output,TACCT_table,pTACCT__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> TACCT_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let TACCT_create output p =
    TACCT_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__TACCTo id: TACCT option = id__rcd(conn,TACCT_fieldorders,TACCT_table,db__TACCT) id

let TACCT_metadata = {
    fieldorders = TACCT_fieldorders
    db__rcd = db__TACCT 
    wrapper = TACCT_wrapper
    sps = pTACCT__sps
    id = TACCT_id
    id__rcdo = id__TACCTo
    clone = pTACCT_clone
    empty__p = pTACCT_empty
    rcd__bin = TACCT__bin
    bin__rcd = bin__TACCT
    sql_update = TACCT_sql_update
    rcd_update = TACCT_update
    table = TACCT_table
    shorthand = "tacct" }

let TACCTTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Market_TradeAcct' AND xtype='U')
    BEGIN

        CREATE TABLE Market_TradeAcct ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[SAC]
    ,[State]
    ,[TradeType]
    ,[RealDemo]
    ,[PnL]
    ,[Frozen]
    ,[Leverage]
    ,[Margin]
    ,[MarginCallRateWarning]
    ,[MarginCallRateWarningII]
    ,[MarginCallRateLiq]
    ,[PwdTrade]
    ,[PwdReadonly]
    ,[Desc])
    END
    """


let db__pBOOKMARK(line:Object[]): pBOOKMARK =
    let p = pBOOKMARK_empty()

    p.Agent <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.EndUser <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)
    p.BookmarkList <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Notes <- string(line.[9]).TrimEnd()
    p.Path <- string(line.[10]).TrimEnd()
    p.Group <- string(line.[11]).TrimEnd()
    p.Type <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64

    p

let pBOOKMARK__sps (p:pBOOKMARK) = [|
    new SqlParameter("Agent", p.Agent)
    new SqlParameter("EndUser", p.EndUser)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("BookmarkList", p.BookmarkList)
    new SqlParameter("Notes", p.Notes)
    new SqlParameter("Path", p.Path)
    new SqlParameter("Group", p.Group)
    new SqlParameter("Type", p.Type) |]

let db__BOOKMARK = db__Rcd db__pBOOKMARK

let BOOKMARK_wrapper item: BOOKMARK =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pBOOKMARK_clone (p:pBOOKMARK): pBOOKMARK = {
    Agent = p.Agent
    EndUser = p.EndUser
    Bind = p.Bind
    BindType = p.BindType
    BookmarkList = p.BookmarkList
    Notes = p.Notes
    Path = p.Path
    Group = p.Group
    Type = p.Type }

let BOOKMARK_update_transaction output (updater,suc,fail) (rcd:BOOKMARK) =
    let rollback_p = rcd.p |> pBOOKMARK_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,BOOKMARK_table,BOOKMARK_sql_update,pBOOKMARK__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let BOOKMARK_update output (rcd:BOOKMARK) =
    rcd
    |> BOOKMARK_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let BOOKMARK_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment BOOKMARK_id
    let ctime = DateTime.UtcNow
    match create (conn,output,BOOKMARK_table,pBOOKMARK__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> BOOKMARK_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let BOOKMARK_create output p =
    BOOKMARK_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__BOOKMARKo id: BOOKMARK option = id__rcd(conn,BOOKMARK_fieldorders,BOOKMARK_table,db__BOOKMARK) id

let BOOKMARK_metadata = {
    fieldorders = BOOKMARK_fieldorders
    db__rcd = db__BOOKMARK 
    wrapper = BOOKMARK_wrapper
    sps = pBOOKMARK__sps
    id = BOOKMARK_id
    id__rcdo = id__BOOKMARKo
    clone = pBOOKMARK_clone
    empty__p = pBOOKMARK_empty
    rcd__bin = BOOKMARK__bin
    bin__rcd = bin__BOOKMARK
    sql_update = BOOKMARK_sql_update
    rcd_update = BOOKMARK_update
    table = BOOKMARK_table
    shorthand = "bookmark" }

let BOOKMARKTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Bookmark' AND xtype='U')
    BEGIN

        CREATE TABLE Social_Bookmark ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Agent]
    ,[EndUser]
    ,[Bind]
    ,[BindType]
    ,[BookmarkList]
    ,[Notes]
    ,[Path]
    ,[Group]
    ,[Type])
    END
    """


let db__pSBL(line:Object[]): pSBL =
    let p = pSBL_empty()

    p.EndUser <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.Caption <- string(line.[5]).TrimEnd()
    p.Icon <- string(line.[6]).TrimEnd()
    p.Background <- string(line.[7]).TrimEnd()
    p.Desc <- string(line.[8]).TrimEnd()
    p.Privacy <- EnumOfValue(if Convert.IsDBNull(line.[9]) then 0 else line.[9] :?> int)
    p.Moment <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[11]) then 0 else line.[11] :?> int)

    p

let pSBL__sps (p:pSBL) = [|
    new SqlParameter("EndUser", p.EndUser)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("Background", p.Background)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Privacy", p.Privacy)
    new SqlParameter("Moment", p.Moment)
    new SqlParameter("Type", p.Type) |]

let db__SBL = db__Rcd db__pSBL

let SBL_wrapper item: SBL =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pSBL_clone (p:pSBL): pSBL = {
    EndUser = p.EndUser
    Caption = p.Caption
    Icon = p.Icon
    Background = p.Background
    Desc = p.Desc
    Privacy = p.Privacy
    Moment = p.Moment
    Type = p.Type }

let SBL_update_transaction output (updater,suc,fail) (rcd:SBL) =
    let rollback_p = rcd.p |> pSBL_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,SBL_table,SBL_sql_update,pSBL__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let SBL_update output (rcd:SBL) =
    rcd
    |> SBL_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let SBL_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment SBL_id
    let ctime = DateTime.UtcNow
    match create (conn,output,SBL_table,pSBL__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> SBL_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let SBL_create output p =
    SBL_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__SBLo id: SBL option = id__rcd(conn,SBL_fieldorders,SBL_table,db__SBL) id

let SBL_metadata = {
    fieldorders = SBL_fieldorders
    db__rcd = db__SBL 
    wrapper = SBL_wrapper
    sps = pSBL__sps
    id = SBL_id
    id__rcdo = id__SBLo
    clone = pSBL_clone
    empty__p = pSBL_empty
    rcd__bin = SBL__bin
    bin__rcd = bin__SBL
    sql_update = SBL_sql_update
    rcd_update = SBL_update
    table = SBL_table
    shorthand = "sbl" }

let SBLTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_BookmarkList' AND xtype='U')
    BEGIN

        CREATE TABLE Social_BookmarkList ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[EndUser]
    ,[Caption]
    ,[Icon]
    ,[Background]
    ,[Desc]
    ,[Privacy]
    ,[Moment]
    ,[Type])
    END
    """


let db__pFOLLOW(line:Object[]): pFOLLOW =
    let p = pFOLLOW_empty()

    p.EndUser <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.Followee <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.FollowType <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)

    p

let pFOLLOW__sps (p:pFOLLOW) = [|
    new SqlParameter("EndUser", p.EndUser)
    new SqlParameter("Followee", p.Followee)
    new SqlParameter("FollowType", p.FollowType) |]

let db__FOLLOW = db__Rcd db__pFOLLOW

let FOLLOW_wrapper item: FOLLOW =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pFOLLOW_clone (p:pFOLLOW): pFOLLOW = {
    EndUser = p.EndUser
    Followee = p.Followee
    FollowType = p.FollowType }

let FOLLOW_update_transaction output (updater,suc,fail) (rcd:FOLLOW) =
    let rollback_p = rcd.p |> pFOLLOW_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,FOLLOW_table,FOLLOW_sql_update,pFOLLOW__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let FOLLOW_update output (rcd:FOLLOW) =
    rcd
    |> FOLLOW_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let FOLLOW_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment FOLLOW_id
    let ctime = DateTime.UtcNow
    match create (conn,output,FOLLOW_table,pFOLLOW__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> FOLLOW_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let FOLLOW_create output p =
    FOLLOW_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__FOLLOWo id: FOLLOW option = id__rcd(conn,FOLLOW_fieldorders,FOLLOW_table,db__FOLLOW) id

let FOLLOW_metadata = {
    fieldorders = FOLLOW_fieldorders
    db__rcd = db__FOLLOW 
    wrapper = FOLLOW_wrapper
    sps = pFOLLOW__sps
    id = FOLLOW_id
    id__rcdo = id__FOLLOWo
    clone = pFOLLOW_clone
    empty__p = pFOLLOW_empty
    rcd__bin = FOLLOW__bin
    bin__rcd = bin__FOLLOW
    sql_update = FOLLOW_sql_update
    rcd_update = FOLLOW_update
    table = FOLLOW_table
    shorthand = "follow" }

let FOLLOWTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Follow' AND xtype='U')
    BEGIN

        CREATE TABLE Social_Follow ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[EndUser]
    ,[Followee]
    ,[FollowType])
    END
    """


let db__pMOMENT(line:Object[]): pMOMENT =
    let p = pMOMENT_empty()

    p.Agent <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.Lang <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Title <- string(line.[8]).TrimEnd()
    p.Summary <- string(line.[9]).TrimEnd()
    p.FullText <- string(line.[10]).TrimEnd()
    p.PreviewImgUrl <- string(line.[11]).TrimEnd()
    p.Link <- string(line.[12]).TrimEnd()
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.Question <- if Convert.IsDBNull(line.[14]) then 0L else line.[14] :?> int64
    p.State <- EnumOfValue(if Convert.IsDBNull(line.[15]) then 0 else line.[15] :?> int)
    p.Group <- if Convert.IsDBNull(line.[16]) then 0L else line.[16] :?> int64
    p.AutoTranslate <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.OriginalMoment <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.Postedat <- DateTime.FromBinary(if Convert.IsDBNull(line.[19]) then DateTime.MinValue.Ticks else line.[19] :?> int64)
    p.ContentBind <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.Keywords <- string(line.[21]).TrimEnd()
    p.Sticky <- if Convert.IsDBNull(line.[22]) then 0L else line.[22] :?> int64
    p.Protection <- EnumOfValue(if Convert.IsDBNull(line.[23]) then 0 else line.[23] :?> int)
    p.MediaType <- EnumOfValue(if Convert.IsDBNull(line.[24]) then 0 else line.[24] :?> int)
    p.UrlOriginal <- string(line.[25]).TrimEnd()
    p.OID <- string(line.[26]).TrimEnd()
    p.PostType <- EnumOfValue(if Convert.IsDBNull(line.[27]) then 0 else line.[27] :?> int)
    p.AudioUrl <- string(line.[28]).TrimEnd()

    p

let pMOMENT__sps (p:pMOMENT) = [|
    new SqlParameter("Agent", p.Agent)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("Title", p.Title)
    new SqlParameter("Summary", p.Summary)
    new SqlParameter("FullText", p.FullText)
    new SqlParameter("PreviewImgUrl", p.PreviewImgUrl)
    new SqlParameter("Link", p.Link)
    new SqlParameter("Type", p.Type)
    new SqlParameter("Question", p.Question)
    new SqlParameter("State", p.State)
    new SqlParameter("Group", p.Group)
    new SqlParameter("AutoTranslate", p.AutoTranslate)
    new SqlParameter("OriginalMoment", p.OriginalMoment)
    new SqlParameter("Postedat", p.Postedat.Ticks)
    new SqlParameter("ContentBind", p.ContentBind)
    new SqlParameter("Keywords", p.Keywords)
    new SqlParameter("Sticky", p.Sticky)
    new SqlParameter("Protection", p.Protection)
    new SqlParameter("MediaType", p.MediaType)
    new SqlParameter("UrlOriginal", p.UrlOriginal)
    new SqlParameter("OID", p.OID)
    new SqlParameter("PostType", p.PostType)
    new SqlParameter("AudioUrl", p.AudioUrl) |]

let db__MOMENT = db__Rcd db__pMOMENT

let MOMENT_wrapper item: MOMENT =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pMOMENT_clone (p:pMOMENT): pMOMENT = {
    Agent = p.Agent
    Bind = p.Bind
    BindType = p.BindType
    Lang = p.Lang
    Title = p.Title
    Summary = p.Summary
    FullText = p.FullText
    PreviewImgUrl = p.PreviewImgUrl
    Link = p.Link
    Type = p.Type
    Question = p.Question
    State = p.State
    Group = p.Group
    AutoTranslate = p.AutoTranslate
    OriginalMoment = p.OriginalMoment
    Postedat = p.Postedat
    ContentBind = p.ContentBind
    Keywords = p.Keywords
    Sticky = p.Sticky
    Protection = p.Protection
    MediaType = p.MediaType
    UrlOriginal = p.UrlOriginal
    OID = p.OID
    PostType = p.PostType
    AudioUrl = p.AudioUrl }

let MOMENT_update_transaction output (updater,suc,fail) (rcd:MOMENT) =
    let rollback_p = rcd.p |> pMOMENT_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,MOMENT_table,MOMENT_sql_update,pMOMENT__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let MOMENT_update output (rcd:MOMENT) =
    rcd
    |> MOMENT_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let MOMENT_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment MOMENT_id
    let ctime = DateTime.UtcNow
    match create (conn,output,MOMENT_table,pMOMENT__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> MOMENT_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let MOMENT_create output p =
    MOMENT_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__MOMENTo id: MOMENT option = id__rcd(conn,MOMENT_fieldorders,MOMENT_table,db__MOMENT) id

let MOMENT_metadata = {
    fieldorders = MOMENT_fieldorders
    db__rcd = db__MOMENT 
    wrapper = MOMENT_wrapper
    sps = pMOMENT__sps
    id = MOMENT_id
    id__rcdo = id__MOMENTo
    clone = pMOMENT_clone
    empty__p = pMOMENT_empty
    rcd__bin = MOMENT__bin
    bin__rcd = bin__MOMENT
    sql_update = MOMENT_sql_update
    rcd_update = MOMENT_update
    table = MOMENT_table
    shorthand = "moment" }

let MOMENTTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Moment' AND xtype='U')
    BEGIN

        CREATE TABLE Social_Moment ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Agent]
    ,[Bind]
    ,[BindType]
    ,[Lang]
    ,[Title]
    ,[Summary]
    ,[FullText]
    ,[PreviewImgUrl]
    ,[Link]
    ,[Type]
    ,[Question]
    ,[State]
    ,[Group]
    ,[AutoTranslate]
    ,[OriginalMoment]
    ,[Postedat]
    ,[ContentBind]
    ,[Keywords]
    ,[Sticky]
    ,[Protection]
    ,[MediaType]
    ,[UrlOriginal]
    ,[OID]
    ,[PostType]
    ,[AudioUrl])
    END
    """


let db__pLOG(line:Object[]): pLOG =
    let p = pLOG_empty()

    p.Location <- string(line.[4]).TrimEnd()
    p.Content <- string(line.[5]).TrimEnd()
    p.Sql <- string(line.[6]).TrimEnd()

    p

let pLOG__sps (p:pLOG) = [|
    new SqlParameter("Location", p.Location)
    new SqlParameter("Content", p.Content)
    new SqlParameter("Sql", p.Sql) |]

let db__LOG = db__Rcd db__pLOG

let LOG_wrapper item: LOG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pLOG_clone (p:pLOG): pLOG = {
    Location = p.Location
    Content = p.Content
    Sql = p.Sql }

let LOG_update_transaction output (updater,suc,fail) (rcd:LOG) =
    let rollback_p = rcd.p |> pLOG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,LOG_table,LOG_sql_update,pLOG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let LOG_update output (rcd:LOG) =
    rcd
    |> LOG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let LOG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment LOG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,LOG_table,pLOG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> LOG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let LOG_create output p =
    LOG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__LOGo id: LOG option = id__rcd(conn,LOG_fieldorders,LOG_table,db__LOG) id

let LOG_metadata = {
    fieldorders = LOG_fieldorders
    db__rcd = db__LOG 
    wrapper = LOG_wrapper
    sps = pLOG__sps
    id = LOG_id
    id__rcdo = id__LOGo
    clone = pLOG_clone
    empty__p = pLOG_empty
    rcd__bin = LOG__bin
    bin__rcd = bin__LOG
    sql_update = LOG_sql_update
    rcd_update = LOG_update
    table = LOG_table
    shorthand = "log" }

let LOGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Location]
    ,[Content]
    ,[Sql])
    END
    """


let db__pFUND(line:Object[]): pFUND =
    let p = pFUND_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Desc <- string(line.[5]).TrimEnd()
    p.Bind <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)

    p

let pFUND__sps (p:pFUND) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType) |]

let db__FUND = db__Rcd db__pFUND

let FUND_wrapper item: FUND =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pFUND_clone (p:pFUND): pFUND = {
    Caption = p.Caption
    Desc = p.Desc
    Bind = p.Bind
    BindType = p.BindType }

let FUND_update_transaction output (updater,suc,fail) (rcd:FUND) =
    let rollback_p = rcd.p |> pFUND_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,FUND_table,FUND_sql_update,pFUND__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let FUND_update output (rcd:FUND) =
    rcd
    |> FUND_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let FUND_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment FUND_id
    let ctime = DateTime.UtcNow
    match create (conn,output,FUND_table,pFUND__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> FUND_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let FUND_create output p =
    FUND_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__FUNDo id: FUND option = id__rcd(conn,FUND_fieldorders,FUND_table,db__FUND) id

let FUND_metadata = {
    fieldorders = FUND_fieldorders
    db__rcd = db__FUND 
    wrapper = FUND_wrapper
    sps = pFUND__sps
    id = FUND_id
    id__rcdo = id__FUNDo
    clone = pFUND_clone
    empty__p = pFUND_empty
    rcd__bin = FUND__bin
    bin__rcd = bin__FUND
    sql_update = FUND_sql_update
    rcd_update = FUND_update
    table = FUND_table
    shorthand = "fund" }

let FUNDTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Fund' AND xtype='U')
    BEGIN

        CREATE TABLE Trade_Fund ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Desc]
    ,[Bind]
    ,[BindType])
    END
    """


let db__pPORTFOLIO(line:Object[]): pPORTFOLIO =
    let p = pPORTFOLIO_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Desc <- string(line.[5]).TrimEnd()
    p.Fund <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)

    p

let pPORTFOLIO__sps (p:pPORTFOLIO) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Fund", p.Fund)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType) |]

let db__PORTFOLIO = db__Rcd db__pPORTFOLIO

let PORTFOLIO_wrapper item: PORTFOLIO =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pPORTFOLIO_clone (p:pPORTFOLIO): pPORTFOLIO = {
    Caption = p.Caption
    Desc = p.Desc
    Fund = p.Fund
    Bind = p.Bind
    BindType = p.BindType }

let PORTFOLIO_update_transaction output (updater,suc,fail) (rcd:PORTFOLIO) =
    let rollback_p = rcd.p |> pPORTFOLIO_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,PORTFOLIO_table,PORTFOLIO_sql_update,pPORTFOLIO__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let PORTFOLIO_update output (rcd:PORTFOLIO) =
    rcd
    |> PORTFOLIO_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let PORTFOLIO_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment PORTFOLIO_id
    let ctime = DateTime.UtcNow
    match create (conn,output,PORTFOLIO_table,pPORTFOLIO__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> PORTFOLIO_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let PORTFOLIO_create output p =
    PORTFOLIO_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__PORTFOLIOo id: PORTFOLIO option = id__rcd(conn,PORTFOLIO_fieldorders,PORTFOLIO_table,db__PORTFOLIO) id

let PORTFOLIO_metadata = {
    fieldorders = PORTFOLIO_fieldorders
    db__rcd = db__PORTFOLIO 
    wrapper = PORTFOLIO_wrapper
    sps = pPORTFOLIO__sps
    id = PORTFOLIO_id
    id__rcdo = id__PORTFOLIOo
    clone = pPORTFOLIO_clone
    empty__p = pPORTFOLIO_empty
    rcd__bin = PORTFOLIO__bin
    bin__rcd = bin__PORTFOLIO
    sql_update = PORTFOLIO_sql_update
    rcd_update = PORTFOLIO_update
    table = PORTFOLIO_table
    shorthand = "portfolio" }

let PORTFOLIOTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Porfolio' AND xtype='U')
    BEGIN

        CREATE TABLE Trade_Porfolio ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Desc]
    ,[Fund]
    ,[Bind]
    ,[BindType])
    END
    """


let db__pTRADER(line:Object[]): pTRADER =
    let p = pTRADER_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Desc <- string(line.[5]).TrimEnd()
    p.Fund <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.EndUser <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64

    p

let pTRADER__sps (p:pTRADER) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Fund", p.Fund)
    new SqlParameter("EndUser", p.EndUser) |]

let db__TRADER = db__Rcd db__pTRADER

let TRADER_wrapper item: TRADER =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pTRADER_clone (p:pTRADER): pTRADER = {
    Caption = p.Caption
    Desc = p.Desc
    Fund = p.Fund
    EndUser = p.EndUser }

let TRADER_update_transaction output (updater,suc,fail) (rcd:TRADER) =
    let rollback_p = rcd.p |> pTRADER_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,TRADER_table,TRADER_sql_update,pTRADER__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let TRADER_update output (rcd:TRADER) =
    rcd
    |> TRADER_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let TRADER_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment TRADER_id
    let ctime = DateTime.UtcNow
    match create (conn,output,TRADER_table,pTRADER__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> TRADER_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let TRADER_create output p =
    TRADER_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__TRADERo id: TRADER option = id__rcd(conn,TRADER_fieldorders,TRADER_table,db__TRADER) id

let TRADER_metadata = {
    fieldorders = TRADER_fieldorders
    db__rcd = db__TRADER 
    wrapper = TRADER_wrapper
    sps = pTRADER__sps
    id = TRADER_id
    id__rcdo = id__TRADERo
    clone = pTRADER_clone
    empty__p = pTRADER_empty
    rcd__bin = TRADER__bin
    bin__rcd = bin__TRADER
    sql_update = TRADER_sql_update
    rcd_update = TRADER_update
    table = TRADER_table
    shorthand = "trader" }

let TRADERTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Trader' AND xtype='U')
    BEGIN

        CREATE TABLE Trade_Trader ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Desc]
    ,[Fund]
    ,[EndUser])
    END
    """


type MetadataEnum = 
| ADDRESS = 0
| AIRPORT = 1
| BIZ = 2
| CAT = 3
| CITY = 4
| CRY = 5
| CUR = 6
| EU = 7
| FILE = 8
| FOLDER = 9
| LANG = 10
| LOCALE = 11
| CSI = 12
| CWC = 13
| INS = 14
| TICKET = 15
| TACCT = 16
| BOOKMARK = 17
| SBL = 18
| FOLLOW = 19
| MOMENT = 20
| LOG = 21
| FUND = 22
| PORTFOLIO = 23
| TRADER = 24

let tablenames = [|
    ADDRESS_metadata.table
    AIRPORT_metadata.table
    BIZ_metadata.table
    CAT_metadata.table
    CITY_metadata.table
    CRY_metadata.table
    CUR_metadata.table
    EU_metadata.table
    FILE_metadata.table
    FOLDER_metadata.table
    LANG_metadata.table
    LOCALE_metadata.table
    CSI_metadata.table
    CWC_metadata.table
    INS_metadata.table
    TICKET_metadata.table
    TACCT_metadata.table
    BOOKMARK_metadata.table
    SBL_metadata.table
    FOLLOW_metadata.table
    MOMENT_metadata.table
    LOG_metadata.table
    FUND_metadata.table
    PORTFOLIO_metadata.table
    TRADER_metadata.table |]

let init() =

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Address]") with
    | Some v ->
        let max = v :?> int64
        if max > ADDRESS_id.Value then
            ADDRESS_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Address]") with
    | Some v -> ADDRESS_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Airport]") with
    | Some v ->
        let max = v :?> int64
        if max > AIRPORT_id.Value then
            AIRPORT_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Airport]") with
    | Some v -> AIRPORT_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Biz]") with
    | Some v ->
        let max = v :?> int64
        if max > BIZ_id.Value then
            BIZ_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Biz]") with
    | Some v -> BIZ_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Cat]") with
    | Some v ->
        let max = v :?> int64
        if max > CAT_id.Value then
            CAT_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Cat]") with
    | Some v -> CAT_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_City]") with
    | Some v ->
        let max = v :?> int64
        if max > CITY_id.Value then
            CITY_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_City]") with
    | Some v -> CITY_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Country]") with
    | Some v ->
        let max = v :?> int64
        if max > CRY_id.Value then
            CRY_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Country]") with
    | Some v -> CRY_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Cur]") with
    | Some v ->
        let max = v :?> int64
        if max > CUR_id.Value then
            CUR_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Cur]") with
    | Some v -> CUR_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_EndUser]") with
    | Some v ->
        let max = v :?> int64
        if max > EU_id.Value then
            EU_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_EndUser]") with
    | Some v -> EU_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_File]") with
    | Some v ->
        let max = v :?> int64
        if max > FILE_id.Value then
            FILE_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_File]") with
    | Some v -> FILE_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Folder]") with
    | Some v ->
        let max = v :?> int64
        if max > FOLDER_id.Value then
            FOLDER_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Folder]") with
    | Some v -> FOLDER_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Lang]") with
    | Some v ->
        let max = v :?> int64
        if max > LANG_id.Value then
            LANG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Lang]") with
    | Some v -> LANG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Locale]") with
    | Some v ->
        let max = v :?> int64
        if max > LOCALE_id.Value then
            LOCALE_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Locale]") with
    | Some v -> LOCALE_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_SpecialItem]") with
    | Some v ->
        let max = v :?> int64
        if max > CSI_id.Value then
            CSI_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_SpecialItem]") with
    | Some v -> CSI_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_WebCredential]") with
    | Some v ->
        let max = v :?> int64
        if max > CWC_id.Value then
            CWC_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_WebCredential]") with
    | Some v -> CWC_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ex_Instrument]") with
    | Some v ->
        let max = v :?> int64
        if max > INS_id.Value then
            INS_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ex_Instrument]") with
    | Some v -> INS_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ex_Ticket]") with
    | Some v ->
        let max = v :?> int64
        if max > TICKET_id.Value then
            TICKET_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ex_Ticket]") with
    | Some v -> TICKET_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Market_TradeAcct]") with
    | Some v ->
        let max = v :?> int64
        if max > TACCT_id.Value then
            TACCT_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Market_TradeAcct]") with
    | Some v -> TACCT_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Social_Bookmark]") with
    | Some v ->
        let max = v :?> int64
        if max > BOOKMARK_id.Value then
            BOOKMARK_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Social_Bookmark]") with
    | Some v -> BOOKMARK_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Social_BookmarkList]") with
    | Some v ->
        let max = v :?> int64
        if max > SBL_id.Value then
            SBL_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Social_BookmarkList]") with
    | Some v -> SBL_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Social_Follow]") with
    | Some v ->
        let max = v :?> int64
        if max > FOLLOW_id.Value then
            FOLLOW_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Social_Follow]") with
    | Some v -> FOLLOW_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Social_Moment]") with
    | Some v ->
        let max = v :?> int64
        if max > MOMENT_id.Value then
            MOMENT_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Social_Moment]") with
    | Some v -> MOMENT_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Log]") with
    | Some v ->
        let max = v :?> int64
        if max > LOG_id.Value then
            LOG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Log]") with
    | Some v -> LOG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Trade_Fund]") with
    | Some v ->
        let max = v :?> int64
        if max > FUND_id.Value then
            FUND_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Trade_Fund]") with
    | Some v -> FUND_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Trade_Porfolio]") with
    | Some v ->
        let max = v :?> int64
        if max > PORTFOLIO_id.Value then
            PORTFOLIO_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Trade_Porfolio]") with
    | Some v -> PORTFOLIO_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Trade_Trader]") with
    | Some v ->
        let max = v :?> int64
        if max > TRADER_id.Value then
            TRADER_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Trade_Trader]") with
    | Some v -> TRADER_count.Value <- v :?> int32
    | None -> ()
    ()