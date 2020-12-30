class Bingo
  @bingo_card = []
  @choice_number = []

  def initialize
    #1~75の配列を15刻みで区切る
    @bingo_card = (1..75).each_slice(15).map do |array|
      #区切られた配列からさらにランダムに5個の数値を取得する
      array.sample(5)
    end
    #カード中央をFREEという文字に置き換える
    @bingo_card[2][2] = "FREE"
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
    #繰り返し数
    a = 0
    #game_timeはゲーム数
    game_time = 0
    #リーチのカウント
    reach_count = 0
    #ビンゴのカウント
    bingo_count = 0
    #B列の穴空きカウント
    b_count = 0
    #I列の穴空きカウント
    i_count = 0
    #N列の穴空きカウント
    n_count = 0
    #G列の穴空きカウント
    g_count = 0
    #O列の穴空きカウント
    o_count = 0
    #1行目の穴空きカウント
    first_count  = 0
    #2行目の穴空きカウント
    second_count = 0
    #3行目の穴空きカウント
    third_count  = 0
    #4行目の穴空きカウント
    fourth_count = 0
    #5行目の穴空きカウント
    fifth_count  = 0
    #\上の穴空きカウント
    b_slash_count = 0
    #/上の穴空きカウント
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
      #bingo_ball配列に今回引いたボールの番号を入れる
      bingo_ball << generate_number[a]
      #ゲーム数と今回引いたボールの番号を表示する
      puts "ball[#{game_time}]:#{bingo_ball[a]}"
      y_position = 0
      @bingo_card.transpose.each do |array|
        y_position += 1
        x_position = 0
        array.each do |n|
          x_position += 1
          #bingo_ball配列にbingo_cardの数値が入っていたら
          if bingo_ball.include?(n)
            #first_check配列にbingo_cardの数値が入っていなかったら
            unless first_check.include?(n)
              #一度引いたボールの数値をfirst_check配列に入れる
              first_check << n
              #縦のカウンター
              #の
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
              #該当した場合、10より小さい数値は(0)をつける
              print n.to_s.rjust(3, "(0") + ")"
            else
              #該当した場合、10以上の数値は()をつける
              print n.to_s.rjust(3, "(") + ")"
            end
          #bingo_ball配列にbingo_cardの数値が入っていなかったら
          else
            #FREE該当時のFREE文字の表示
            if n == "FREE"
              print "FREE"
            else
              if n < 10
                #該当なしの場合,10より小さい数値は前に0＆後ろに空白を入れる
                print n.to_s.rjust(3, " 0") + " "
              else
                #該当なしの場合,10以上の数値は前後に空白を入れる
                print n.to_s.rjust(3, " ") + " "
              end
            end
          end
        end
        #改行させ、5x5で並ぶ様にする
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

      #改行
      puts
      #リーチのカウントを表示
      puts "REACH: #{reach_count}"
      #ビンゴのカウントを表示
      puts "BINGO: #{bingo_count}"
      #区切り線の表示
      puts "--------------------"

      #ビンゴのカウントが1以上になったら終了する
      if bingo_count > 0
        break
      end
      #繰り返し数に1足す
      a += 1
    end
  end
end
bingo = Bingo.new
bingo.bingo_start