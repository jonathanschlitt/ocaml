(* 
    Ocaml Basics 
*)

print_string "Hello World" ;;

2 + 1 ;;

2 - 3 ;;

2 * 6 ;;

6 / 3 ;;

(* Float numbers operators *)
2.5 +. 3.0 ;;

1.0 -. 0.99 ;;

2.0 *. 0.5 ;;

1.0 /. 3.0 ;;

3 mod 2 ;;

(*  *)

(* 1 + "hello" ;; ==> This expression has type string but an expression was expected of type int *)

3 / 0 ;; (* Exception: Division_by_zero. *)

(* Variables *)
let x = 77 ;;

let myString = "Hello!" ;;

let myChar = 'a' ;;

let myBool = true ;;

let myFloat = 3.14 ;;

print_float myFloat ;;

(* Schlüsselwort in ==> *)
let var = 8 in var * var ;;

(* var ;; 
   ==> Error: Unbound value var 
   ==> Variable wurde nicht deklariert, sondern nur für den Ausdruck var * var verwendet.
*)

let x = 1 + 4 in x * 3 ;; (* ==> 15 *)

let a = 1 in
  let b = 2 in
    a + b;; (* ==> 3 *)

(* Listen und Tupel *)

let intList = [1; 2; 3; 4; 5;] ;;

let stringList = ["test 1"; "test 2"; "test 3";] ;;

let intTuple = (1,2,3) ;;

(* Werte von Tupeln erhalten *)
let tupel = (1,2) ;;
fst tupel ;; (* ==> 1*)
snd tupel ;; (* ==> 2*)

(* Werte von n-Tupeln mit pattern matching erhalten. *)
let nTupel = (1,2,3) ;;

match nTupel with | 
(x,y,z) -> print_endline ("x: " ^ string_of_int x ^ ", y: " ^ string_of_int y ^ ", z: " ^ string_of_int z) ;;

let tupleList = [(1,2); (2,2); (2,1)] ;;

(* Funktionen *)
let increment x = x + 1 ;;
increment 1 ;; 
(* Return ist int wegen type inferenz ==> Wert wird automatisch bestimmt *)

let incFun = fun x -> x + 1 ;;
incFun 41 ;;

(* Funktion int -> int -> int -> int *)
let intFun x y z = x * y * z ;;

let test x y = x + y ;;

(* Funktionen mit typisierten Parametern und Rückgabewerten *)
let incrementFloat (x: float) : float = (* Typisierung nicht notwendig, aber möglich *)
  x +. 1.0 ;; 

incrementFloat 4.7 ;;

let add x y = x + y ;; (* also possible (x: int) (y: int) : int *)

(* val add : int -> int -> int = <fun> ==> Funktion bzw. Ausdruck nimmt zwei integer entgegen und gibt einen Integer Wert zurück. *)

add 3 7 ;;

(* prüfen, ob zahlen aufsteigend sortiert sind *)
let ordered a b c =
  a <= b && b <= c ;;

ordered 1 1 2 ;;


(* Parametriesierter Polymorphismus *)
let f = fun _ -> 1 ;; (* Wildcard Funktion ==> liefert für jeden Parameter immer 1!*)

let f = fun _ -> 1 ;;

f  (true, []) ;; (* ==> 1 *)

f (([1;2;3;3], 22), 42) ;; (* ==> 1 *)

(* 
    Rekursion in Ocaml   
*)

(* Write a function Power that takes in a power n and a float x and return x^n *)
let rec power x n =
  if n = 0 then 1.0 else 
    if n = 1 then x else
      power x (n-1) *. x;;

power 2. 4 ;;

(* Calculate Square number *)
let square x = power x 2 ;;

square 8. ;;

(* Calculate faculty *)
let rec fac n = 
  if n = 0 then 1 else 
    fac (n-1) * n ;;

fac 3 ;;

