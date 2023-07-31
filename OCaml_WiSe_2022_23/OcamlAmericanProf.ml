if "batman" > "superman" then "yay" else "boo";;

(* 
	Let Definitions 
*)
let x = 42;;

(* Explicit type definition*)
let (y : int) = 42;;

(*add variable numbers*)
let z = x + y;;

(*

(let a = 1) + 2;;

not allowed

*)

(*
	let Expressions
*)

let a = 0 in a;;

let b = 1 in b * 2;; (* continue evaluation while binding value 1 to b *)

let c = 3 in (let d = 4 in c + d);;

(* let e = 5 in (let e = 6 in e);; *)
	
(*
	Anonymos functions
*)

(fun x -> x + 1);;

(fun x -> x + 1) 3110 ;;

(fun x -> x + 1) (2 + 3) ;;

(fun x y -> x - y) (3 * 1) (3 - 1) ;;

(*
	Named functions
*)

let inc = fun x -> x + 1 ;; (* same as ==> let inc x = x + 1 (another syntax) *)

inc 99 ;;

let avg x y = (x +. y) /. 2. ;;

avg 7. 4. ;;

(* Factorial Function  *)

let rec factorial n = if n = 0 then 1 else n * factorial (n - 1) ;;

factorial 3 ;;

(* 	Type inference 
	for example let inc = fun x -> x + 1 ;;
	==> Ocaml sees the int 1 at the right => x must also be from type int 
*)

(* Partial Functions *)
let add x y = x + y ;;

add 1 1 ;;

add 2 ;; (* Calling add with one argument gives us a function*)

(add 2) 3 ;; (* The statement (add 2) returns a function and by adding 3, the partial function add 2 will be applied resulting in 5 *)

(*
	There are only one arguemnt functions in Ocaml ==> More args are syntactic sugar!
	
	fun x y -> e 
	
	is syntactic sugar for
	
	fun x -> (fun y -> e) (chaining functions)
	
	Because of that, we can use partial function application here !!!
*)

(* Polymorphic functions ==> for example the identity function *)

let id x = x ;; (* function is of type 'a which is something like Generics in Java*)

id 5 ;;

(* Operators as Functions ==> wrapping + into () gives us a plus function*)

1 + 2 ;; (* infix notation*)

( + ) 1 2 ;; (* (+) is a function ==> prefix notation *)

( * ) 2 2 ;;

  







	











