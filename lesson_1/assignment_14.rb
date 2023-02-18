def call_me(some_code)
  some_code.call("Richard")
end

chunk_of_code = Proc.new { |name| puts "hi #{name}"}
name = "Griffin III"

call_me(chunk_of_code)