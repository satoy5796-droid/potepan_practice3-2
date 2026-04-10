class Janken
    def play
        hand_type = ["グー","チョキ","パー","戦わない"]

        puts "最初はグー、じゃんけん・・・"
        puts "グーなら0、チョキなら1、パーなら2、戦わないなら3を入力してください。"
        input = gets&.chomp
        while input.nil? || input.empty? || input !~ /\A[0-3]\z/
            puts "入力が間違っています。"
            puts "グーなら0、チョキなら1、パーなら2、戦わないなら3を入力してください。"
            input = gets&.chomp
        end
        my_hand = input.to_i

        pc_hand = rand(0..2)
        puts "あなたは#{hand_type[my_hand]}です。"
        puts "コンピューターは#{hand_type[pc_hand]}です。"

        if my_hand == 3
            puts "戦わないを選択したため、ゲームを終了します。"
            return :quit
        elsif my_hand == pc_hand
            puts "結果はあいこです。"
            :draw
        elsif (my_hand == 0 && pc_hand == 1) || (my_hand == 1 && pc_hand == 2) || (my_hand == 2 && pc_hand == 0)
            puts "結果はあなたの勝ちです。"
            :win
        else
            puts "結果はあなたの負けです。"
            :lose
        end
    end
end

class LookOverThere
    def play
        direction_type = ["上","下","左","右"]

        puts "あっち向いてホイ・・・"
        puts "上なら0、下なら1、左なら2、右なら3を入力してください。"
        input = gets&.chomp
        while input.nil? || input.empty? || input !~ /\A[0-3]\z/
            puts "入力が間違っています。"
            puts "上なら0、下なら1、左なら2、右なら3を入力してください。"
            input = gets&.chomp
        end
        my_direction = input.to_i

        pc_direction = rand(0..3)
        puts "あなたは#{direction_type[my_direction]}です。"
        puts "コンピューターは#{direction_type[pc_direction]}です。"

        my_direction == pc_direction
    end
end

class JankenLookOverThere
    def play
        loop do
            result = Janken.new.play
            case result
            when :quit
                break
            when :draw
                puts "じゃんけんがあいこだったので、もう一度やり直します。"
                next
            when :win, :lose
                final_win = LookOverThere.new.play
                if final_win
                    puts result == :win ? "あなたの勝ちです！" : "あなたの負けです！"
                    break
                else
                    puts "方向が違ったので、じゃんけんからやり直します。"
                    next
                end
            end
        end
    end
end

JankenLookOverThere.new.play