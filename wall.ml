module type WALL =
sig
  type t

  val state : t -> bool
  val flip : t -> unit
end

module SimpleWall : WALL =
struct
  type t = bool ref

  let state w = !w
  let flip w =
    if !w
    then w := false
    else w := true
end
