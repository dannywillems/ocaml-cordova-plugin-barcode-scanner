let t = Barcode_scanner.t () in
t#scan (fun r -> print_endline (r#text ^ r#format)) ()
