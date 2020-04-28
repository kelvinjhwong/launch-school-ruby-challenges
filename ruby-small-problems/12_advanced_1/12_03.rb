=begin
Get number of rows, m
Get number of columns, n
Construct a new n by m matrix, row by row
For the ith row of the new matrix
  Get the ith element of every row of the original matrix
=end

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

# Only for square matrices
def transpose!(matrix)
  n = matrix.size
  n.times do |i|
    ((i + 1)..(n - 1)).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3],
                 [5, 7, 9],
                 [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
