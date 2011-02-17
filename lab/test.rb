#$: << File.dirname(__FILE__)

#require 'lib'

# puts ("jola duli".length)
# puts ("Peter".index("t"))
# puts(-65894.abs)

# def saygoodnight(name)
#   result = "Good Night, " + name
#   return result
# end
#
# puts saygoodnight("Raffi")

# puts 'jola \nduly'
# puts "jola \nduly"

# def saygoodnight(name)
#   result = "Good Night, #{name}"
#   return result
# end
#
# puts saygoodnight("raffi")

# a = [1, "abc", 3.141]
# puts a[0]
# a[2] = nil
# puts a[2]

# emptyArray = []
# emptyArray2  = Array.new
#
# a = %w{a b c d e f g}
# # puts a
# puts a[3]

# hash = {
#   'peter' => 'meter',
#   'franz' => 'schwanz'
# }
#
# puts hash['peter']
# puts hash['dieter']

# histogramm = Hash.new(0)
# puts (histogramm['key1'] = histogramm['key1'] + 1)

# a = 1
# puts "hallo" if a == 0
#
# square = 2
# while square < 1000
#   square = square * square
#   puts square
# end
#
# square = square*square  while square < 1000
# puts square
#
# line = "Phyton"
#
# # if line =~ /Perl|Phyton/
# #   puts "the language is #{line}"
# # end
#
# puts line.sub(/Phyton/, 'Ruby')
#
# puts line
#
# def callBlock
#   yield
#   yield
# end
#
# callBlock {puts "dini mueter"}
#
# a = %w{ hund katz tiger affe}
# a.each {|tier| puts tier}
#
# line = gets
# print "--------------\n"
# print line
# print $_

# ARGF.each { |line| print line if line =~ /Ruby/ }


# -------------------------------------------------------
# Classes
# -------------------------------------------------------
#
#
class Song
  @@plays = 0
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end
  def to_s
    "Song: #{@name}, Artist: #{@artist}, Duration: #{@duration}"
  end

  attr_reader :name, :artist, :duration
  attr_writer :duration
  # def duration=(newDuration)
  #   @duration = newDuration
  # end
  def durationInMinutes
    @duration/60.0
  end
  def durationInMinutes=(value)
    @duration = (value*60).to_i
  end
  def play
    @plays += 1
    @@plays += 1
    "This song: #@plays plays. Total #@@plays plays."
  end
  def [](fromTime, toTime)
    result = Song.new(self.title + " [extract]",
                      self.artist,
                      toTime - fromTime)
    result.setStartTime(fromTime)
    result
  end

end
#
# class KaraokeSong < Song
#   def initialize(name, artist, duration, lyrics)
#     super(name, artist, duration)
#     @lyrics = lyrics
#   end
#   def to_s
#     super + " [#{@lyrics}]"
#   end
# end
#
# class SongList
#   MaxTime = 5*60
#
#   def SongList.isTooLong(aSong)
#     return aSong.duration > MaxTime
#   end
# end

# aSong = KaraokeSong.new("dini", "mueter", 123, "schwitzt bim schisse...")

# aSong = Song.new("Bicylops", "Fleck", 260)
# puts aSong.inspect

# puts aSong.to_s
#
# aSong = Song.new("dini", "mueter", 255)
#
# puts aSong.name
# puts aSong.artist
# puts aSong.duration
#
# aSong.duration = 321
#
# puts aSong.duration
#
# puts aSong.duration
# puts aSong.durationInMinutes
# aSong.durationInMinutes = 4.2
# puts aSong.duration
#
# s1 = Song.new("song1", "peter meter", 123)
# s2 = Song.new("song2", "franz schwanz", 321)
#
# puts s1.play
# puts s2.play
# puts s1.play
#
# song1 = Song.new("Bicylops", "Fleck", 260)
# puts SongList.isTooLong(song1)
# song2 = Song.new("The Calling", "Santana", 200)
# puts SongList.isTooLong(song2)

