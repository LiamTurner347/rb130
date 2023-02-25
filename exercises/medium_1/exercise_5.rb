items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(*produce, wheat)
  puts "Let's start gathering food."
  p produce
  puts wheat
  puts "We've finished gathering!"
end

gather(*items) # notice we need a splat operator for passing in that array now.
