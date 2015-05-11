class CountLeaves
  def count_leaves c
    if c.is_a? Array
      count_array c
    elsif c.is_a? Hash
      count_hash c
    else
      1
    end
  end

  private

  def count_array c
    puts "in count_array"
    return 0 if c == []
    first = c.shift
    if (first.is_a? Array) || (first.is_a? Hash)
      count_leaves(first) + count_leaves(c)
    else
      1 + count_leaves(c)
    end
  end

  def count_hash c
    puts "in count_hash"
    return 0 if c == {}

    first = c.shift

    # puts first[first.keys[0]]
    if first[1].is_a? Array
      count_leaves(first[1]) + count_leaves(c)
      puts "1 + " + (count_leaves(c[c.keys[0]])).to_s
    elsif c[c.keys[0]].is_a? Hash
      count_leaves(c[c.keys[0]])
    else
      1 + count_leaves(c)
    end
  end
end
