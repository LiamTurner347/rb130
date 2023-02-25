=begin
def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } # == 8
p compute { 'a' + 'b' } # == 'ab'
p compute # == 'Does not compute.'
=end

def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

p compute(5) { |arg| arg + 3 } # == 8
p compute(5) { |arg| arg * 3 } # == 15
p compute(5) # == 'Does not compute.'