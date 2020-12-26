class Bingo
  @numbers = []
  @choice_number = []

  def initialize
    #1~75の配列を15刻みで区切る
    @numbers = (1..75).each_slice(15).map do |array|
      #区切られた配列からさらにランダムに5個の数値を取得する
      array.sample(5)
    end
    #カード中央をFREEという文字に置き換える
    @numbers[2][2] = "FREE"
    #1~75の配列を作る
    choice_number = (1..75).to_a
    #配列からランダムに75個の数値を取得する
    @array_number = choice_number.sample(75)
  end

  def generate_number
    #16行目、配列からランダムに75個の数値を取得する
    @array_number
  end

  def bingo_start
    a = 0
    #game_timeはゲーム数
    game_time = 0
    #リーチのカウント
    reach_count = 0
    bingo_count = 0
    b_count = 0
    i_count = 0
    n_count = 0
    g_count = 0
    o_count = 0
    first_count  = 0
    second_count = 0
    third_count  = 0
    fourth_count = 0
    fifth_count  = 0
    b_slash_count = 0
    slash_count = 0
    first_count_check  = 0
    second_count_check = 0
    third_count_check  = 0
    fourth_count_check = 0
    fifth_count_check  = 0
    b_count_check = 0
    i_count_check = 0
    n_count_check = 0
    g_count_check = 0
    o_count_check = 0
    b_slash_count_check = 0
    slash_count_check = 0
    bingo_ball = []
    first_check = []
    #75回繰り返す
    while a < 75  do
      game_time += 1
      #bingo_ballという配列に
      bingo_ball << generate_number[a]
      puts "ball[#{game_time}]:#{bingo_ball[a]}"
      y_position = 0
      @numbers.transpose.each do |array|
        y_position += 1
        x_position = 0
        array.each do |n|
          x_position += 1
          if bingo_ball.include?(n)
            unless first_check.include?(n)
              first_check << n
              # 縦のカウンター
              if y_position == 1
                first_count += 1
              end

              if y_position == 2
                second_count += 1
              end

              if y_position == 3
                third_count += 1
              end

              if y_position == 4
                fourth_count += 1
              end

              if y_position == 5
                fifth_count += 1
              end

              # 横のカウンター
              if x_position == 1
                b_count += 1
              end

              if x_position == 2
                i_count += 1
              end

              if x_position == 3
                n_count += 1
              end

              if x_position == 4
                g_count += 1
              end

              if x_position == 5
                o_count += 1
              end

              # 斜めのカウンター
              if y_position == 1 && x_position == 1
                b_slash_count += 1
              end

              if y_position == 2 && x_position == 2
                b_slash_count += 1
              end

              if y_position == 4 && x_position == 4
                b_slash_count += 1
              end

              if y_position == 5 && x_position == 5
                b_slash_count += 1
              end

              if y_position == 1 && x_position == 5
                slash_count += 1
              end

              if y_position == 2 && x_position == 4
                slash_count += 1
              end

              if y_position == 4 && x_position == 2
                slash_count += 1
              end

              if y_position == 5 && x_position == 1
                slash_count += 1
              end
            end
            if n < 10
              print n.to_s.rjust(3, "(0") + ")"
            else
              print n.to_s.rjust(3, "(") + ")"
            end
          else
            if n == "FREE"
              print n.to_s.rjust(3, " ")
            else
              if n < 10
                print n.to_s.rjust(3, " 0") + " "
              else
                print n.to_s.rjust(3, " ") + " "
              end
            end
          end
        end
        puts
      end
      # 縦のリーチカウンター
      if first_count > 3 && first_count_check == 0
        first_count_check = 1
        reach_count += 1
      end

      if second_count > 3 && second_count_check == 0
        second_count_check = 1
        reach_count += 1
      end

      if third_count > 2 && third_count_check == 0
        third_count_check = 1
        reach_count += 1
      end

      if fourth_count > 3 && fourth_count_check == 0
        fourth_count_check = 1
        reach_count += 1
      end

      if fifth_count > 3 && fifth_count_check == 0
        fifth_count_check = 1
        reach_count += 1
      end

      # 横のリーチカウンター
      if b_count > 3 && b_count_check == 0
        b_count_check = 1
        reach_count += 1
      end

      if i_count > 3 && i_count_check == 0
        i_count_check = 1
        reach_count += 1
      end

      if n_count > 2 && n_count_check == 0
        n_count_check = 1
        reach_count += 1
      end

      if g_count > 3 && g_count_check == 0
        g_count_check = 1
        reach_count += 1
      end

      if o_count > 3 && o_count_check == 0
        o_count_check = 1
        reach_count += 1
      end

      # 斜めのリーチカウンター
      if b_slash_count > 2 && b_slash_count_check == 0
        b_slash_count_check = 1
        reach_count += 1
      end

      if slash_count > 2 && slash_count_check == 0
        slash_count_check = 1
        reach_count += 1
      end

      #縦のビンゴカウンター
      if first_count == 5
        bingo_count += 1
      end

      if second_count == 5
        bingo_count += 1
      end

      if third_count == 4
        bingo_count += 1
      end

      if fourth_count == 5
        bingo_count += 1
      end

      if fifth_count == 5
        bingo_count += 1
      end

      #横のビンゴカウンター
      if b_count == 5
        bingo_count += 1
      end

      if i_count == 5
        bingo_count += 1
      end

      if n_count == 4
        bingo_count += 1
      end

      if g_count == 5
        bingo_count += 1
      end

      if o_count == 5
        bingo_count += 1
      end

      # 斜めのリーチカウンター
      if b_slash_count == 4
        bingo_count += 1
      end

      if slash_count == 4
        bingo_count += 1
      end

      puts "REACH: #{reach_count}"
      puts "BINGO: #{bingo_count}"
      puts "--------------------"
      if bingo_count > 0
        break
      end
      a += 1
    end
  end
end
bingo = Bingo.new
bingo.bingo_start