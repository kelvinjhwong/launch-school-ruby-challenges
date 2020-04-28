def any?(arr)
  arr.each { |element| return true if yield(element) }
  false
end

def none?(collection, &block)
  !(any?(collection, &block))
end

# ---------------------------------------------------------

def none?(collection)
  collection.each { |item| return false if yield(item) }
  true
end

none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true
