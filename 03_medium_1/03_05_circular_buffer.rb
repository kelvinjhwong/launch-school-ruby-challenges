# Did not watch solution video

class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end
  
  def read
    # If empty, raise BufferEmptyException
    # Remove and return the oldest element
    
    raise(BufferEmptyException) if buffer.empty?
    buffer.shift
  end
  
  def write(element)
    # Add element to after the newest element, unless element is nil

    raise(BufferFullException) if buffer.size == size
    buffer << element unless element.nil?
  end
  
  def clear
    self.buffer = []
  end
  
  def write!(element)
    # Same as #write, except if buffer is full
    #   In which case, overwrite the oldest item, unless element is nil
    
    write(element)
    
    rescue BufferFullException
    
    unless element.nil?
      buffer.shift
      buffer << element
    end
  end
  
  private
  
  attr_reader :size
  attr_accessor :buffer
  
  class BufferEmptyException < StandardError
  end
  
  class BufferFullException < StandardError
  end
end
