(*  *)

let x = 
  match not true with
  | true -> "nope"
  | false -> "yep" ;;

(* Verwendung einer Pattern-Variable *)
let y =
  match 42 with 
  fooo -> fooo ;; 

  (* Verwendung einer Wildcard "_", wie ein Standardwert. *)
let z = 
  match "foo" with 
  | "bar" -> 0
  | _ -> 1 
;;

let a = 
  match [] with 
  | [] -> "empty"
  | _ -> "not empty" 
;;

let aa = 
  match (1,0) with
  | (x, 0) -> raise (Failure "y component is 0")
  | (0, y) -> raise (Failure "x component is 0")
  | (x, y) -> x + y ;;

let b =
  match ["taylor"; "swift"] with 
  | [] -> ["empty"]
  | x :: xs -> xs ;;

let rec bb lst = 
  match lst with
  | [] -> ":)"
  | x :: xs -> x ^ " " ^ bb xs ;;

bb ["taylor"; "swift"] ;;

let fst3 t = 
  match t with 
  | (a, b, c) -> a ;;

fst3 (1,2,3) ;;

(* Wann können wir function anstelle von match with schreiben? *)
let foo x y =
  match y with
  | 0 -> "Zero"
  | 1 -> "One"
  | _ -> "Other" ;;

foo 1 2;;

let foo x =
  function
  | 0 -> "Zero"
  | 1 -> "One"
  | _ -> "Other" ;;

foo 1 1;;

(* Das Function Keyword matched gegen das letzte Argument einer Funktion, was nicht explizit angegeben werden muss. *)