# class MyClass
#
#   def method1
#   end
#
#   # ...
#
#   public    :method1, :method2
#   protected :method3
#   private   :method4
#
# end
#
# class Accounts
#   private
#
#   def debit(account, amount)
#     return account.balance -= amount
#   end
#   def credit(account, amount)
#     return account.balance += amount
#   end
#
#   public
#
#   def transferToSavings(amount)
#     debit(@checking, amount)
#     credit(@savings, amount)
#   end
# end
#
# person = "Tim"
# puts person.id
# puts person.type
# puts person
#
# person1 = "Tim"
# person2 = person1.dup
#
# person1[0] = "J"
#
# puts person1
# puts person2
#
# person1 = "Tim"
# person2 = person1
# person1[0] = 'J'
# puts person1
# puts person2
#
# a = [ 3.14159, "pie", 99 ]
#
# b = Array.new
# puts b.length
# b[0] = "dini muter"
# puts b.length
# b[1] = "isch dick"
# puts b
# #
# a = [1, 3, 4, 7, 3, 9, 0]
# #
# # puts a[-2]
# # puts a[-99]
# # puts a[3, 5]
# # puts "--------"
# # puts a[2, 1]
#
# puts a[1..3]
# puts "--------"
# puts a[1...3]
# puts "--------"
# puts a[3..3]
# puts "--------"
# puts a[-3..-1]
#
# a = [ 1, 3, 5, 7, 9 ]
# print "#{a}\n"
# a[1] = 'bat'
# print "#{a}\n"
# a[-3] = 'cat'
# print "#{a}\n"
# a[3] = [ 9, 8 ]
# print "#{a}\n"
# a[6] = 99
# print "#{a}\n"
#
# print a[3]

class SongList
  def initialize
    @songs = Array.new
    @index = WordIndex.new
  end

  attr_reader :songs

  def append(aSong)
    @songs.push(aSong)
    @index.index(aSong, aSong.name, aSong.artist)
    self
  end
  def deleteFirst
    @songs.shift
  end
  def deleteLast
    @songs.pop
  end
  def [](key)
    return @songs[key] if key.kind_of?(Integer)
    return @songs.find { |aSong| key == aSong.name}
    # if key.kind_of?(Integer)
    #       result = @songs[key]
    #     else
    #       result = @songs.find { |aSong| key == aSong.name }
    #     end
    #     return result
  end
  def lookup(aWord)
    @index.lookup(aWord)
  end
end


#list = SongList.new

#list.
#  append(Song.new('title1', 'artist1', 1)).
#  append(Song.new('title2', 'artist2', 2)).
#  append(Song.new('title3', 'artist3', 3)).
#  append(Song.new('title4', 'artist4', 4))
#
# puts list.deleteFirst
# puts list.deleteFirst
# puts list.deleteLast
# puts list.deleteLast
# puts list.deleteLast
# puts list.songs

# puts list[0]

# file = File.open("file.txt")
# file.each do |line|
#     puts line
# end
# file.close

# num = 2
# 10.times do
#     print num, "\n"
#     num *= num
# end

# i = 8
# 7.times do
#     print i.class, " ", i, "\n"
#     i *= i
# end

# 123456                    # Fixnum
# 123_456                   # Fixnum (underscore ignored)
# -543                      # Negative Fixnum
# 123_456_789_123_345_789   # Bignum
# 0xaabb                    # Hexadecimal
# 0377                      # Octal
# -0b101_010                # Binary (negated)

# 3.times { print "hello " }
# 5.upto(7) { |i| print "upto:", i, " " }
# 5.downto(3) { |i| print "downto:", i, " " }
# 50.step(80, 10) { |i| print i, " "}

# puts %q/this is a single-quoted string/
# puts %Q!this is a double-quoted string!

