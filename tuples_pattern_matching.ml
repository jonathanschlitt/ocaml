(* Pattern Matching mit einem einfachen Tupel *)

let print_coordinates = function
  | (x, y) -> Printf.printf "Coordinates: x = %d, y = %d\n" x y
;;

let point = (3, 7);;
print_coordinates point;;

(* N-Tupel formatiert mit Bezeichnungen ausgeben *)
let print_person_info = function
  | (name, age, city) -> Printf.printf "Name: %s, Age: %d, City: %s\n" name age city
;;

let person = ("Alice", 30, "New York");;
print_person_info person;;

(* Elemente eines verschachtelten n-tupels zurückgeben. *)

let sum_elements = function
  | (a, (b, c)) -> a + b + c
;;

let nested_tuple = (10, (20, 30));;
let result = sum_elements nested_tuple;;
Printf.printf "Sum of elements: %d\n" result;;
