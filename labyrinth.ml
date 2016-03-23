module type LABYRINTH =
sig
  type t

  val new_labyrinth : int -> int -> t
  val print : t -> unit
end

module type MAKELABYRINTH = functor (Cell : Cell.CELL) -> LABYRINTH
  with type t = Cell.t array

module MakeLabyrinth : MAKELABYRINTH = functor (Cell : Cell.CELL) ->
struct
  type t = Cell.t array

  let new_labyrinth w h =
    let s = w * h
    in Array.init s (fun idx ->
        let x = idx mod w
        and y = idx / h
        in Cell.new_cell x y)

  let print l = print_endline "lalilou"
end
