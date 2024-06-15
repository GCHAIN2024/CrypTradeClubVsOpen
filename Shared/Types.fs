﻿module Shared.Types

open Util.Text
open Util.Json

open Shared.OrmTypes

//[TypeManaged]{

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


