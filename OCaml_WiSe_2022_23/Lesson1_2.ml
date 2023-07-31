(** Liste mit zwei Tupeln anlegen
die aus int * int bestehen *)
[(1,2);(3,4)];;

(** Tupel mit zwei Listen anlegen, bei dem beide
Listen unterschiedliche Typen haben können *)
([],[]);;

(** Ein if then else hat auch wieder einen Typen,
nämlich den Typen des zurückgegebenen Wertes.
Es muss dabei aber in allen Fällen derselbe Typ
herauskommen. *)
if 1 > 0 then 99 else 100;;

(** Ein if then else benötigt zwingend einen
boolschen Ausdruck, ansonsten lässt er sich 
nicht interpretieren *)
if true then 5 else 10;;

(** Man kann die Ausdrücke dann auch wieder
verschachteln und den Wert des daraus entstandenen
Ausdrucks auswerten lassen *)
(if true then 4 else 5) + (if false then 4 else 5);;

(** Oder auch die Werte von mehreren Ausdrücken
in eine Liste packen. Auch hier muss der Typ dann 
aber übereinstimmen. *)
[if true then 4 else 5; if false then 4 else 5];;

(** Man kann "Namen" für einen bestimmten Wert anlegen.
Dies darf nicht mit Variablen verwechselt werde. *)
let x = 1;;

(** Und diesen "anderen Bezeichner für den Wert" kann man
dann verwenden und auswerten lassen in einem Ausdruck. *)
(x+x);;

(** Diese Zuweisung kann man dann auch wieder anpassen *)
let x = 2;;

(** Anschließend gilt der neu zugewiesene Wert *)
(x+x);;

(** Achtung: Bei Neu-Zuweisung immer das let Keyword
verwenden, da ansonsten ein Vergleichs-Ausdruck ausgeführt
wird und da ein Boolean-Wert herauskommt. *)
x = 5;;
x = 2;;

(** Funktionen sind nichts anderes als Ausdrücke, deren 
Auswertung in einem Wert endet. *)
let quadrieren = fun x -> x * x;;

(** "quadrieren" ist nun ein Bezeichner für eine Funktion, bzw.
einen Audruck. Das Keyword "fun" wird in anderen Sprachen
bspw. "Lambda" genannt. *)
quadrieren(20);;

(* 
    *)

let x = 1;;

let plus1 = (+) 1;;

plus1 2;;

(* Improved division *)

let ( / ) = fun x y -> if y = 0 then 0 else x / y;;

12 / 3;;

12 / 0;;

let rec fakultaet n = if n < 2 then 1 else n + fakultaet (n-1);;

fakultaet 3;;

fakultaet 10;;

let rec fibo n = match n with
	 0 -> 1
   | 1 -> 1
   | n -> fibo (n - 1) + fibo (n - 2);;
   
fibo 0;;
   
fibo 1;;
   
fibo 12;;

(*for i = 1 to 10 do
  print_endline i
done*)

(* get lenght of a list*)

let rec length xs = match  xs with
	[] -> 0
	| _ :: ys -> 1 + length ys;;
	

length [1; 2; 3; 4; 5];;

let min2 xs = match xs with
	_ :: _ :: _ -> true
	| _ -> false;;
	
min2 [];;

min2 [1];;

min2 [1; 2; 3; 4; 5];;

let inc x = x + 1;;

let rec m f xs = match xs with
	[] -> []
	| (y::ys) -> (f y) :: (m f ys) ;;

m inc [1; 2; 3;];;

m (fun x -> x + 1) [1;2;3];; (* Map *)

let rec fd f xs e = match xs with
	[] -> e
	| (y::ys) -> f y (fd f ys e);;
	
fd ( * ) [4; 5; 6] 0;;

fd ( * ) [4; 5; 6] 1;;

fd ( * ) [4; 5; 6] 2;;

(*check ob alle elemente gerade sind *)

fd (fun n b -> b && (n mod 2 = 0)) [2; 4; 6; 8] true;;

fd (fun n b -> b && (n mod 2 = 0)) [] true;;

List.append;;
List.append [1;2;3] [4;5; 6];;

List.fold_left;;

let conc xss = List.fold_right List.append xss [];;
conc [[4;5];[];[3;4];[];[1]];;

let addAll xs = List.fold_right (+) xs 0;;
addAll [4;5;6;7;9];;

if "batman" > "superman" then "yay" else "boo";



