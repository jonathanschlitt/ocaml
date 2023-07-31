(* This is an OCaml editor. Enter your program here and send it
to the toplevel using the "Eval code" button or [Ctrl-e]. *)

(* MiniFun: arithmetische Ausdrücke, Boolesche Ausdrücke
if-then-else AUSDRUCK let AUSDRUCK Funktionsausdruecke
Funktionsanwendung --> Lambda Kalkül *)

type aexp =
  | I of int
  | Id of char
  | Sum of aexp * aexp

type bexp =
  | Be of bool
  | Comp of (int -> int -> bool) * aexp * aexp
  | Bop of (bool -> bool -> bool) * bexp * bexp

type exp =
  | A of aexp
  | B of bexp
  | Ite of bexp * exp * exp
  | Let of char * exp * exp
  | Fun of char * exp
  | App of exp * exp

let e1 = Fun ('x', A (Sum (I 1, Id 'x'))) (* fun x -> x+1 *)
let e2 = App (e1, A (I 17))

type value =
  | Ival of int
  | Bval of bool
  | Closure of char * exp * (char * value) list (* (char * value) list: Environment) *)

let i ival =
  match ival with
  | Ival n -> n
  | _ -> 0

let b bval =
  match bval with
  | Bval b -> b
  | _ -> false

let rec evalA ae env =
  match ae with
  | I n -> Ival n
  | Id x -> List.assoc x env
  | Sum (a1, a2) -> Ival (i (evalA a1 env) + i (evalA a2 env))

let rec evalB be env =
  match be with
  | Be b -> Bval b
  | Comp (op, a1, a2) -> Bval (op (i (evalA a1 env)) (i (evalA a2 env)))
  | Bop (op, b1, b2) -> Bval (op (b (evalB b1 env)) (b (evalB b2 env)))

let rec eval e env =
  match e with
  | A ae -> evalA ae env
  | B be -> evalB be env
  | Ite (e1, e2, e3) ->
      if evalB e1 env = Bval true then eval e2 env else eval e3 env
  | Let (x, e1, e2) -> eval e2 ((x, eval e1 env) :: env)
  | Fun (x, e) -> Closure (x, e, env)
  | App (e1, e2) ->
      let Closure (x, e, env') = eval e1 env in
      let v = eval e2 env in
      eval e ((x, v) :: (env' @ env))
