(* This is an OCaml editor. Enter your program here and send it to the toplevel using the "Eval code" button or [Ctrl-e]. *)

(* 1. Taschenrechner
   2. Java Analogie
   3. Interpreter für eine mini imperative Sprache *)

(* Übungsaufgaben:
   - Java Programme(e)
     Pretty Printer vom Typ s -> unit, der Programme hübsch formatiert ausgibt
   - Mini Sprache um for Schleifen erweitern *)

(* Mini: (KFG) *)
type aexp =
  (* Taschenrechnersprache: Syntax *)
  | N of int
  | Var of char
  | Sum of aexp * aexp
  | Sub of aexp * aexp
  | Mul of aexp * aexp
  | Div of aexp * aexp

type s =
  | Ass of char * aexp
  | If of aexp * (int -> int -> bool) * aexp * s * s
  | While of aexp * (int -> int -> bool) * aexp * s
  | Seq of s list

let ggt =
  Seq [
    Ass ('a', N 144);
    Ass ('b', N 84);
    While (
      Var 'a',
      (!=),
      Var 'b',
      (* Schleifenbedingung *)
      If (
        Var 'a',
        (>),
        Var 'b',
        Ass ('a',Sub(Var 'a', Var 'b')),
        Ass('b',Sub(Var 'b', Var 'a'))
      ) (* Schleifenrumpf *)
    )
  ]

let env = ref []

let rec eval exp =
  match exp with
  (* Semantik der Taschenrechnersprache *)
  | N n -> n
  | Var x -> List.assoc x (!env)
  | Sum (e1,e2) -> eval e1 + eval e2
  | Sub (e1,e2) -> eval e1 - eval e2
  | Mul (e1,e2) -> eval e1 * eval e2
  | Div (e1,e2) -> eval e1 / eval e2

let rec interpret prog =
  match prog with
  | Ass (x,e) -> env := (x,eval e) :: (!env)
  | If (e1,op,e2,s1,s2) ->
    if op (eval e1) (eval e2) then
      interpret s1
    else
      interpret s2
  | While (e1,op,e2,s) ->
    if op (eval e1) (eval e2) then
      interpret (Seq [s; While(e1,op,e2,s)])
    else
      ()
  | Seq stms -> List.iter interpret stms
