module type CELL =
sig
  type t

  val new_cell : int -> int -> t
  
  val x : t -> int
  val y : t -> int
end

module SquareCell : CELL

