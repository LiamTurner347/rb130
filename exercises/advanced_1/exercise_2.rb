# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc #When we call puts on a Proc object it will output the class (i.e. Proc), an encoding of the object id and a reference to the file
puts my_proc.class #Proc objects form part of the Proc class
my_proc.call #We call a Proc using the #Proc.call method. If we don't pass a required argument, the parameter will be set to nil. Lenient arity. 
my_proc.call('cat') #The arguments passed to #Proc.call will be assigned to the block parameters for the Proc. 

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda #It seems we have two methods for creating lambdas (inc ->)
puts my_lambda.class #Lambdas appear to be a subset of the Proc class.
my_lambda.call('dog') #The arguments passed to #Proc.call will be assigned to the block parameters for the lambda. 
# my_lambda.call #Lambdas have strict arity - we must pass the correct number of arguments to Proc#call.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } #We cannot create a lambda with this syntax

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} #We can yield even if we pass the wrong number of arguments. Lenient arity for blocks. A missing block parameter will default to nil. 
# block_method_1('seal') #If we yield without a block we get a LocalJumpError.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." #As above, missing arguments to yield will default to nil.
end
block_method_2('turtle') { puts "This is a #{animal}."} 