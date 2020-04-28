def one?(collection)
  seen_one = false
  
  collection.each do |item|
    if yield(item)
      if !seen_one
        seen_one = true
      else
        return false
      end
    end
  end
  
  seen_one
end

# -------------------------------------------------------

def one?(collection)
  seen_one = false
  
  collection.each do |item|
    next unless yield(item)
    return false if seen_one
    seen_one = true
  end
  
  seen_one
end

one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false
