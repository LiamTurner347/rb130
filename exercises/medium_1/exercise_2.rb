class TextAnalyzer
  def process
    text = File.open('sample_text.txt', 'r')
    yield(text.read)
    text.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split().size} words" }