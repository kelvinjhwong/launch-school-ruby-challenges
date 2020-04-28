=begin
* Create new Enumerator object, defining what values to iterate on
* Iterate over an infinite list of factorials
* Print the first 7 factorial values, starting from 0!, using
  external iterator
* Reset Enumerator
* Print first 7 factorial values again, this time using 
  internal iterator

* Use ::new method, also internal and external iterators
* Only need 3 Enumerator methods; can also use Enumerable module
=end

factorials = Enumerator.new do |yielder|
  number = 0
  factorial_value = 1
  loop do
    yielder << factorial_value
    
    number += 1
    factorial_value *= number
  end
end

7.times do
  puts factorials.next
end

factorials.rewind

factorials.each_with_index do |num, idx|
  puts num
  break if idx >= 6
end