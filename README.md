# ocaml-cordova-plugin-barcodescanner

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-barcode-scanner/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-barcode-scanner.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-barcode-scanner)

Binding to
[cordova-plugin-barcodescanner](https://github.com/apache/cordova-plugin-barcodescanner)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-barcode-scanner-example).

## What does cordova-plugin-barcodescanner do ?

```
This plugin defines a global navigator.barcodescanner object, which provides an API for
taking pictures and for choosing images from the system's image library.
```

Source: [cordova-plugin-barcodescanner](https://github.com/apache/cordova-plugin-barcodescanner)

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

* if you added
[ocaml-cordova-plugin-list](https://github.com/dannywillems/ocaml-cordova-plugin-list)
as opam package provider, you can use
```
opam install cordova-plugin-barcode-scanner
```

* Else, you can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-barcode-scanner https://github.com/dannywillems/ocaml-cordova-plugin-barcode-scanner.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-barcode-scanner [...] -linkpkg [other arguments]
```

Don't forget to install cordova-plugin-barcodescanner with
```Shell
cordova plugin add cordova-plugin-barcodescanner
```

## How to use ?

See the official documentation
[cordova-plugin-barcodescanner](https://github.com/phonegap/phonegap-plugin-barcodescanner)
