(* Records *)
type student = {
  name: string;
  age: int;
}

let me = {
  name = "Jonathan Schlitt";
  age = 23;
} ;;

me.name ;;
me.age ;;