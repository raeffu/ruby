# def threeTimes
#   yield
#   yield
#   yield
# end
# threeTimes { puts "Hello!" }

# def fibUpTo(max)
#   i, j = 1, 1         #paralell assignement
#   while i <= max
#     yield i
#     i, j = j, i+j
#   end
# end
# 
# fibUpTo(1000) {|f| print f, " "}

["H", "A", "L"].collect { |x| puts x.succ }

[1, 2, 3].each { |s| puts s }