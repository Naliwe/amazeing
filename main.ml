module PerfectLabyrinth = Labyrinth.MakeLabyrinth (Cell.SquareCell)

let main () =
  let laby = PerfectLabyrinth.new_labyrinth 5 5
  in PerfectLabyrinth.print laby

let _ = main ()
