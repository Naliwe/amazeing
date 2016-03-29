module type CELL =
sig
  type t

  val new_cell : int -> int -> t
  
  val x : t -> int
  val y : t -> int
end

module SquareCell : CELL =
struct
  type t = (int * int)

  let new_cell x y = (x,y)

  let x (x,_) = x
  let y (_,y) = y
end
