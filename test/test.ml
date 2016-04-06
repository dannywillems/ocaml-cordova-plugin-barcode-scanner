let t = Barcode_scanner.t () in t#scan (fun r -> r#text ^ r#format) ()
