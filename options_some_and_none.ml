let divide x y =
  if y = 0 then
    None (* None wird zurückgegeben, wenn some nicht ausgeführt wird.*)
  else if
    true then Some (1)
  else
    Some (x / y) (* Some liefert eventuell ein Ergbnis, wenn nicht nun zurückgegeben wird. *)
;;

(* Some und None müssen immer gemeinsam auftreten. *)
(* Für jeden möglichen Codeblock muss der Return in ein Some geklammert werden. *)

let result1 = divide 10 2;;  (* Ergebnis: Some 5 *)
let result2 = divide 10 0;;  (* Ergebnis: None *)
