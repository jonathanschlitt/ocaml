(* Exercise 1: Write a function named circle_area it will take in argument 'r' (radius) and returns the area of the circle *)

let circle_area r = 3.14 *. (r ** 2.);; (* (r *. r) *)

circle_area 4. ;;

(* Exercise 2: Write a function named power that takes in a power 'n' and a float '× and returns × ^ n *)
let power_n1 x n = x ** n ;;
power_n1 2. 2. ;;

let rec power_n2 x n = 
  if n = 0. then 1. else if n = 1. then x 
  else x *. power_n2 x (n-.1.)
;;

power_n2 2. 3. ;;

(* Exercise 3: Write a function named gcd that computes the greatest common divisor of two positive integers*) (* 12 8 then the god 4 *)

let rec gcd a b = 
  if b = 0 then a
  else if a = 0 then b
  else (
    if a > b then gcd (a - b) b
    else gcd a (b - a)
  ) ;;

gcd 12 8 ;;

(* Exercise 1: Write a function that adds up all the numbers in an integer list *)
let rec add_numbers_of_list lst = match lst with 
| [] -> 0
| x :: xs -> x + add_numbers_of_list xs ;;

add_numbers_of_list [1;2;3] ;;

(* Exercise 2: Write a function that finds the smallest element in the list. *)
let rec smallest lst acc = match lst with 
| [] -> acc
| x :: xs -> if x < acc then smallest xs x else smallest xs acc;;

let rec smallest_in_list lst = 
  (* let a = 1 in 
  if a >= 1 then  *)
  match lst with 
| [] -> raise(Invalid_argument "empty list")
| x :: [] -> x
| x :: xs -> if x < smallest_in_list xs then x else smallest_in_list xs ;;

smallest_in_list [1;2;3] ;;
smallest_in_list [] ;;


let test x = 
  let a = max_int in
  print_int a ;;

test 1;;

(* Exercise 3: Write a function that appends two lists into one *)

let append_lists lst1 lst2 = lst1 @ lst2;;
append_lists [1;2;3] [4;5;6] ;;

let rec append_lists_recursively lst1 lst2 = 
  match lst1 with
  | [] -> lst2
  | x :: xs -> x :: (append_lists_recursively xs lst2) ;;

append_lists_recursively [1;2;3] [4;5;6] ;;

(* Exercise 4: Write a function that determines if a value is in a list or not *)

let rec find_in_list lst value =
  match lst with 
  | [] -> false
  | x :: xs -> if x = value then true else find_in_list xs value ;;

find_in_list ([1;2;3] @ [4;5;6]) 7 ;;

(* Exercise 5: Write a function that uses the string concatenation operator ^ to add the string ! to the end of each string in the input list*)
let rec concat_exclaim_symbol lst = 
  match lst with
  | [] -> []
  | x :: xs -> (x ^ "!") :: (concat_exclaim_symbol xs) ;;

concat_exclaim_symbol ["Hello"; "World"; "Test"; "Foo"] ;;

(* Exercise 6: Write a function that will compute the length of a string given in the input list. Return a tuple (pair) list with each pair containing the (string, length of string*)

let rec return_list_with_tuples lst =
  match lst with
  | [] -> []
  | x :: xs -> (x, (String.length x)) :: return_list_with_tuples xs ;;

return_list_with_tuples ["Hello"; "World"; "Test"; "Foo"] ;;

(* Own Exercise: Write a function flatten_list that takes a list of lists and flatten the nested list to the outer list. *)

let rec flatten_list lst =
  match lst with
  | [] -> []
  | x :: xs -> x @ flatten_list xs ;;

flatten_list [[5;6;7;8];[1;2;3;4;];]

(* reverse a list *)
let reverse_list lst = 
  let rec aux acc = function
  | [] -> acc
  | h :: t -> aux (h :: acc) t
  in
    aux [] lst ;;

reverse_list [1;2;3;4;] ;;

(* Alternative answer *)
let rec reverse_list lst =
  match lst with
  | [] -> []
  | head :: tail -> reverse_list tail @ [head] ;;

  let rec reverse_list lst =
    match lst with
    | [] -> []
    | head :: tail -> reverse_list tail @ [head] ;;
  

  reverse_list [1;2;3;4;] ;;

let rec fac n =
  match n with
  | 0 -> 1
  | n -> n * fac (n-1) ;;

fac 5;;