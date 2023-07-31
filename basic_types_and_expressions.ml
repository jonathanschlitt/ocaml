print_string "Hello World" ;;

(* Basis Operationen *)

(* Arithmetische Funktionen: int *)

2 + 3 ;;

3 - 2 ;;

4 / 2 ;;

3 * 2 ;;

3 mod 2 ;;

1 <= 2 ;;

1 < 2 ;;

1 > 2 ;;

1 >= 2 ;;

(* Arithmetische Funktionen: float *)

2.0 +. 3.75 ;;

3.0 -. 2.5 ;;

4.2 /. 2.0 ;;

3.0 *. 0.5 ;;

(* Potenzieren (quadrieren)*)
2.**2. ;;

(* Quadratwurzel *)
9.**(1. /. 2.) ;;

(* Type Casting *)
float_of_int (3) ;;

int_of_float(float_of_int (3)) ;;

(* Variablen bzw. Definitions *)

(* Arithmetische Operationen mit Variablen bzw. Expressions *)
let int_num1 = 2 ;;

int_num1 ;; (* Wort wurde an den Namen bzw. Indentifier gebunden und kann später verwendet werden. *)

let int_num2 = 3 ;;

int_num1 + int_num1 ;;

let float_num1 = 2.9 ;;

let float_num2 = 3.1 ;;

float_num1 +. float_num1 ;;

(* Datentypen *)

(* Int *)
let type_int = 42 ;;

(* Float *)
let type_float = 3.14 ;;

(* String *)
let type_string = "Hello World!" ;;

let type_boolean = true ;;

(* Type Annotationen - Explizite Type Deklaration *)
(3110 : int) ;; 


(* If Expressions *)

if "batman" > "superman" then "yay" else "boo" ;; (* Strings are in dictionary order *)

(* Nicht funktionierende Statements *)

(* if 0 then "yay" else "boo" ;; Typ bool erwartet  *)

(* if true then "yay" else 1 ;; Return Values müssen denselben Typ haben. *)

(* if true then 1 ;; Nur if ... then ... else ... (Kein if ohne else ) *)

(* let Expressions *)

let int_num1 = 2 ;;

int_num1 ;; (* Wort wurde an den Namen bzw. Bezeichner gebunden und kann später verwendet werden. *)

let a = 1 in a ;; (* Scope nur innerhalb des Ausdruckes *)

(* a ;; a wird nicht gebunden in Verbindung mit Schlüsselwort in *)

let b = 1 in 2 * b ;; (* Erst Auswertung von b = 1, dann von 2 * b*)

(* in keyword *)
let var1 = 8 in var1 * var1 ;;

let x = 1 + 4 in x * 3 ;;

let c = 3 in (let d = 4 in c + d) ;; (* ==> 7 *)


(* let e = 5 in (let e = 6 in e) ;; *)

let x = 1 ;; (* Reserviert speicher für den Wert 1 *)

let x = 2 ;; (* Überschreibt nicht den Wert 1, sondern reserviert neuen Speicher für den Wert 2 und referenziert ihn mit dem Bezeichner x *)
