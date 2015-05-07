#When doing this exercise, use methods when appropriate to keep things organized.
require 'set'

snowy = File.read 'the-man-from-snowy-river.txt'
clancy = File.read 'clancy-of-the-overflow.txt'
words = File.read '/usr/share/dict/words'
snowy_words = snowy.split /\W+/
clancy_words = clancy.split /\W+/

#A set is a daa structure that can have things added and removed, and you can ask if things are in it. You can make one from an array
dictionary = Set.new File.read('/usr/share/dict/words').lines.map{|w| w.chomp}


#We can treat arrays as sets, and use + for union, - for difference
puts "Words in snowy but not clancy"
# puts (snowy_words - clancy_words).uniq.join ', '
# puts ((snowy_words - clancy_words).uniq).count
# puts ((snowy_words - clancy_words).uniq { |word| word.downcase}).join ', '
puts (((snowy_words.uniq {|word| word.downcase}) - (clancy_words).uniq {|word| word.downcase})).join ', '
# puts ((snowy_words - clancy_words).uniq { |word| word.downcase}).count
puts
puts "… and the reverse"
puts (clancy_words - snowy_words).uniq.join ', '
puts ((clancy_words - snowy_words).uniq).count
# puts ((clancy_words - snowy_words).uniq { |word| word.downcase}).join ', '
# puts ((clancy_words - snowy_words).uniq { |word| word.downcase}).count
# puts (((clancy_words.uniq {|word| word.downcase}) - (snowy_words).uniq {|word| word.downcase})).join ', '
# puts (((clancy_words.uniq {|word| word.downcase}) - (snowy_words).uniq {|word| word.downcase})).count

#The above are great, but note that we get both 'There' and 'there' separately (and others). Fix that.

puts
puts "The longest word in snowy is"
length_sorted = snowy_words.sort_by {|word| word.length}
puts length_sorted.last

#Here, find the words that are in Snowy but not in the dictionary
puts
puts "Names in Snowy are:"
# puts ((snowy_words - dictionary.to_a).uniq { |word| word.downcase}).join ', '
puts (((snowy_words.uniq {|word| word.downcase}) - (dictionary.to_a).uniq {|word| word.downcase})).join ', '
# puts (snowy_words - dictionary.to_a).uniq.join ', '

# (dictionary.to_a).each do |word|
#   puts word
# end

#Look up the documentation for Set to see how to test if a word is in it or not

puts
puts "Names in both Snowy and Clancy:"


#Change this so it uses an array rather than a set. Marvel at how much slower it is.
#You can time how long something takes to run in bash by doing time before the command.
#So time ruby ruby-exercise-5.rb will tell you how long that took to run
