
type primary_color = Red | Green | Blue ;;

let r = Red ;; (* Nutzt Type-Inferenz: Auch Explizit möglich mit let r: primary_color = Red ;; *)

type point = float * float ;;

(* Type mit Zusatzinformationen *)
type shape = 
| Circle  of {center: point; radius: float}
| Rectangle of {lower_left: point; upper_right: point} ;;

let c1 = Circle {center = (0.0, 0.0); radius = 1.0} ;;

let r1 = Rectangle {lower_left = (-1., -1.); upper_right = (3., 3.)} ;;

