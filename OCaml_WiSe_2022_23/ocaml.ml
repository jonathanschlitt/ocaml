let n = 0 ;;

let rec fib n = 
  if n = 0 then 0
  else if n = 1 then 1
  else fib (n-1) + fib (n-2) ;;

let l = [1;2;3;4;5] ;;

let rec sum l = 
  match l with
  | [] -> 0
  | x::xs -> x + sum xs ;;