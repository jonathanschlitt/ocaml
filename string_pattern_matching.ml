let check_color color =
  match color with
  | "red" -> "The color is red"
  | "blue" -> "The color is blue"
  | "green" -> "The color is green"
  | _ -> "Unknown color"
;;

check_color "green" ;;

let process_email email =
  match String.split_on_char '@' email with
  | [name; domain] -> Printf.sprintf "Username: %s, Domain: %s" name domain
  | _ -> "Invalid email format"
;;

process_email "info@jonathanschlitt.de" ;;

let ist_vocal letter =
  match letter with
  | "a" | "e" | "i" | "o" | "u" -> true
  | _ -> false
;;

ist_vocal "e" ;;