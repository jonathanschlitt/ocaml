
let rec reverse xs =
  match xs with
  | [] -> []
  | y::ys -> reverse ys @ [y]

let rec last xs =
  match xs with
  | [] -> None
  | [x] -> Some x
  | _::ys -> last ys

type color =
  | Red
  | Blue
  | Green (* color: nullstelliger TYPKONSTRUKTOR *)
         (* Red, Blue, Green: nullstellige WERTKONSTRUKTOREN *)

let colorvalue c =
  match c with
  | Red -> 1
  | Blue -> 2
  | Green -> 3

type quad =
  | Square of int
  | Rectangle of int * int (* Square: einstelliger Wertkonstruktor, Rectangle: zweistellig *)

let area q =
  match q with
  | Square n -> n*n
  | Rectangle (a,b) -> a * b

type 'a tree =
  | Empty
  | Node of 'a * 'a tree * 'a tree

let tree1 = Node (1, Node (2, Empty, Empty), Node (3, Empty, Empty))
let tree2 = Node (5, tree1, tree1)
let tree3 = Node (7, Node (4, Node (2, Empty, Empty), Node (6, Empty, Empty)), Node (9, Empty, Empty))

let rec height t =
  match t with
  | Empty -> 0
  | Node (_,t1,t2) -> 1 + max (height t1) (height t2)

let rec treesum t =
  match t with
  | Empty -> 0
  | Node (a,t1,t2) -> a + treesum t1 + treesum t2

let rec inorder t =
  match t with
  | Empty -> []
  | Node (x,t1,t2) -> inorder t1 @ (x :: inorder t2)

let rec dfs t =
  match t with
  | Empty -> []
  | Node (x,t1,t2) -> (x :: dfs t1) @ (dfs t2)

type 'a queue = Q of 'a list

let enqueue q x =
  match q with
  | Q xs -> Q (xs @ [x])

let dequeue q =
  match q with
  | Q [] -> (None, q)
  | Q (x::xs) -> (Some x, Q xs)

let rec bfs' q =
  match q with
  | [] -> []
  | (Node(a,t1,t2) :: xs) -> a :: bfs' (xs @ [t1;t2])
  | (Empty :: xs) -> bfs' xs

let bfs t = bfs' [t]

type 'a node =
  | One of 'a
  | Many of 'a node list

let fl = [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]]

let rec flatten nl =
  match nl with
  | [] -> []
  | (One x :: nls) -> x :: flatten nls
  | (Many nls :: nls') -> flatten nls @ flatten nls'

let rec removeDups xs =
  match xs with
  | [] -> []
  | y :: ys -> y :: (removeDups (List.filter (fun z -> z <> y) ys))
  