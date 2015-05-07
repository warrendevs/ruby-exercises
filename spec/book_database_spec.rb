require_relative 'spec_helper'
require_relative '../book_database'

RSpec.describe BookDatabase do
  bd = BookDatabase.new
  bd.set_books({ #Need parenthesis here so Ruby doesn't think this is a block
    'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
    'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
    'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
    'William Goldman' => ['The Princess Bride']
  })

  describe "count" do
      it "returns 4 for the count for Frank Herbert" do
        expect(bd.count_books 'Frank Herbert').to eq 4
      end

      it "returns 1 for the count for William Goldman" do
        expect(bd.count_books 'William Goldman').to eq 1
      end
  end

  describe "get" do
    it "returns Dune and Dune Messiah for Frank Herbert" do
      books = bd.get_books "Frank Herbert"
      expect(books).to include 'Dune'
      expect(books).to include 'Dune Messiah'
      # expect(books).to include 'Children of Dune'
      # expect(books).to include 'God Emperor of Dune'
    end

    it "returns The Princess Bride for William Goldman" do
      books = bd.get_books "William Goldman"
      expect(books).to include 'The Princess Bride'
    end
  end

  describe "find" do
      it "returns Frank Herbert for Dune" do
        expect(bd.find 'Dune').to eq 'Frank Herbert'
      end

      it "returns William Goldman for The Princess Bride" do
        expect(bd.find 'The Princess Bride').to eq 'William Goldman'
      end
  end

  describe "add" do
    it "Add new author: returns 2 for count and Mark Twain on find on newly added books" do
      bd.add_book('Mark Twain', "Adventures of Huckleberry Finn")
      bd.add_book('Mark Twain', "The Adventures of Tom Sawyer")
      expect(bd.count_books 'Mark Twain').to eq 2
      expect(bd.find 'Adventures of Huckleberry Finn').to eq 'Mark Twain'
      expect(bd.get_books 'Mark Twain').to include 'The Adventures of Tom Sawyer'
    end
    it "Add to existing author: returns 4 for count and Isaac Asimov on find on newly added books" do
      bd.add_book('Isaac Asimov', 'Bicentennial Man')
      expect(bd.count_books 'Isaac Asimov').to eq 4
      expect(bd.find 'Bicentennial Man').to eq 'Isaac Asimov'
      expect(bd.get_books 'Isaac Asimov').to include 'Bicentennial Man'
    end
  end

  describe "delete" do
    it "returns 'No such book'  for deleted book" do
      bd.delete_book('Frank Herbert', "Dune")
      expect(bd.find 'Dune').to eq 'No such book'
    end
  end
end
