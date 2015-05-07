#The exercise is to make the last exercise answer clearer, shorter and simpler using methods
def to_words s
  s.split /[\W]+/
end

def starts_with_vowel s
  #FIXME Errors on an empty string
  #w{a e i o u} is a quick way of writing ['a', 'e', 'i', 'o', 'u']
  %w{a e i o u}.include? s[0].downcase #Can you see why we use downcase here?
end

# def has_odd_words s
#   ((to_words s).count % 2) != 0
# end

snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines
snowy_words = to_words snowy

#Example
puts "Here are the lines of Snowy that start with a vowel"

snowy_lines.each do |line|
  puts line if starts_with_vowel line
end

puts
puts "Here are the lines of Snowy that have an odd number of words"
#hint: a % b is the remainder after you divide a by b (called "mod" or "modulus")
# for example 17 % 2 == 1
snowy_lines.each do |line|
  # puts line if has_odd_words line

  puts line if (((to_words line).count % 2) != 0)

  # if (((to_words line).count % 2) != 0)
  #   puts line
  # end
end

puts
puts "Here are all the rhyming pairs from the ends of the Snowy lines"
i = 0
while i < snowy_lines.count

  line1_last = (to_words snowy_lines[i]).last
  line2_last = (to_words snowy_lines[i+1]).last
  line3_last = (to_words snowy_lines[i+2]).last
  line4_last = (to_words snowy_lines[i+3]).last
  line5_last = (to_words snowy_lines[i+4]).last
  line6_last = (to_words snowy_lines[i+5]).last
  line7_last = (to_words snowy_lines[i+6]).last
  line8_last = (to_words snowy_lines[i+7]).last
  puts line1_last + ", " + line3_last
  puts line2_last + ", " + line4_last
  puts line5_last + ", " + line7_last
  puts line6_last + ", " + line8_last

  i += 9 # This is a short way of writing i = i + 1
end
