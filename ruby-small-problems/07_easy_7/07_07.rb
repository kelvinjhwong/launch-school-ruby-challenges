def show_multiplicative_average(array)
  format("The result is %.3f", array.reduce(:*).to_f / array.size)
end

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2, 5, 7, 11, 13, 17])
