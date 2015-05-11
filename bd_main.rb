require_relative 'book_database'

bd = BookDatabase.new
bd.set_books({ #Need parenthesis here so Ruby doesn't think this is a block
  'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
  'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
  'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
  'William Goldman' => ['The Princess Bride']
})

puts "Author of Dune: " + bd.find_author('Dune')
puts ""
bd.print_books