class WordIndex
  def initialize
    @index = Hash.new(nil)
  end
  def index(anObject, *phrases)
    phrases.each do |aPhrase|
      aPhrase.scan /\w[-\w']+/ do |aWord|
        aWord.downcase!
        @index[aWord] = [] if @index[aWord].nil?
        @index[aWord].push(anObject)
      end
    end
  end
  def lookup(aWord)
    @index[aWord.downcase]
  end
end

# songs = SongList.new
#
# songFile = File.open("strings.txt")
#
# songFile.each do |line|
#   file, length, name, title = line.chomp.split(/\s*\|\s*/) if line != nil
#   # puts file, length, name, title
#   name.squeeze!(" ")
#   mins, secs = length.split(/\d+/)
#   songs.append Song.new(title, name, mins.to_i*60+secs.to_i)
# end
#
# songFile.close
#
# puts songs.lookup("Fats")
# puts songs.lookup("ain't")
# puts songs.lookup("RED")
# puts songs.lookup("WoRlD")

# =============================================================================
# = Ranges                                                                    =
# =============================================================================

# (1..10).each { |i| puts i  }
# (1..10).to_a        #convert to array
# ('bar'..'bat').each { |s| puts s }

# digits = 1..10
# puts digits.include?(5)
# puts digits.max
# puts digits.min
# puts digits.reject { |i| i<5 }
#
#
# class VU
#
#   include Comparable
#
#   attr :volume
#
#   def initialize(volume)  # 0..9
#     @volume = volume
#   end
#
#   def inspect
#     '#' * @volume
#   end
#   # Support for ranges
#   def <=>(other)
#     self.volume <=> other.volume
#   end
#
#   def succ
#     raise(IndexError, "Volume too big") if @volume >= 9
#     VU.new(@volume.succ)
#   end
# end
#
# medium = VU.new(4)..VU.new(7)
# puts medium.to_a

#puts (1..10) === 5
#puts (1..10) === 3.14159
#puts (1..10) === 13
#puts ('a'..'j') === 'c'


# =============================================================================
# = RegEx                                                                    =
# =============================================================================

# a = /regex/

# a = "Fats Waller"
#
# puts a =~ /a/
# puts a =~ /z/
# puts (a =~ /ll/)
#
 def showRE(a, reg)
   if a =~ reg
     "#{$`}<<#{$&}>>#{$'}"
   else
     "no match"
   end
 end
#
# puts showRE("This is a experiment", /e/)
# puts showRE('kangaroo', /angar/)
# puts showRE('yes | no', /\|/)
# puts showRE('yes (no)', /\(no\)/)
# puts showRE('It costs $12.', /[aeiou]/)
# puts showRE('It costs $12.', /[\s]/)
# a = 'It costs $12.'
# puts showRE(a, /c.s/)
# puts showRE(a, /\./)

# puts "12:50am" =~ /(\d\d):(\d\d)(..)/
# puts "Hour is #$1, minute #$2"
# puts "12:50am" =~ /((\d\d):(\d\d))(..)/
# puts "Time is #$1"
# puts "Hour is #$2, minute #$3"
# puts "AM/PM is #$4"

# match duplicated letter
# puts showRE('He said "Hello"', /(\w)\1/)
# match duplicated substrings
# puts showRE('Mississippi', /(\w+)\1/)
# a = "the quick brown fox"
# puts a.sub(/the/, "ou shit")
# puts a.sub(/^./) { $&.upcase }
# puts a.gsub(/[aeiou]/) { $&.upcase }
# def mixedCase(word)
#   word.gsub(/\b\w/) {$&.upcase}
# end
# puts mixedCase("louis armstrong")

# puts "fred:smith".sub(/(\w+):(\w+)/, '\2, \1')
# str = 'a\b\c'
# puts str
# puts str.gsub(/\\/, '\&\&')


# Match time

# re = /(\d+):(\d+)/

# md = re.match("Time: 13:37am")
# puts md
# puts md.class

# puts md[0]              # == $&
# puts md[1]              # == $1
# puts md[2]              # == $2
# puts md.pre_match+"<"   # == $`
# puts md.post_match      # == $'

# =============================================================================
# = Methods                                                                   =
# =============================================================================

# puts self.class
# def names(name1, *rest)
#     "#{name1}, #{rest.join(', ')} si schwul."
# end
#
# puts names('dini mueter', 'dr peter', 'ds vreni')

# def five(a, b, c, d, e)
#   "I was passed #{a}, #{b}, #{c}, #{d}, #{e}"
# end
# 
# puts five(1,1,1,1,1)
# puts five(1,2,3,*['a', 'b'])
# puts five(*(10..14).to_a)

# print "(t)imes or (p)lus: "
# times = gets
# print "number: "
# number = gets.to_i
# 
# if times =~ /^t/
#   puts ((1..10).collect {|n| n*number}.join(", "))
# end

def fibUpTo(max)
  i1, i2 = 1, 1        # parallel assignment
  while i1 <= max
    yield i1
    i1, i2 = i2, i1+i2
  end
end
# 
# a = []
# fibUpTo(20) { |val| a << val }
# 
# puts a.inspect

def into(anArray)
  return proc {|val| anArray << val}
end
# 
# fibUpTo 20, &into(a = [])
# 
# puts a.inspect

# ==================================================================
# = Expressions                                                    =
# ==================================================================

# a = b = c = 0
# puts a
# puts b
# puts c

# a = if 3 > 2
#       "expression"
#     end
# puts a

# puts `date` # befehl direkt auf OS ausfuehren
# puts %x{ls /} # das gleiche wie ``

# a = b = 1 + 2 + 3
# puts a
# puts b
# a = (b = 1 + 2) + 3
# puts a
# puts b

# a = 1
# b = 2
# 
# a, b = b, a
# 
# puts a, b

# puts defined? 1
# puts defined? dummy
# puts defined? printf
# puts defined? String
# puts defined? $&
# puts defined? $_
# puts defined? Math::PI
# puts defined? 42.abs

# negated form of if
# unless aSong.duration > 180 then
#   cost = .25
# else
#   cost = .35
# end

# value = 100.00000001
# result = value > 100 ? 'Ja' : 'Nein'
# puts result
# 
# date = '14-02-2011'
# mon, day, year = date.split('-') 

# mon, day, year = $1, $2, $3 if /(\d\d)-(\d\d)-(\d\d)/
# puts "a = #{a}" if fDebug
# print total unless total == 0

# puts mon, day, year

# a = 'dini mueter'

# case a
#    when "dini"
#    puts 'dini'
#
#    when /\w*/
#    puts 'regex'
#
#    when "dini", "mueter"
#    puts 'dini , mueter'
#    
#    else
#    puts 'else'
#end
#
#year = 1990
#kind = case year
#        when 1800..1900 then "very old"
#        when 1900..2000 then "old"
#       end
#
#puts kind

#while gets
  #  asdfasdfasdf
#end
#until i < 7
    #   asfa 
#end

#a *= 2 while a < 100
#a -= 10 until a < 100

# file = File.open("ordinal")
# while file.gets
#   print  if /third/ .. /fifth/
# end

# file = File.open("ordinal")
# while file.gets
#   print if ($. == 1) || /eig/ .. ($. == 3) || /nin/
#   puts $.
# end

# 3.times do
#   print "Ho! "
# end

# 0.upto(9) do |x|
#   print x, " "
# end

# 0.step(12, 3) {|x| print x, " "}

# [1, 2, 3, 4, 5].each {|val| print val, " "}

# File.open("ordinal").grep /d$/ do |line|
#   print line
# end

# ========================================================
# = Exceptions                                           =
# ========================================================
# 
# begin
#   asdf
# rescue StandardError => e
#   puts "ou shit: #{$!}"
#   raise
#   # raise
# else
#   puts 'else is gay'
# ensure
#   puts 'this is sure'
# end

# raise
# raise "bad mp3 encoding"
# raise InterfaceException, "Keyboard failure", caller
# 
# catch (:done)  do
#   while gets
#     throw :done unless fields = split(/\t/)
#     songList.add(Song.new(*fields))
#   end
#   songList.play
# end
# 
# def promptAndGet(prompt)
#   print prompt
#   res = readline.chomp
#   throw :quitRequested if res == "!"
#   return res
# end
# 
# catch :quitRequested do
#   name = promptAndGet("Name: ")
#   age  = promptAndGet("Age:  ")
#   sex  = promptAndGet("Sex:  ")
#   # ..
#   # process information
# end

# ========================================================
# = Modues                                               =
# ========================================================

$: << File.dirname(__FILE__)

require "module1"
require "module2"

puts Test.shout("deine")
puts Test2.shout("mudda")

# Test.shout("ou")
# Test2.shout("yeah")

# Module variable
Test.shout(Test::Text)
# Module constant
Test2.shout(Test2::TEXT)























