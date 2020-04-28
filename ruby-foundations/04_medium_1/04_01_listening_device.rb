class Device
  def initialize
    @recordings = []
  end

  
  def listen
    sound = yield if block_given?
    record(sound) unless sound.nil?
  end
  
  def play
    puts @recordings.last
  end
  
  private

  def record(recording)
    @recordings << recording
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play
