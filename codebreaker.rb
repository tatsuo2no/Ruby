require_relative "codebreaker_method"

#正解のコードを乱数で決定する
code = (0..9).to_a
a = code.sample(3)
#残りプレイ回数は3回
credit = 5

#残りプレイ回数が0以上の場合
while credit > 0
    puts "残りプレイ回数:#{credit}"
    #3桁の数字の予想をプレイヤーに入力させる
    b = get_num

    #正解aと予想bを比較し、ヒットとブローをカウント
    puts hit_and_blow(a, b)
    credit -= 1
end
#残りプレイ回数が0の時は、正解の数字を表示して終了
puts "残念！正解は「#{a.join}」でした！"
