# ocaml-cordova-plugin-barcodescanner

Binding to
[cordova-plugin-barcodescanner](https://github.com/apache/cordova-plugin-barcodescanner)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-barcodescanner-example).

## What does cordova-plugin-barcodescanner do ?

```
This plugin defines a global navigator.barcodescanner object, which provides an API for
taking pictures and for choosing images from the system's image library.
```

Source: [cordova-plugin-barcodescanner](https://github.com/apache/cordova-plugin-barcodescanner)

## How to use ?

TODO

## ! BE CAREFUL !

The plugin creates a new object called *barcodeScanner*, but the object is
available when the *deviceready* event is handled.

We don't provide a *barcode_scanner* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *barcode_scanner* will be set to **undefined**
because the *barcodeScanner* object doesn't exist when we create the variable.

Instead, we provide a function *barcode_scanner* of type *unit -> barcode_scanner Js.t* which creates the
binding to the *barcodeScanner* object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready _ =
  let barcodescanner = Barcode_scanner.barcode_scanner () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
