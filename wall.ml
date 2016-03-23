module type WALL =
sig
  type t

  val state : t ref -> t
  val flip : t ref -> unit
end

module Wall : WALL =
struct
  type t = bool

  let state w = !w
  let flip w =
    if !w
    then w := false
    else w := true
end
