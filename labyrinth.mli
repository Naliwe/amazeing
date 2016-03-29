module type LABYRINTH =
sig
  type cell_type
  type wall_type

  val new_labyrinth : int -> int -> cell_type
  val print : cell_type -> unit
end

module type MAKELABYRINTH = functor (Cell : Cell.CELL) -> functor (Wall : Wall.WALL) -> LABYRINTH
  with type cell_type = Cell.t array
  and type wall_type = Wall.t

module MakeLabyrinth : MAKELABYRINTH
