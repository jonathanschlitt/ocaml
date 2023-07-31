(* Referenzen in Ocaml *)

(* einfache Variable, welche einem Bezeichner zugewiesen wurde. *)
let x = 42 ;;

(* liefert uns die Referenz im Speicher zum Wert von x *)
ref x ;;

(* Es wird ein Speicherbereich reserviert, welchem die Zahl 100 zugewiesen wird. *)
(* y wird als Bezeichner definiert und zeigt (hat eine Referenz) auf den Speicherbereich. *)
let y = ref 100 ;;

(* Um den Wert des Zeigers anzuzeigen, muss ein "!" vor den Namen des Bezeichners gesetzt werden. *)
!y ;;

(* Rechnen mit Referenzen ist über "!" möglich. *)
x + !y ;;

(* Verändern des Wertes im Speicher eines Pointers. *)

y := 200 ;;

(* Jetzt haben wir den Wert des Pointers y auf 200 gesetzt. *)

!y ;;

(* Wir haben gesehen, dass wir jeden Datentyp mit dem Keyword "ref" als Referenzdatentyp verwenden können. *)

