module Shared.Types

open System.Collections.Generic

open Util.Text
open Util.Json

open Shared.OrmTypes

//[TypeManaged]{

type pMomentExt = { 
p: pMOMENT
mutable MarkdownA: string
mutable MarkdownB: string }

type Album = {
sbl: SBL
items: List<MOMENT> }

type Error = 
| ApiNotExists
| InvalideParameter
| Internal

type Fact =
| Moment of MOMENT

type Msg = 
| Heartbeat
| ApiRequest of Json
| ApiResponse of Json
| SingleFact of Fact
| MultiFact of Fact[]


//}


