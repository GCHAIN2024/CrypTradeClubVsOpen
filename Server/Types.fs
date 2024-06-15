module Server.Types

open System

open Util.Zmq

type Host = {
fsDir: string }

type Runtime = {
host: Host
zweb: ZmqWeb
output: string -> unit }

