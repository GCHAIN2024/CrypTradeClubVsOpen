module Shared.Types

open System
open System.Collections.Generic

open Util.Text
open Util.Json

open Shared.OrmTypes

//[TypeManaged]{

type MomentComplex = {
m: MOMENT }

type InsComplex = {
follows: Dictionary<int64,FOLLOW>
ins: INS }

type EuComplex = {
arbitrages: Dictionary<int64,ARBITRAGE>
follows: Dictionary<int64,FOLLOW>
eu: EU }

type BizComplex = {
biz: BIZ
mcs: Dictionary<int64,MomentComplex> }


type Album = {
sbl: SBL
items: List<MOMENT> }

type FactMediaPlayer = {
moment: MOMENT
albumIDs: int64[]
serverTimestamp: DateTime }

type FactBroadcast =
| MediaPlayer of FactMediaPlayer


type Fact =
| Moment of MOMENT

type Msg = 
| Heartbeat
| ApiRequest of Json
| ApiResponse of Json
| SingleFact of Fact
| MultiFact of Fact[]

type Er = 
| ApiNotExists
| InvalideParameter
| Unauthorized
| Internal

//}


