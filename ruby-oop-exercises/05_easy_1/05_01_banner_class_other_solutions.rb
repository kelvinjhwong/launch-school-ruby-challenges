class Banner
  BORDER = 2

  def initialize(message, banner_width = message.size + 4)
    @message = message
    @banner_width = require_minimum(banner_width)
    @padding = calculate_padding
    @msg_width = @banner_width - @padding - BORDER
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line,
     horizontal_rule].join("\n")
  end

  private
  attr_reader :message, :msg_width, :banner_width, :padding

  def calculate_padding
    banner_width - 4 > message.size ? banner_width - message.size - BORDER : 2
  end

  def inner_width
    msg_width + padding
  end

  def formatted(msg)
    msg_pad = (inner_width - msg.size)
    pad1, extra = msg_pad.divmod(2)
    pad2 = pad1 + extra
    "|#{" " * pad1}#{msg}#{" " * pad2}|"
  end

  def minimum_length
    (message.split.map(&:size).max || 0) + 4
  end

  def require_minimum(banner_length)
    banner_length < minimum_length ? minimum_length : banner_length
  end

  def horizontal_rule
    "+#{"-" * inner_width}+"
  end

  def empty_line
    "|#{" " * inner_width}|"
  end

  def last_space(msg)
    (msg.size - 1).downto(0) { |i| return i if msg[i] == " " }
  end

  def line_wrap
    portions = []
    msg = message.clone
    loop do
      length = last_space(msg[0, msg_width])
      portion = msg.slice!(0, length)
      portions << formatted(portion)
      msg = msg.strip
      break if msg.size <= msg_width
    end
    portions << formatted(msg) unless msg.empty?
    portions
  end

  def message_line
    if msg_width < message.size
      line_wrap
    else
      formatted(message)
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('', 20)
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 20)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 2)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 60)
puts banner

#-------------------------------------------------------------

class Banner
  STANDARD_WIDTH = 76
  SPACING_WIDTH = 4

  def initialize(message, banner_width = message.size)
    @banner_width = determine_banner_width(message, banner_width)
    @message = determine_message(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, 
     empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :banner_width

  def determine_message(msg)
    return [msg] if msg.size < banner_width
    msg.gsub(/(.{1,#{banner_width}})(\s+|\Z)/, "\\1\n").strip.split("\n")
  end

  def too_short?(msg)
    return true if msg.empty?
    msg.size < SPACING_WIDTH
  end

  def handle_too_short(msg, width)
    return SPACING_WIDTH if msg.empty?
    if width == msg.size || width < SPACING_WIDTH
      SPACING_WIDTH + msg.size
    else
      width
    end
    width != msg.size ? width - SPACING_WIDTH : SPACING_WIDTH + msg.size  
  end

  def too_long?(msg, width)
    (msg.size > STANDARD_WIDTH && msg.size == width) ||
    (max_word_width(msg)) > width
  end

  def handle_too_long(msg, width)
    if msg.size > STANDARD_WIDTH && msg.size == width
      STANDARD_WIDTH
    else
      max_word_width(msg)
    end
  end

  def determine_banner_width(msg, width)
    if too_short?(msg)
      handle_too_short(msg, width)
    elsif too_long?(msg, width)
      handle_too_long(msg, width)
    else
      width - SPACING_WIDTH
    end
  end  

  def max_word_width(msg)
    msg.split.max_by(&:size).size
  end

  def horizontal_rule
    "+-#{'-' * banner_width}-+"
  end

  def empty_line
    "| #{' ' * banner_width} |"
  end

  def message_line
    message.map do |line|
      line << ' ' * (banner_width - line.size) if message.size > 1
      "| #{line.center(banner_width)} |"
    end
  end
end

banner = Banner.new('')
puts banner

banner = Banner.new('1')
puts banner

banner = Banner.new('1', 40)
puts banner

banner = Banner.new('02')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 5)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 100)
puts banner

banner = Banner.new("This example demonstrates a block quote. Because some introductory phrases will lead naturally into the block quote, you might choose to begin the block quote with a lowercase letter. In this and the later examples we use “Lorem ipsum” text to ensure that each block quotation contains 40 words or more. Lorem ipsum dolor sit amet, consectetur adipiscing elit. (Organa, 2013, p. 234)\nModify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.")
puts banner

