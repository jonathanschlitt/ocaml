
let my_string = "Hello World!" ;;

(* String Konkatenation *)
let hello_world = "Hello " ^ "World" ^ "!" ;;

(* Länge *)
let length = String.length "Hello, world!" ;;

(* String chart at index *)
let first_char = String.get "Hello" 0 ;;

(* Substring *)
let substring = String.sub "Hello, world!" 0 5 ;;

(* String Module Konkatenation *)
let concatenated = String.concat ", " ["Hello"; " world"; "!"] ;;

(* Whitespaces eines Strings entfernen *)
let trimmed = String.trim "  Hello, world!  " ;;

(* String Split on specific character into a List *)
let substrings = String.split_on_char ',' "Hello,world,!" ;;

let uppercase = String.uppercase_ascii "Hello, world!" ;;

let lowercase = String.lowercase_ascii "Hello, world!" ;;

let rec findAndReplace x y z =
  let len_x = String.length x in
  let len_y = String.length y in
  let rec replace_pos pos =
    if pos + len_y > len_x then
      x
    else if String.sub x pos len_y = y then
      String.concat "" [String.sub x 0 pos; z; String.sub x (pos + len_y) (len_x - pos - len_y)]
    else
      replace_pos (pos + 1)
  in
  if len_y = 0 then
    x
  else
    replace_pos 0
  ;;

  let result = findAndReplace "Hello, World!" "World" "Universe" ;;
  print_endline result ;;  (* Ausgabe: "Hello, Universe!" *)


  let rec printCharsOfString s pos =
    let len = String.length s in
    if pos < len then (
      print_char (String.get s pos);
      print_newline (); (* Neue Zeile für jedes gelesene Zeichen *)
      printCharsOfString s (pos + 1)
    )
;;  
    
let my_string = "abcdefghijklmnopqrstuvwxyz" in
printCharsOfString my_string 0 ;;

let rec print_numbers_in_range min max = 
  print_newline ();
  if min <= max then (
    print_int min;
    print_newline ();
    print_numbers_in_range (min + 1) max
  ) else () ;;

print_numbers_in_range 0 15 ;;