(* fibonacci *)
let rec fib n =
  if n = 0 then 1 else 
    if n = 1 then 1 else
      fib (n-2) + fib(n-1) ;;

fib 0 ;;
fib 1 ;;
fib 2 ;;
fib 3 ;;
fib 4 ;;
fib 5 ;;

(* Fibonacci with pattern matching  *)

let rec fibo (n: int) : int = match n with
| 0 -> 1
| 1 -> 1
| _ -> fibo (n-2) + fibo (n-1) ;; (* _ ==> catch all (Wildcard) kann als else für Pattern Matching angesehen werden. *)

fibo 0 ;;
fibo 1 ;;
fibo 2 ;;
fibo 3 ;;
fibo 4 ;;
fibo 5 ;;


(* Collatz if n mod 2 = 0 then n / 2 else 3n + 1  *)
let rec col n =
  if n = 1 then
    (print_int n; print_newline (); 1) else
      if n mod 2 = 0 then 
        let res = col (n / 2) in 
          (print_int n ; print_newline () ; res) else
          let res = 3 * col (n + 1) in 
            (print_int n ; print_newline () ; res) ;;

col 19 ;;

(* write a function that calculates the greatest commmon devisor of two positive integers *)
let rec ggt x y = 
  if x = y then x else 
    if x = 0 then 0 else if y = 0 then 0 else 
      ggt y (y mod y) ;;

ggt 16 18 ;;

let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b) ;;

  gcd 12 4 ;;
  gcd 4 12 ;;


(* 
  Listen und pattern matching   
*)

