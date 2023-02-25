=begin
def my_method
  yield(2, 25, 33)
end

a_proc = :to_s.to_proc          # explicitly call to_proc on the symbol
p a_proc
p my_method(&a_proc)              # convert Proc into block, then pass block in. Returns "2"

def welcome(str)
  puts str + ' ' + block.call
end

welcome('Hello') { 'there' }                    # => Hello there
welcome('Hey') { 'Joe' }                        # => Hey Joe
welcome('Hi!')                                  # => Hi! (there's a space after the !)

def call_chunk(code_chunk)
  code_chunk.call
end

color = "blue"
say_color = Proc.new {puts "The color is #{color}"}
call_chunk(say_color)

p "the cat in the hat".split.map(&:capitalize).join(' ') # => "The Cat In The Hat"

p [2, 3, 5].inject(1, &:+)

p [2, 3, 5].inject(1) { |total, num| num + num }
p [2, 3, 5].inject { |total, num| total + num }
p [2, 3, 5].inject { |total, num| num + num }
p [2, 3, 5].inject(1) { |total, num| total + num }
=end

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do |x|
  # block body
end
