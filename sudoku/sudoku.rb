sudoku = Array.new()
fullLine = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

i = 0

IO.foreach("example.sudoku") { |line|
  line.chomp!
  sudoku[i] = line.split(",")
  i += 1
}

for line in sudoku

  missingNumbers = fullLine - line

  line.map! {|number|
    if number == "_"
      missingNumbers
    else
      number
    end
  }
end