[] ;; (* 'a list ==> List von allen Möglichen Datentypen (z.B. Object in Java ) *)

(* Elemente zu einer Liste hinzufügen *)

2 :: [] ;; (* ==> int list = [2] *)

2 :: 3 :: [] ;;

"Hello" :: "World" :: [] ;;

(* "Hello" :: 1 :: [] ;; ==> Error: This expression has type int but an expression was expected of type string *)

(* Listen mit verschiedenen Datentypen *)

("Jonathan", 1) :: ("Wagner", 2) :: ("Kreiker", 3) :: [] ;; (* ==> (string * int) list = [("Jonathan", 1); ("Wagner", 2); ("Kreiker", 3)] *)

let int_list = [2; 3; 4;] ;;

(* 1 vorne einfügen *)
1 :: int_list ;;

let int_list = 1 :: int_list ;;

(* Listen und Pattern Matching *)

(* Write an Ocaml function all_true which returns true if all elements of a list are true. *)
let rec all_true (lst: bool list) : bool = 
  match lst with 
  | [] -> true (* Liste ist leer *)
  | x :: [] -> if x = true then true else false (* Liste mit einem Element x *)
  | x :: rest -> x && all_true rest ;; (* Ein element der Liste plus rest-Liste oder [] *)

all_true [true] ;;
all_true [true; true; true] ;;
all_true [true; false; true] ;;

(* Write a function even2ways that checks if an integer list only contains even values and has an even number of elements *)
let is_even (x: int) : bool = x mod 2 = 0 ;;

let rec even2ways (lst: int list ) : bool = 
  match lst with
  | [] -> true
  | x :: [] -> false
  | x1 :: x2 :: rest -> is_even x1 && is_even x2 && even2ways rest ;; 

even2ways [2; 4; 6 ; 8] ;;
even2ways [2] ;;
even2ways [2; 2] ;;
even2ways [1; 1] ;;
even2ways [2; 4; 6] ;;
even2ways [] ;;

(* write a function is_empty that returns true if the list is empty and otherwise false *)
let is_empty lst = match lst with (* let is_empty (lst: 'a list) : bool = ...*)
| [] -> true
| x :: rest -> false ;; (* _ -> false ==> Mit Wildcard in Form von _ *)

is_empty [2; 3; 4;] ;;
is_empty [] ;;
is_empty [[(1,2)]] ;;

(* write an Ocaml function named head that returns the front element of a list *)
let head (lst: 'a list) : 'a = match lst with 
| x :: _ -> x (* rest ist auch möglich !*)
| _ -> raise (Invalid_argument "head: list is empty!") ;; (*[] ist auch möglich*)

head [1; 2; 3; 4;] ;;
head [] ;;
head [[(1,2)]] ;;

(* write a function that adds up all the numbers in an Integer list *)
let rec addNums (lst: int list) : int = match lst with
| [] -> 0 
| x :: rest -> x + addNums rest ;;

addNums [1; 2] ;;
addNums [1] ;;
addNums [] ;;

(* Write a function that finds the smallest element in a list *)
let rec findSmallest (lst: int list) : int = 
match lst with
| [] -> raise (Invalid_argument "List is empty.")
| x :: [] -> x
| x :: rest -> if x < findSmallest rest then x else findSmallest rest ;;

findSmallest [1; 2; 3; 4;] ;;
findSmallest [1] ;;
findSmallest [] ;;

(* Write a function that adds two lists to one. *)
(* let addLists (lst1: 'a list) (lst2: 'a list) : 'a list = lst1 @ lst2 ;; *)
let rec addLists (xs: 'a list) (ys: 'a list) : 'a list = match xs with 
  | [] -> ys
  | x :: [] -> x :: ys
  | x :: rest -> x :: (addLists rest ys) ;;

addLists [1; 2; 3; 4;] [5; 6; 7;] ;;

(* Write a function that determines if the value is in a list or not *)
let rec findValue (lst: 'a list) (value: 'a) : bool = match lst with 
| [] -> false
| x :: rest ->if value = x then true else findValue rest value;;

findValue [1; 2; 3; 4] 4 ;;
findValue [1; 2; 3; 4] 0 ;;
findValue [] 0 ;;
findValue [[(1,2)]] [(1,2)] ;;
findValue [true; false; false] true ;;
findValue [false; false; false] true ;;

(* Write a function that uses the string concatenation operator ^ to add the string ! to the end of each string in the input list. *)
let rec addString (lst: string list) : string list = match lst with 
| [] -> [] 
| x :: [] -> (x ^ "!") :: []
| x :: rest -> (x ^ "!") :: (addString rest) ;;

addString ["test 1"; "test 2"; "test 3";] ;;


(* Write a function that will compute the length of string in the input list. Return
   the tuple (pair) list with each pair containing the (string, length of string) *)

let rec calcInputStringsLength (lst: string list) : 'a list = match lst with 
| [] -> []
| x :: rest -> (x, String.length x) :: (calcInputStringsLength rest) ;;

calcInputStringsLength ["t"; "te"; "tes"; "test"; "test "; "test 1"; "test 2"; "test 3";] ;;


(* Write a function that takes a list of pairs and unzips them into a pair of lists. *)
let rec unzipListPairs (lst: ('a * 'b) list) : ('a list * 'b list) = match lst with 
| [] -> ([],[])
| (x, y) :: rest -> (x :: (fst (unzipListPairs rest)), y :: (snd (unzipListPairs rest))) ;;

unzipListPairs [("t", 1); ("te", 2); ("tes", 3); ("test", 4); ("test ", 5); ("test 1", 6); ("test 2", 6); ("test 3", 6)] ;;


(* 
    High Order Listen-Funktionen   
*)

(* List.map  *)
List.map ;;

(* List.filter *)
List.filter ;;

(* List.fold_left *)
List.fold_left ;;

(* List.fold_right *)
List.fold_right ;;

(* List.assoc *)

(* 
  MAP
*)

(* Write a function that uses the string concatenation operator ^ to add the ! to the end of each string in the input list (no recursion) *)
let concat_exclaim (s: string) : string = s ^ "!" ;;

(* Verwendung einer Hilfsfunktion *)
let concatStringMap (lst: string list) : string list =
  List.map concat_exclaim lst ;;

(* Explizit mit Callback *)
(* let concatStringMap (lst: string list) : string list =
  List.map(fun x -> x ^ "!") lst ;; *)

concatStringMap ["test 1"; "test 2"; "test 3"] ;;
concatStringMap [] ;;

(* Write a function that capitalises each string in a list. (use String.capitalize_ascii) *)
let capitalizeStrings (lst: string list) : string list = List.map(fun x -> String.capitalize_ascii x) lst ;;

capitalizeStrings ["test 1"; "test 2"; "test 3"] ;;

(* Write a function that squares every element in a list *)
let squareList (lst: int list) : int list = List.map(fun x -> x * x) lst ;;

squareList [1; 2; 3; 4; 5; 16] ;;

(* 
  FILTER
*)

(* Write a function that returns the odd integers in a list of integers *)
let oddIntegers (lst: int list) : int list = List.filter(fun x -> x mod 2 != 0) lst ;;

oddIntegers [1; 2; 3; 4; 5] ;;

(* Write a function that only returns capitalized strings in a string list 
   (use String.get to extract first character from a string, check uppercase with Char.uppercase_ascii) *)

let getCapitalizedStrings (lst: string list) : string list = 
  List.filter(fun x -> (String.get x 0) = (Char.uppercase_ascii (String.get x 0))) lst ;;

getCapitalizedStrings ["test"; "Test 1"; "Test 2"; "Test 3"] ;;

(* 
  FOLD_LEFT & FOLD_RIGHT
*)

(* Write a function that adds up all the numbers in an integer list *)
let addNumsLeft (lst: int list) : int = List.fold_left (+) (0) lst ;;

addNumsLeft [1; 2; 3; 4; 5] ;; 

let addNumsRight (lst: int list) : int = List.fold_right (+) lst 0 ;;

addNumsRight [1; 2; 3; 4; 5] ;; 

(* Write a function (without recursion) that takes in any list and returns the length of the list *)
   
(* let f (leght_so_far: int) (x: 'a) : int = leght_so_far + 1 ;; *)
(* let listLengthFold (lst: 'a list) : int = List.fold_left f 0 lst ;; *)

let listLengthFold (lst: 'a list) : int = List.fold_left(fun length_so_far x -> length_so_far + 1) 0 lst ;;

listLengthFold [1; 2; 3; 4; 5] ;;
listLengthFold [true; true; false] ;;
listLengthFold [] ;;

(* Write a function that takes in a list of integers. This function will return
   the sum of the even positions (indices) in the list *)

let sumEvenIndices (lst: int list) : int = 
  let f (sum, position) (element) = 
    if position mod 2 = 0 then (sum + element, position + 1) 
    else (sum, position + 1) in
  match List.fold_left f (0,0) lst with
  (sum, pos) -> sum ;;

sumEvenIndices [1; 2; 3; 4; 5] ;;

(* productf: function multiplies all the numbers in a float list 
   function satisfies product (l1 @ l2) = productf l1 *. productf l2 *)

let productf (lst: float list) : float = List.fold_left ( *. )  1. lst ;;

productf [1.; 2.; 3.; 4.; 5.] ;;

(* findMin: functions finds the smallest element in the list *)
(* let findMin (lst: 'a list) : 'a = 
  let f min_so_far element = 
    if min_so_far < element then min_so_far else element
  in
   List.fold_left f max_float lst ;;
  
  findMin [1.; 2.; 3.; 4.; 5.] ;; *)

let findMin (lst: 'a list) : 'a = 
  let f min_so_far element = 
    if min_so_far < element then min_so_far else element
  in match lst with 
  | [] -> raise(Invalid_argument "list is empty") 
  | e :: rest -> List.fold_left f e lst ;;
  
findMin [1.; 2.; 3.; 4.; 5.] ;;
findMin [99; 2; 3; 4; 5; -11] ;;

(* suffix: function uses string concatenation operator ^ to add 
   the string "!" to the end of each string in the input list *)

let suffix (lst: string list) : string list = List.map(fun s -> s ^ "!") lst ;;

suffix ["test"; "Test 1"; "Test 2"; "Test 3"] ;;

(* 
  Eigene Datentypen definieren & Wertkonstruktoren
*)

(* Definieren eines Message Type Constructors *)

type msg = 
| StringMsg of string * int
| BoolMsg of bool * int
| FloatMsg of float * int ;;

let sample_msgs = [
  StringMsg ("Hello", 1);
  StringMsg ("Hello again", 2);
  BoolMsg (true, 3);
  FloatMsg (3.14, 4)
] ;;

let message_log (m: msg) : string = match m with 
| StringMsg (s, number) -> "Msg at " ^ string_of_int number ^ ": " ^ s
| BoolMsg (b, number) -> "Msg at " ^ string_of_int number ^ ": " ^ string_of_bool b
| FloatMsg (f, number) -> "Msg at " ^ string_of_int number ^ ": " ^ string_of_float f ;;

let log_mesages (messages: msg list) : string = String.concat "\n" (List.map message_log messages) ;;

let print_messages (messages: msg list ) = print_endline (log_mesages messages) ;;

print_messages sample_msgs ;;

(* Type Binary Tree *)
(* Parametric Polymorphism *)
type 'a btree = 
| Empty 
| Node of 'a btree * 'a * 'a btree ;;

(* Integer Tree *)
let bt1 : int btree = 
  Node (
    Node(Empty, 2, Empty), (* Linker Teilbaum*)
    3, (* Wurzelhnoten *)
    Node(Empty, 4, Node(Empty, 5, Empty)) (* Rechter Teilbaum *)
  ) ;;

(* String Tree *)
let bt2 : string btree = 
  Node (
    Node(Empty, "Node 2", Empty), (* Linker Teilbaum*)
    "Node 3", (* Wurzelhnoten *)
    Node(Empty, "Node 4", Node(Empty, "Node 5", Empty)) (* Rechter Teilbaum *)
  ) ;;

let bt3 : 'a btree = Empty ;;

let bt4: 'a btree = Node(Empty, 1, Empty) ;;

(* Write a function that sums up all the integers in an btree *)
let rec sumTree (tree: int btree) : int = match tree with 
| Empty -> 0
| Node (left, v, right) -> v + sumTree left + sumTree right ;;

sumTree bt1 ;;
sumTree bt3 ;;
sumTree bt4 ;;

(* Convert any binary tree of any type to a list *)
let rec treeToList (tree: 'a btree) : 'a list = match tree with 
| Empty -> []
| Node (left, v, right) -> (treeToList left) @ (v :: []) @ (treeToList right) ;;

treeToList bt1 ;;
treeToList bt2 ;;
treeToList bt3 ;;
treeToList bt4 ;;

let newList = [1; 2; 3; 4;]

let rec addValues (lst: int list) : int = match lst with 
| [] -> 0
| x :: rest -> x + addValues rest ;;

addValues newList ;;

type 'a tree = 
| Empty  
| Tree of 'a tree * 'a * 'a tree ;;


let t1 : int tree = Tree(Empty, 1, Empty) ;;

let t2 : int tree = Tree(Tree(Empty, 1, Empty), 2, Tree(Empty, 3, Empty) ) ;;

let rec sumTree (tree: int tree) : int = match tree with
| Empty -> 0
| Tree(left, x, right) -> x + sumTree left + sumTree right ;;

sumTree t1 ;;

sumTree t2 ;;


(* Exam Questions *)

(* Create a function that has an initial value of 'a list and return this. *)

(* let f [] @ _ => [] ;; *)

(* Create a function that takes in a list of integers and returns the sum of the even numbers in the list. *)


(* Erstellen Sie eine anonyme Funktion von a' list nach a' list. => Aufruf ohne Übergabeparameter *) 

fun xs -> match xs with 
| [] -> [] 
| xs :: rest -> xs :: rest ;;
