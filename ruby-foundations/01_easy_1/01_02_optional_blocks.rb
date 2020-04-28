def compute
  block_given? ? yield : 'Does not compute.'
end

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

compute(7) { |num| num + 4 }
compute('abc') { |str| str + 'def' }
compute('No block')
