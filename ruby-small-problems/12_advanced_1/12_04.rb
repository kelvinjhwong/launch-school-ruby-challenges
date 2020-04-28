def transpose(matrix)
  m = matrix.size
  n = matrix[0].size
  transposed_matrix = []
  n.times do |i|
    transposed_row = []
    m.times do |j|
      transposed_row << matrix[j][i]
    end
    transposed_matrix << transposed_row
  end
  transposed_matrix
end

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]
