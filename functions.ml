(* Anonyme Fuktionen *)
fun x -> x + 1 ;; 

(* Anonyme funktion kann auch an einen Bezeichner gebunden werden. *)
let x = fun x -> x + 1 ;;

x 1 ;;

(* - : int -> int = <fun> *)

(* <fun> Die spitzen Klammern bedeuten, dass dieser Wert nicht angezeigt werden kann. *)

(* - Beschreibt den namen der Funktion. Hier anonym. *)

(* int -> int Beschreibt den Definitionsbereich (Parameter) und den Wertebereich der Funktion. 
   Der rechteste Typ steht für den Rückgabewert. *)

(fun x -> x + 1) 10 ;; 
(* Klammern sind für die Anonyme Funktion wichtig, weil sonst kein Parameter übergegeb werden kann.*)

(fun x y -> (x +. y) /. 2.0 ) 4.7 2.6 ;;

(* Erstellen Sie eine anonyme Funktion von a' list nach a' list. => Aufruf ohne Übergabeparameter *) 

(fun xs -> match xs with 
| [] -> [] 
| xs :: rest -> xs :: rest) ;;

(* Named Functions *)

(* Anonyme Funktionen sind auch Werte und können somit an einen Bezeichner gebunden werden. *)
let inc1 = fun x -> x + 1 ;;

inc1 42 ;;

(* Die Schreibweise von FUnktionen kann auf folgende Weise vereinfacht werden. fun x -> kann dabei wegabstrahiert werden. *)
let inc2 x = x + 1 ;;

inc2 42 ;;

let avgOfTwo x y = (x +. y) /. 2. ;;

avgOfTwo 8. 4. ;;

(* Named functions = Syntactic Sugar *)

fun x -> x + 1 ;;

let newInc = fun x -> x + 1 ;;
(* Ausführen der Funktionen über Bezeichner "newInc" *)
newInc 1 ;;

(* Einacher Weg durch direkte Bindung an Bezeichner. *)
let newInc x = x + 1 ;;
(* Definition der anonymen Funktion kann wegabstrahiert werden. *)
newInc 1 ;;

(* let expression und in Äquivalenz und Syntactic Sugar *)
(fun x -> x + 1) 2 ;;
(* <=> *)
let x = 2 in x + 1 ;;

(* Beide Versionen haben eine unterschiedliche Syntax, aber beschreiben dieselbe Semantik. *)


(* Rekursive Funktionen *)

(* Fukaltät berechenen *)

(* Mit if-then-else *)
let rec factorial n = 
  if n = 0 then 1
  else n * factorial (n - 1) ;; (* Ohne (n-1) in klammern würde folgendes interpretiert werden: 
      n * (factorial n) - 1 ==> infinite Loop ==> StackOverflow error!*) 

factorial 3 ;;

(* Mit Pattern-Matching *)
let rec factorial2 n = match n with 
| 0 -> 1
| n -> n * factorial2 (n - 1) ;;

factorial2 3 ;;

(* Partielle Anwendung von Funktionen *)
let add x y = x + y ;;

add 2 3 ;; (* => 5 *)

let add2 = add 2 ;; (* => liefert eine neue Funktion int -> int ==> nimmt einen int Wert und addiert 2.*)

add2 3 ;;

(add 2) 3 ;; (* Der partielle Wert (add 2) wird jetzt auf die 3 angewendet und das Ergebnis ist der Wert 5.*)

(* Auf andere Weise kann die Sematik wie folgt beschrieben werden. *)

let add2 = add 2 ;;

add2 0 ;; (* => 2 *)

add2 10 ;; (* => 12 *)

(* 
   Ocaml hat somit nicht wirklich Funktionen mit mehreren Argumenten. 
   
   Es werden lediglich mehrere partielle Funktionen nacheinander angewendet.
*)

(* ==> Funktionen sind nur Values wie eingangs erwähnt. Wenn values funktionen ergeben, werden diese nacheinander als Values angewendet. *)

(* Indetitätsfunktion *)

let id x = x ;; 

id [1] ;;

let id (x: int) = (x: int) ;;

(* Frage was ist der Typ von id ??? *)

(* Ohne Operation kann hier durch Type Inferenz kein bestimmter Datentyp evaluiert werden. *)

(* Polymorphism - Java Generics *)


(* Funktionen als Operatoren *)

(* infix Operator <=> binary operator *)
1 + 2 ;;

(* Lässt sich auch in Prefix Notation anwenden. *)
( + ) (( + ) 1 2)  3 ;; 
(* Leerzeichen zwischen den Klammern um den Operator sind wichtig, d.h sonst wird z.B. Multiplikation als Kommentar interpretiert. *)
( * ) 2 2 ;; 

(* Gleichheits Operator => Polymorphic Equality *)
( = ) 2 2 ;; 

( < ) 1 2 ;;

(* Es gibt bereits eine integrierte Funktion max. Wie können wir eine eigene Funktion in infix Notation implementieren? *)
max 1 2 ;;

let ( <^> ) x y = max x y ;;

1 <^> 2 ;;

[1;] <^> [1;2] ;;

(* Prefix mit ( ) infix ohne ( ) *)

(* OCaml built-in Binary application Operators *)

(* Ocaml increment function *)
succ 1 ;; (* 1 + 1 => 2*)


(* Bindungsstärke von Funktionsanwendungen *)

succ 2 * 10 ;;

(* Wird ausgewertet als (succ 2) * 10 => (3) * 10 => 30 *)

(* Man könnte folgendes Ergebnis erwarten: succ 2 * 10 => 21 *)

(* Dazu müssen die Klammern wie folgt gesetzt werden: succ (2 * 10) *)

(* Erkenntnis: Eine Funktion bindet immer stärker als ein Operator! *)

(* Funktions-Anwendung mit speziellem Operator *)

succ @@ 2 * 10 ;; 

(* Hebt sozusagen stärkere Bindung von Funktionen auf und wertet den Ausdruck ohne Klammern aus. *)

(* Die Prezendenz ändert sich.*)

let square x = x * x ;;

(* Aktuell wenden wird die Funktion wie folgt an: *)
square 2 ;; (* => 4 *)

(* Etwas interessanter *)
square (succ 5) ;; (* => 36 *)

(* Klammern sind wichtig, weil sonst (square succ) 5 ausgewertet würde, was zu einem Fehler führt. *)

(* Lösung; Reverse Application Operator *)
5 |> succ |> square ;;

(* Like "Running a Value through a Pipeline" - Pipeline Operator*)