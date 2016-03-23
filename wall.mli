module type WALL =
sig
  type t

  val state : t ref -> t
  val flip : t ref -> unit
end

module Wall : WALL
