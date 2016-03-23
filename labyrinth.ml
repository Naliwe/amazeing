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

module MakeLabyrinth : MAKELABYRINTH = functor (Cell : Cell.CELL) -> functor (Wall : Wall.WALL) ->
struct
  type cell_type = Cell.t array
  type wall_type = Wall.t

  let new_labyrinth w h =
    let s = w * h
    in Array.init s (fun idx ->
        let x = idx mod w
        and y = idx / h
        in Cell.new_cell x y)

  let print l = print_endline "lalilou"
end
