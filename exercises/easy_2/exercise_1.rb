def step(start_val, end_val, step)
  stepper = start_val.clone
  until stepper > end_val
    yield(stepper)
    stepper += step
  end

  stepper
end

step(1, 10, 3) { |value| puts "value = #{value}" }