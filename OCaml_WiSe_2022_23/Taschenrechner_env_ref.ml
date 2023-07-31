(* This is an OCaml editor. Enter your program here and send it
to the toplevel using the "Eval code" button or [Ctrl-e]. *)

(*
1. Taschenrechner 3. Interpreter für eine mini imperative Sprache
2. Java Analogie
*)

(* JAVA Lösung
abstract class AExp {
  public static Map<String, Integer> env;
  public int eval();
}

class N extends AExp {
  private int n;
  N(int n) { this.n = n; }
  public int eval() { return n; }
}

class Sum extends AExp {
  private AExp e1;
  private AExp e2;
  Sum(AExp a1, AExp a2) { ...}
  public int eval() {return e1.eval() + e2.eval();}
}
*)

type aexp =
  (* Taschenrechnersprache: Syntax *)
  N of int
  | Var of char
  | Sum of aexp * aexp
  | Sub of aexp * aexp
  | Mul of aexp * aexp
  | Div of aexp * aexp

let a1 = Sum (N 1, N 2)
let a2 = Mul (a1, a1) (* (1+2)*(1+2) = 9 *)
let a3 = Div (a2, N 3) (* 9/3 = 3 *)
let a4 = Sum (a2, Var 'x') (* 9 + x *)
let a5 = Sub (Var 'x', Var 'y') (* x-y *)

(* Umgebung/environment speichert in einer map Werte von Variablen
Beispiel: x sei 5, y sei 6 *)
let env1 = ref [('x', 5); ('y', 6)]

let rec eval exp =
  match exp with
  (* Semantik der Taschenrechnersprache *)
  N n -> n
  | Var x -> List.assoc x (!env1) (* env1 => Referenz, !env1 Wert der Referenz.*)
  | Sum (e1, e2) -> eval e1 + eval e2
  | Sub (e1, e2) -> eval e1 - eval e2
  | Mul (e1, e2) -> eval e1 * eval e2
  | Div (e1, e2) -> eval e1 / eval e2 ;;

  eval a1 ;;
  eval a2 ;;
  eval a3 ;;
  eval a4 ;;
  eval a5 ;;
   
