module type WALL =
sig
  type t

  val state : t -> bool
  val flip : t -> unit
end

module SimpleWall : WALL
