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


class VU

  include Comparable

  attr :volume

  def initialize(volume)  # 0..9
    @volume = volume
  end

  def inspect
    '#' * @volume
  end
  # Support for ranges
  def <=>(other)
    self.volume <=> other.volume
  end
 
  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end

# medium = VU.new(4)..VU.new(7)  
# puts medium.to_a 

#puts (1..10) === 5
#puts (1..10) === 3.14159
#puts (1..10) === 13
#puts ('a'..'j') === 'c'


# =============================================================================
# = RegEx                                                                    =
# =============================================================================















































