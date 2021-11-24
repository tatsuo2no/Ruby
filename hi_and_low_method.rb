def get_predict
    #ユーザーが入力した数字をuser_numに受け取る
    puts "次の数字はハイorロー？（0:ロー 1:ハイ）"
    user_num = gets.chomp
    
#0, 1以外の数字の場合は再入力を促す
    while user_num.match?(/[01]/) === false
        puts "次の数字はハイorロー？（0:ロー 1:ハイ）"
        user_num = gets.chomp
    end
    predict = ["ロー！", "ハイ！"]
    predict[user_num.to_i]
end


def judge_num(num_now, num_next)
#判定結果（ハイorローorイーブン）result、現在の数字、次の数字、を出力
    if num_now > num_next
        "ロー！"
    elsif num_now < num_next
        "ハイ！"
    else
        "イーブン"
    end
end
