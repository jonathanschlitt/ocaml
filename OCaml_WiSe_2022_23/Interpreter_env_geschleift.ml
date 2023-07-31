
type a =
  | N of int
  | Loc of char
  | Sum of a * a
  | Mul of a * a
  | Sub of a * a
  | Div of a * a

type b =
  | B of bool
  | Eq of a * a
  | Neq of a * a
  | Leq of a * a
  | Not of b
  | And of b * b
  | Or of b * b

type s =
  | Ass of char * a
  | If of b * s * s
  | While of b * s
  | Seq of s list

let rec evalA = function
  | (N n, _) -> n
  | (Loc x, sigma) -> List.assoc x sigma
  | (Sum (a1,a2), sigma) -> evalA (a1,sigma) + evalA(a2,sigma)
  | (Mul (a1,a2), sigma) -> evalA (a1,sigma) * evalA(a2,sigma)
  | (Sub (a1,a2), sigma) -> evalA (a1,sigma) - evalA(a2,sigma)
  | (Div (a1,a2), sigma) -> evalA (a1,sigma) / evalA(a2,sigma)

let rec evalB = function
  | (B b, _) -> b
  | (Eq (a1,a2), sigma) -> evalA (a1,sigma) == evalA(a2,sigma)
  | (Neq (a1,a2), sigma) -> evalA (a1,sigma) != evalA(a2,sigma)
  | (Leq (a1,a2), sigma) -> evalA (a1,sigma) <= evalA(a2,sigma)
  | (Not b, sigma) -> not (evalB (b,sigma))
  | (And (b1,b2), sigma) -> evalB (b1,sigma) && evalB(b2,sigma)
  | (Or (b1,b2), sigma) -> evalB (b1,sigma) || evalB(b2,sigma)

                                                    
let rec interpret = function
  | (Ass (x,e), sigma) -> let v = evalA (e,sigma)
                          in (x,v)::sigma
  | (If (b,s1,s2), sigma) -> let v = evalB (b,sigma)
                             in if v then interpret (s1,sigma)
                                else interpret (s2,sigma)
  | (While (b,s), sigma) -> let v = evalB (b, sigma)
                            in if v then interpret (Seq [s; While (b,s)], sigma)
                               else sigma
  | (Seq slist, sigma) -> match slist with
                          | [] -> sigma
                          | (s::sse) -> let sigma2 = interpret (s,sigma)
                                       in interpret (Seq sse, sigma2)

                                                    
let fakultaet = Seq [ Ass ('p', N 1); (* p = 1 *)
                      Ass ('c', N 1); (* c = 1 *)
                      While (   (* while *)
                          Leq (Loc 'c', Loc 'n'), (* (c <= n) *)
                          Seq [ Ass ('c', Sum (Loc 'c', N 1)); (* c = c + 1*)
                                Ass ('p', Mul (Loc 'p', Loc 'c')); (* p = p*c *)
                            ]
                        )
                  ]


                        
