# puts "hello world"

def math(opr, x, y)
  case opr
    when "add" then x+y
    when "sub" then x-y
    when "mul" then x*y
    when "div" then x/y
  end
end

puts math(ARGV[0].to_s, ARGV[1].to_i, ARGV[2].to_i)
