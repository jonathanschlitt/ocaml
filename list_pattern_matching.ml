(* Aufgabe 1: Berechne die Länge einer Liste beliebigen Typs *)

let rec list_length lst = 
  match lst with 
  | [] -> 0
  | h::t -> 1 + list_length t ;;

list_length [1;2;3;4;5] ;;

(* Aufgabe 2: Addiere alle elemente einer Liste *)

let rec list_sum lst = 
  match lst with
  | [] -> 0
  | h::t -> h + list_sum t ;;

list_sum [1;2;3;4;5] ;;

(* Aufgabe 3: Quadriere alle Elemente einer Liste vom Typ Int *)
let rec list_quad lst = 
  match lst with 
  | [] -> []
  | h::t -> 
    let quad_elem = h * h in
    quad_elem :: list_quad t ;;

list_quad [1;2;3;4;5] ;;

(* Aufgabe 4: Addiere alle elemente von lst2 mit lst1. *)
let rec add_lists lst1 lst2 = 
    match (lst1, lst2) with
    | ([],[]) -> []
    | ([], _) -> failwith "Listen haben unterschiedliche Längen."
    | (_, []) -> failwith "Listen haben unterschiedliche Längen."
    | (x::xs, y::ys) -> (x + y) :: add_lists xs ys ;;

add_lists [1;2;3;4;5] [1;2;3;5;];;

(* Aufgabe 4: Addiere alle elemente von lst1, lst2 und lst3. *)
let rec add_lists_3 lst1 lst2 lst3 = 
  match (lst1, lst2, lst3) with
  | ([],[], []) -> []
  | ([], [], _) -> failwith "Listen haben unterschiedliche Längen."
  | (_, [], []) -> failwith "Listen haben unterschiedliche Längen."
  | ([], _, _) -> failwith "Listen haben unterschiedliche Längen."
  | (_, [], _) -> failwith "Listen haben unterschiedliche Längen."
  | (_, _, []) -> failwith "Listen haben unterschiedliche Längen."
  | (x::xs, y::ys, z::zs) -> (x + y + z) :: add_lists_3 xs ys zs;;

add_lists_3 [1;2;3;4;5] [1;2;3;4;5] [1;2;3;4;5];;

let list_of_lists = [[1,2]; [3,4]] ;;

(* Implemenentiere eine Funktion, die eine neue nicht verschachtelte liste zurückgibt.*)

let rec flatten_list lst =
  match lst with
  | [] -> []
  | head :: tail ->
    match head with
    | [] -> flatten_list tail
    | inner_list ->
      let rest = flatten_list tail in
      inner_list @ rest
;;

let list_of_lists = [[1; 2]; [3; 4]] ;;
let flattened_list = flatten_list list_of_lists ;;