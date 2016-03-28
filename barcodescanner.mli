(* -------------------------------------------------------------------------- *)
[@@@js.stop]
type encode_format

val encode_email          : encode_format
val encode_sms            : encode_format
val encode_text           : encode_format
val encode_phone          : encode_format

val encode_format_to_str  : encode_format -> string
[@@@js.start]

[@@@js.implem
type encode_format  =
    | Text
    | Phone
    | Email
    | Sms

let encode_text     = Text
let encode_phone    = Phone
let encode_email    = Email
let encode_sms      = Sms

let encode_format_to_str f = match f with
  | Text    -> "TEXT_TYPE"
  | Phone   -> "PHONE_TYPE"
  | Email   -> "EMAIL_TYPE"
  | Sms     -> "SMS_TYPE"
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class result : Ojs.t ->
  object
    inherit Ojs.obj

    method text       : string
    method format     : string
    method cancelled  : bool
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class barcode_scanner : Ojs.t ->
  object
    inherit Ojs.obj

    (* ---------------------------------------------------------------------- *)
    (* scan [success_callback] *)
    method scan       : (result -> unit) -> unit
    [@@js.call "scan"]
    (* scan [success_callback] [error_callback] *)
    method scan_err   : (result -> unit) ->
                        (string -> unit) ->
                        unit
    [@@js.call "scan"]
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    (* encore [type] [data] [success_callback] *)
    method encode     : string -> string ->
                        (string -> unit) ->
                        unit
    [@@js.call "encode"]
    (* encore [type] [data] [success_callback] [error_callback] *)
    method encode_err : string -> string ->
                        (string -> unit) ->
                        (string -> unit) ->
                        unit
    [@@js.call "encode"]
    (* ---------------------------------------------------------------------- *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> barcode_scanner
[@@js.get "cordova.plugins.barcodeScanner"]
(* -------------------------------------------------------------------------- *)
