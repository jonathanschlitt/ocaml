(* Beispiel aus JavaCC *)

(* 
int S() :
{
  int x = 0;
  int y = 0;
}
{
  x = Z() [P() y = S()] { return x + y; } | "\n"
}

void P() :
{}
{
  "+"
}

int Z() : 
{}
{ 
  "0" { return 0; } | "1" { return 1; } | "2" { return 2; } | 
  "3" { return 3; } | "4" { return 4; } | "5" { return 5; } | 
  "6" { return 6; } | "7" { return 7; } | "8" { return 8; } | "9" { return 9; }
}
*)

(* 
Grammatik:
S -> Z P S | Z
P -> +
Z -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
*)

type aexp =
  (* Taschenrechnersprache: Syntax *)
  | N of int
  | Sum of ( aexp * aexp ) ;;

let a1 = Sum (N 1, N 2) ;;
let a1x = Sum (N 1, Sum ( N 1, Sum (N 1, N 3) ) ) ;;

let rec eval exp =
  match exp with
  | N n -> n
  | Sum (e1, e2) -> eval e1 + eval e2 ;;

  eval a1 ;;
  eval a1x ;;

