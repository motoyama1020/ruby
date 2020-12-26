puts "ようこそ！ \n名前を入力してください"
name = gets.chomp

puts "秒数を知りたい時間を分単位で入力してください"
minutes = gets.to_i
seconds = minutes * 60

puts "#{name}さん、#{minutes}分は#{seconds}秒です！"

# puts "あなたの名字を入力してください"
# miyoji = gets.chomp
# puts "あなたの名前を入力してください"
# name = gets.chomp

# puts "「私の名前は#{miyoji + name}です。」"