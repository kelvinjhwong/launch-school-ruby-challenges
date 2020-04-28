items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, grain|
  puts produce.join(', ')
  puts grain
end

gather(items) do |fruit, *vegetables, grain|
  puts fruit
  puts vegetables.join(', ')
  puts grain
end

gather(items) do |fruit, *veg_and_grain|
  puts fruit
  puts veg_and_grain.join(', ')
end

gather(items) do |fruit, root, leaf, grain|
  puts "#{fruit}, #{root}, #{leaf}, and #{grain}"
end
