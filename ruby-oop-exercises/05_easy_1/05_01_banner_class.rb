class Banner
  def initialize(message, width = -1)
    @message = message
    @message_width = width == -1 ? message.length : width - 4
  end

  def to_s
    [horizontal_rule, empty_line, message_lines, empty_line, horizontal_rule].flatten.join("\n")
  end

  private
  
  attr_reader :message, :message_width

  def message_length
    message.length
  end
  
  def horizontal_rule
    "+-#{'-' * message_width}-+"
  end

  def empty_line
    "| #{' ' * message_width} |"
  end

  def message_lines
    lines = []
    last_line_end = -1
    loop do
      if last_line_end + message_width >= message_length - 1
        # Current line is shorter than message_width
        lines << message[(last_line_end + 1)...message_length]
        last_line_end = message_length - 1
      elsif message[last_line_end + message_width] == ' '
        # Current line's last char is whitespace
        lines << message[last_line_end + 1, message_width]
        last_line_end = last_line_end + message_width
      elsif message[last_line_end + message_width + 1] == ' '
        # Current line's last char is the end of a word
        lines << message[last_line_end + 1, message_width]
        last_line_end = last_line_end + message_width + 1
      else
        # Find last whitespace char in current line
        last_blank_idx = nil
        (last_line_end + message_width).downto(last_line_end + 1) do |idx|
          if message[idx] == ' '
            last_blank_idx = idx
            break
          end
        end
        
        if last_blank_idx.nil?
          # No whitespace char exists in current line
          lines << message[last_line_end + 1, message_width]
          last_line_end = last_line_end + message_width
        else
          # End the line at the last whitespace char
          lines << message[(last_line_end + 1)..last_blank_idx]
          last_line_end = last_blank_idx
        end
      end
      
      break if last_line_end >= message_length - 1
    end
    
    lines.map do |line|
      "| #{line.center(message_width)} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

puts Banner.new('To boldly go where no one has gone before.', 10)

puts Banner.new('abc', 20)

puts Banner.new('abc def')

puts Banner.new('abcdefghijklmnopqrstuvwxyz', 10)

puts Banner.new('Our solution simply adds an instance variable where we store the message that will be bannerized', 20)

puts Banner.new('Our solution simply adds an instance variable where we store the message that will be bannerized, and then fills out the empty_line and horizontal_rule methods for constructing the first, second, fourth, and fifth lines of the banner. The only tricky part in these two methods is remembering to allow for extra characters to the left and right so everything is aligned.', 60)

puts Banner.new('Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.', 40)