# def say_hello
#   puts "hello world"
# end
# say_hello

def mixer(fruit)
  puts "#{fruit}を細かく砕く"
  return "#{fruit}ジュース"
end

puts "フルーツを入力してください"
input = gets.chomp

mixer input