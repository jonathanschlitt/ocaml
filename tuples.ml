(* Tupel, n-tupel *)

let type_tuple_int = (1,2) ;;

let type_tuple_string = ("Hello", "World")

let type_tuple_a = (2, "World")

let type_n_tuple = ("Hello", 1, 2.5, 1+4) ;;

(* Selbst definierte Tupel *)

(* Typ Tupel selbst definieren*)
type american_time = int * int * string ;; 

let t : american_time = (10, 10, "am") ;;

(* Typ mit "Type Inferenz" automatisch ermittelt *)
let p = (3.5, 2.5) ;;

(* Funktionen mit Tupeln (keine n-Tupel) *)

(* Erstes Element eines Tupels *)
fst p ;;

(* Zweites Element eines Tupels *)
snd p ;;