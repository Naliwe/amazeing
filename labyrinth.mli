module type LABYRINTH =
sig
  type t

  val new_labyrinth : int -> int -> t
  val print : t -> unit
end

module type MAKELABYRINTH = functor (Cell : Cell.CELL) -> LABYRINTH
  with type t = Cell.t array

module MakeLabyrinth : MAKELABYRINTH
