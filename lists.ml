(* Listen *)
let type_list_int = [1;2;3] ;;

let type_list_string = ["Hello"; "World"; "!"]

(* Listen Operationen *)

(* Länge einer Liste *)
let len = List.length [1; 2; 3; 4] ;;

(* List Konkatenation *)
let concatenated = [1; 2] @ [3; 4] ;;

(* List Konkatenation z.B. für pattern matching *)
let list_concat = [1;2;3] :: [] ;;

let first_element = List.hd [1; 2; 3] ;;

let list_without_first = List.tl [1; 2; 3] ;;

let element = List.nth [1; 2; 3] 3 ;;

(* High order list functions *)

let doubled_list = List.map (fun x -> x * 2) [1; 2; 3] ;;

let even_numbers = List.filter (fun x -> x mod 2 = 0) [1; 2; 3; 4; 5] ;;

let sum = List.fold_left (fun acc x -> acc * x) 1 [1; 2; 3; 4; 5] ;;

let concatenated = List.fold_right (fun x acc -> x :: acc) [1; 2; 3] [] ;;

let reversed_list = List.rev [1; 2; 3] ;;

let sorted_list = List.sort compare [3; 1; 2] ;;

let list_of_lists = [[1,2]; [3,4]] ;;

(* Elemente einer Liste hinzufügen *)
1 :: [2; 3] ;; (* => [1;2;3]*)

(* Wir können die Liste auch auf folgende weise erstellen.*)

1 :: 2 :: 3 :: [] ;;

(* Listen sind als Linked-Lists implementiert. *)

let rec t x = match x with 
| [] -> []
| [_] -> []
| x :: xs -> [x] @ t xs;;

t [1;2;3] ;;
t [1;] ;;

let newList x = (x : 'a list) ;;

newList [1] ;;

t [(fun x -> x)] ;;

t [newList [newList [1]]] ;;

(* Funktion von 'a list nach 'a list *)

let f xs = match xs with
  | [] -> [] 
  | x::xs -> xs ;;

  (* Erstellen Sie eine anonyme Funktion von a' list nach a' list. => Aufruf ohne Übergabeparameter *) 

(fun xs -> match xs with 
| [] -> [] 
| xs :: rest -> xs :: rest) ;;

[(1,2,3,'4','5',"test")]