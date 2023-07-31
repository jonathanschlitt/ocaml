(* This is an OCaml editor. Enter your program here and send it
to the toplevel using the "Eval code" button or [Ctrl-e]. *)

(* 1. Taschenrechner
   2. Interpreter für eine mini imperative Sprache
   3. Java Analogie *)

type aexp =
(* Taschenrechnersprache: Syntax *)
| N of int
| Var of char
| Sum of aexp * aexp
| Sub of aexp * aexp
| Mul of aexp * aexp
| Div of aexp * aexp
 
 let a1 = Sum (N 1, N 2)
 let a2 = Mul (a1, a1) (* (1+2)*(1+2) = 9 *)
 let a3 = Div (a2, N 3) (* 9/3 = 3 *)
 let a4 = Sum (a2, Var 'x')
 let a5 = Sub (Var 'x', Var 'y') (* x-y *)
 
 (* Umgebung/environment speichert in einer map Werte von Variablen
    Beispiel: x sei 5, y sei 6 *)
 let env1 = [('x', 5); ('y', 6)]
 
 let rec eval exp env =
   match exp with
   (* Semantik der Taschenrechnersprache *)
   | N n -> n
   | Var x -> List.assoc x env
   | Sum (e1, e2) -> eval e1 env + eval e2 env
   | Sub (e1, e2) -> eval e1 env - eval e2 env
   | Mul (e1, e2) -> eval e1 env * eval e2 env
   | Div (e1, e2) -> eval e1 env / eval e2 env ;;

eval a1 env1 ;;
eval a2 env1 ;;
eval a3 env1 ;;
eval a4 env1 ;;
eval a5 env1 ;;
 