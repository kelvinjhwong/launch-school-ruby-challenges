def lights_on(n)
  lights = {}
  1.upto(n) { |i| lights[i] = false }
  1.upto(n) { |i| i.step(n, i) { |j| lights[j] = !lights[j] } }
  lights.keys.select { |idx| lights[idx] }
end

def lights_on(n)
  lights = [false]*n
  1.upto(n) { |i| i.step(n, i) { |j| lights[j] = !lights[j] } }
  lights.each_with_index.with_object([]) { |(light, idx), obj| obj << idx if light }
end

def number_of_factors(n)
  1.upto(n).reduce(0) { |obj, i| n % i == 0 ? obj + 1 : obj }
end

def lights_on(n)
  (1..n).select { |i| number_of_factors(i).odd? }
end

def lights_off(n)
  (1..n).to_a - lights_on(n)
end

def join_and(arr)
  arr[0..-2].join(', ') + ' and ' + arr[-1].to_s
end

def lights_on_lights_off_string(n)
  "Lights #{join_and(lights_off(n))} are now off; " + 
  "#{join_and(lights_on(n))} are on."
end

lights_on(5) == [1, 4]
lights_on(10) == [1, 4, 9]
lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

