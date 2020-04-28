=begin

Data structure:
- Each element is an object of a `Node` class
- Each `Node` object has instance variables @parent, @left, @right, @value,
  and is a collaborator object of other `Node` objects

=end

class Bst
  def initialize(data)
    @tree_top = Node.new(data)
  end
  
  def data # Returns the current node's data
    tree_top.data
  end
  
  def insert(data) # Inserts data in the right place
    node_to_compare = tree_top
    # If <= node_to_compare, then go left
    # Else if > node_to_compare, then go right
    # Else if node_to_compare is nil, add create new Node and put it there
    until node_to_compare.data.nil?
      node_to_compare =
        data > node_to_compare.data ? node_to_compare.right : node_to_compare.left
    end
    
  end
  
  def left
    tree_top.left
  end
  
  def right
    tree_top.right
  end
  
  def each # Yields all data in order, returns Enumerator if no block
    
  end
  
  private
  
  attr_reader :tree_top
end

class Node
  attr_reader :data, :left, :right, :parent
  
  def initialize(data, parent=nil)
    @data = data
    @parent = parent # Another Node object
  end
end