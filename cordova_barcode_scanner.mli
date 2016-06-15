(* -------------------------------------------------------------------------- *)
type encode_format  =
  | Text  [@js "TEXT_TYPE"]
  | Phone [@js "PHONE_TYPE"]
  | Email [@js "EMAIL_TYPE"]
  | Sms   [@js "SMS_TYPE"]
  [@@js.enum]

[@@@js.stop]
val encode_email          : encode_format
val encode_sms            : encode_format
val encode_text           : encode_format
val encode_phone          : encode_format
[@@@js.start]

[@@@js.implem
let encode_text     = Text
let encode_phone    = Phone
let encode_email    = Email
let encode_sms      = Sms
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type result = private Ojs.t

val result_text       : result -> string
[@@js.get "text"]

val result_format     : result -> string
[@@js.get "format"]

val result_cancelled  : result -> bool
[@@js.get "cancelled"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* scan [success_callback] ?[error_callback] *)
val scan   :  (result -> unit)                                        ->
              ?err_cb:((string -> unit) [@js.default (fun e -> ())])  ->
              unit                                                    ->
              unit
[@@js.global "cordova.plugins.barcodeScanner.scan"]

(* encode [type] [data] [success_callback] ?[error_callback] *)
val encode :  string                                                  ->
              string                                                  ->
              (string -> unit)                                        ->
              ?err_cb:((string -> unit) [@js.default (fun e -> ())])  ->
              unit                                                    ->
              unit
[@@js.global "cordova.plugins.barcodeScanner.encode"]
(* -------------------------------------------------------------------------- *)
