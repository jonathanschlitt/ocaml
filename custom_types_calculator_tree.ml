(* Taschenrechner *)

type aexp = 
| N of int (* N ist ein einstelliger Wertkonstruktor *)
| Var of char
| Sum of aexp * aexp
| Sub of aexp * aexp
| Mul of aexp * aexp
| Div of aexp * aexp ;;

let env = [('x', 5); ('y', 10)] ;;

let rec eval exp env = 
  match exp with
  | N exp -> exp
  | Var x -> List.assoc x env  
  | Sum(e1, e2) -> eval e1 env + eval e2 env (* liefert wert der Variablen, der dann verwendet wird. *)
  | Sub(e1, e2) -> eval e1 env - eval e2 env
  | Mul(e1, e2) -> eval e1 env * eval e2 env
  | Div(e1, e2) -> eval e1 env / eval e2 env
;;

let a1 = N 1 ;;
let a2 = N 2 ;;

let a4 = Sum (a1, Var 'y') ;;

eval a4 env ;;

(* Binärbäume *)

(* 'a steht für einen polymorph (generischer Typ in Java) *)
(* Also definieren wir einen Baum für alle möglichen Datentypen. *)

type 'a btree = 
| Empty (* Ein Empty steht für keinen Kindknoten  *)
| Node of 'a btree * 'a * 'a btree ;; (* Node beschreibt Eltern- und Kindknoten des Baumes und einen Wert des Knoten. *)

(* Definieren von möglichen Bäumen *)
let t1 = Node (Empty, 1, Empty) ;;

let t2 = Node(Node(Empty, 2, Empty), 1 , Node(Empty, 6, Empty)) ;;

(* Rekursive Funktion zum Berechnen der Summe aller Knoten mit einem in value. *)

let rec sum_tree t = 
  match t with 
  | Empty -> 0
  | Node(t1, x, t2) -> sum_tree t1 + x + sum_tree t2 ;;

sum_tree t2 ;;

(* Rekursive Funktion um alle knoten des Baumes als liste zurückzugeben. *)
let rec tree_to_list t = 
  match t with 
  | Empty -> []
  | Node(t1, x, t2) -> tree_to_list t1 @ [x] @ tree_to_list t2 ;;

tree_to_list t2 ;;