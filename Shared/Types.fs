module Shared.Types

open Shared.OrmTypes

//[TypeManaged]{

type Fact =
| Moment of MOMENT

type Api = 
| Signup

type Msg = 
| Heartbeat
| ApiRequest of Api
| ApiResponse of Api
| SingleFact of Fact
| MultiFact of Fact[]


//}


