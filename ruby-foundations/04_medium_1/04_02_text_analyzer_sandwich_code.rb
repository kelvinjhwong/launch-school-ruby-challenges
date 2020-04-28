class TextAnalyzer
  def process(text)
    yield(text)
  end
end

analyzer = TextAnalyzer.new

analyzer.process(File.read('04_02_sample_text.txt')) do |text|
  puts "#{text.split("\n\n").size} paragraphs"
end

analyzer.process(File.read('04_02_sample_text.txt')) do |text|
  puts "#{text.split("\n").size} lines"
end

analyzer.process(File.read('04_02_sample_text.txt')) do |text|
  puts "#{text.split.size} words"
end

# ----------------------------------------------------------------------

class TextAnalyzer
  def process
    yield(File.read('04_02_sample_text.txt'))
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text|
  puts "#{text.split("\n\n").size} paragraphs"
end

analyzer.process do |text|
  puts "#{text.split("\n").size} lines"
end

analyzer.process do |text|
  puts "#{text.split.size} words"
end

# ----------------------------------------------------------------------

class TextAnalyzer
  def process
    file = File.open('04_02_sample_text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text|
  puts "#{text.split("\n\n").size} paragraphs"
end

analyzer.process do |text|
  puts "#{text.split("\n").size} lines"
end

analyzer.process do |text|
  puts "#{text.split.size} words"
end

