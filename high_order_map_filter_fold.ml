(* Alle Elemente einer Liste mit map quadrieren *)
let add lst = List.map (fun x -> x * x) lst ;;

add [1; 2; 3;] ;;

(* Ein bestimmtes Element aus einer Liste herausfiltern und neue Liste zurückgeben. *)

let filter lst = List.filter(fun x -> if x != 1 then true else false) lst ;;

filter [1; 2; 3;] ;; (* int list = [2; 3] *)

(* Alle Elemente einer Liste mit fold_left und mit fold_right aufaddieren. *)

let fold_left lst = List.fold_left (+) (0) lst ;;

fold_left [1; 2; 3;] ;;

(* fold_left mit einer ausgeschriebenen Funktion *)

let fold_left_func lst = List.fold_left (fun x acc -> x + acc) (0) lst ;;

fold_left_func [1; 2; 3;] ;;

(* Liste mit fold_right umdrehen *)

let fold_right lst = List.fold_right(fun x acc -> acc @ [x]) lst ([]) ;;

fold_right [1; 2; 3;] ;;

