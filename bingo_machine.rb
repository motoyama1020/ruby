class Bingo

  def initialize
    #1~75の配列を15刻みで区切る
    @bingo_card = (1..75).each_slice(15).map do |array|
      #区切られた配列からさらにランダムに5個の数値を取得する
      array.sample(5)
    end
    #カード中央をFREEという文字に置き換える
    @bingo_card[2][2] = "FREE"
    #1~75の配列を作る
    @choice_number = (1..75).to_a
    #配列からランダムに75個の数値を取得する
    @ball_number = @choice_number.sample(75)
  end

  def bingo_start
    #ゲーム数
    game_time    = 0
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
    #\上の穴空きカウント
    b_slash_count = 0
    #/上の穴空きカウント
    slash_count   = 0
    #リーチのカウント
    reach_count   = 0
    #ビンゴのカウント
    bingo_count  = 0
    #リーチ数がダブらない様に
    first_reach  = 0
    second_reach = 0
    third_reach  = 0
    fourth_reach = 0
    fifth_reach  = 0
    b_reach = 0
    i_reach = 0
    n_reach = 0
    g_reach = 0
    o_reach = 0
    b_slash_reach = 0
    slash_reach =   0
    #ビンゴ数がダブらない様に
    first_bingo  = 0
    second_bingo = 0
    third_bingo  = 0
    fourth_bingo = 0
    fifth_bingo  = 0
    b_bingo = 0
    i_bingo = 0
    n_bingo = 0
    g_bingo = 0
    o_bingo = 0
    b_slash_bingo = 0
    slash_bingo   = 0
    #引いたボールの番号を入れていく配列
    bingo_ball  = []
    #ビンゴカードの数値を入れていく配列
    first_check = []
    #75回繰り返す
    while game_time < 75  do
      #bingo_ball配列に今回引いたボールの番号を入れる
      bingo_ball << @ball_number[game_time]
      #ゲーム数と今回引いたボールの番号を表示する
      puts "ball[#{game_time + 1}]:#{bingo_ball[game_time]}"
      #ゲーム数を１ずつ足していく
      game_time += 1
      
      #＜ビンゴカードの出力コード＞
      y_position = 0
      @bingo_card.transpose.each do |array|
        y_position += 1
        x_position = 0
        array.each do |n|
          x_position += 1
          #カードの数値がボールの数値と一致していたら
          if bingo_ball.include?(n)
            #2ゲーム目以降のダブりをカウントしない様に
            unless first_check.include?(n)
              #カードの数値をfirst_checkに入れる
              first_check << n
              #横の一致カウンター
              #1行目の数値が該当していたらfirst_countを+1する
              if y_position == 1
                first_count += 1
              end

              #2行目の数値が該当していたらsecond_countを+1する
              if y_position == 2
                second_count += 1
              end

              #3行目の数値が該当していたらthird_countを+1する
              if y_position == 3
                third_count += 1
              end

              #4行目の数値が該当していたらfourth_countを+1する
              if y_position == 4
                fourth_count += 1
              end

              #5行目の数値が該当していたらfifth_countを+1する
              if y_position == 5
                fifth_count += 1
              end

              #縦の一致カウンター
              #b列目の数値が該当していたらb_countを+1する
              if x_position == 1
                b_count += 1
              end

              #i列目の数値が該当していたらi_countを+1する
              if x_position == 2
                i_count += 1
              end

              #n列目の数値が該当していたらn_countを+1する
              if x_position == 3
                n_count += 1
              end

              #g列目の数値が該当していたらg_countを+1する
              if x_position == 4
                g_count += 1
              end

              #o列目の数値が該当していたらo_countを+1する
              if x_position == 5
                o_count += 1
              end

              #斜め(\)の一致カウンター
              #座標(1,b)の数値が該当していたらb_slash_countを+1する
              if y_position == 1 && x_position == 1
                b_slash_count += 1
              end

              #座標(2,i)の数値が該当していたらb_slash_countを+1する
              if y_position == 2 && x_position == 2
                b_slash_count += 1
              end

              #座標(4,g)の数値が該当していたらb_slash_countを+1する
              if y_position == 4 && x_position == 4
                b_slash_count += 1
              end

              #座標(5,o)の数値が該当していたらb_slash_countを+1する
              if y_position == 5 && x_position == 5
                b_slash_count += 1
              end

              #斜め(/)の一致カウンター
              #座標(5,b)の数値が該当していたらb_slash_countを+1する
              if y_position == 1 && x_position == 5
                slash_count += 1
              end

              #座標(4,i)の数値が該当していたらb_slash_countを+1する
              if y_position == 2 && x_position == 4
                slash_count += 1
              end

              #座標(2,g)の数値が該当していたらb_slash_countを+1する
              if y_position == 4 && x_position == 2
                slash_count += 1
              end

              #座標(1,o)の数値が該当していたらb_slash_countを+1する
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
          #カードの数値がボールの数値と一致していなかったら
          else
            #FREE該当時のFREE文字の表示
            if n == "FREE"
              print "FREE"
            elsif n < 10
              #該当なしの場合,10より小さい数値は前に0＆後ろに空白を入れる
              print n.to_s.rjust(3, " 0") + " "
            else
              #該当なしの場合,10以上の数値は前後に空白を入れる
              print n.to_s.rjust(3, " ") + " "
            end
          end
        end
        #改行させ、5x5で並ぶ様にする
        puts
      end
      #＜/ビンゴカードの出力コード＞

      #横のリーチカウンター
      #１行目に一致した数値が4つあり、first_reachが0ならば
      if first_count == 4 && first_reach == 0
        first_reach = 1
        reach_count += 1
      end

      #2行目に一致した数値が4つあり、second_reachが0ならば
      if second_count == 4 && second_reach == 0
        second_reach = 1
        reach_count += 1
      end

      #3行目に一致した数値が3つあり、third_reachが0ならば
      if third_count == 3 && third_reach == 0
        third_reach = 1
        reach_count += 1
      end

      #4行目に一致した数値が4つあり、fourth_reachが0ならば
      if fourth_count == 4 && fourth_reach == 0
        fourth_reach = 1
        reach_count += 1
      end

      #5行目に一致した数値が4つあり、fifth_reachが0ならば
      if fifth_count == 4 && fifth_reach == 0
        fifth_reach = 1
        reach_count += 1
      end

      #縦のリーチカウンター
      #b列に一致した数値が4つあり、b_reachが0ならば
      if b_count == 4 && b_reach == 0
        b_reach = 1
        reach_count += 1
      end

      #i列に一致した数値が4つあり、i_reachが0ならば
      if i_count == 4 && i_reach == 0
        i_reach = 1
        reach_count += 1
      end

      #n列に一致した数値が3つあり、n_reachが0ならば
      if n_count == 3 && n_reach == 0
        n_reach = 1
        reach_count += 1
      end

      #g列に一致した数値が4つあり、g_reachが0ならば
      if g_count == 4 && g_reach == 0
        g_reach = 1
        reach_count += 1
      end

      #o列に一致した数値が4つあり、o_reachが0ならば
      if o_count == 4 && o_reach == 0
        o_reach = 1
        reach_count += 1
      end

      #斜め(\)のリーチカウンター
      #(\)列に一致した数値が3つあり、b_slash_reachが0ならば
      if b_slash_count == 3 && b_slash_reach == 0
        b_slash_reach = 1
        reach_count += 1
      end

      #斜め(/)のリーチカウンター
      #(/)列に一致した数値が3つあり、slash_reachが0ならば
      if slash_count == 3 && slash_reach == 0
        slash_reach = 1
        reach_count += 1
      end

      #横のビンゴカウンター
      if first_count == 5 && first_bingo == 0
        first_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if second_count == 5 && second_bingo == 0
        second_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if third_count == 4 && third_bingo == 0
        third_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if fourth_count == 5 && fourth_bingo == 0
        fourth_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if fifth_count == 5 && fifth_bingo == 0
        fifth_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      #縦のビンゴカウンター
      if b_count == 5 && b_bingo == 0
        b_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if i_count == 5 && i_bingo == 0
        i_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if n_count == 4 && n_bingo == 0
        n_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if g_count == 5 && g_bingo == 0
        g_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if o_count == 5 && o_bingo == 0
        o_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      #斜めのビンゴカウンター
      if b_slash_count == 4 && b_slash_bingo == 0
        b_slash_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      if slash_count == 4 && slash_bingo == 0
        slash_bingo = 1
        bingo_count += 1
        reach_count -= 1
      end

      #改行
      puts
      #リーチのカウントを表示
      puts "REACH: #{reach_count}"
      #ビンゴのカウントを表示
      puts "BINGO: #{bingo_count}"
      #区切り線の表示
      puts "--------------------"

      #ビンゴのカウントが11以上になったら終了する
      if bingo_count > 10
        break
      end
    end
  end
end
bingo = Bingo.new
bingo.bingo_start