def bingo_ball
  ball_number = (1..75).to_a
  puts ball_number.sample(75)
end

bingo_ball
