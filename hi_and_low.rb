require_relative "hi_and_low_method"

#初期スコアは0
score = 0
#初期プレイ回数は10(勝敗に関係なく1プレイ毎に1減る)
credit = 10
#連続正解数の初期値は0
w_streak = 0

#現在の数字と次の数字の初期値は1-9の乱数で決める
num_now = rand(1..9)
num_next = rand(1..9)


#残りプレイ回数が1以上の場合
while credit > 0 
#区切り用の枠と現在の数字を出力
puts "######################################"
puts "現在の数字: #{num_now}"
#ユーザーが入力した数字をuser_numに受け取る
predict = get_predict
#ユーザーの予測内容を表示する（「あなたの予測: [ハイ] or [ロー]」）
puts "あなたの予想は => #{predict}"

#実際の結果と現在の数字、次の数字を表示
result = judge_num(num_now, num_next)
puts "結果は  現在の数字:#{num_now} 次の数字:#{num_next} => #{result}"
    #当たりの場合
    if predict == result
        #連続正解数に+1し、連続正解数*100点をスコアに加算
        w_streak += 1
        score += 100 * w_streak
        #プレイ回数を-1
        credit -= 1
        #「当たり！」の文字の後に現在のスコアと残りプレイ回数を表示し、次のゲームへ
        puts "当たり！現在のスコア:#{score}"
        puts "残りプレイ回数:#{credit}"
    #イーブンの場合（連続正解数、残りプレイ回数はそのまま）
    elsif result == "イーブン"
        #「ドロー！」の文字の後に現在のスコアと残りプレイ回数を表示し、次のゲームへ
        puts "ドロー！ 現在のスコア:#{score}"
        puts "残りプレイ回数:#{credit}"
    #ハズレの場合
    else
        #連続正解数を0にリセット
        w_streak = 0
        #残りプレイ回数を-1
        credit -= 1
        #「ハズレ...」の文字の後に現在のスコアと残りプレイ回数を表示し、次のゲームへ
        puts "ハズレ... 現在のスコア:#{score}"
        puts "残りプレイ回数:#{credit}"
    end
    #num_nextをnum_nowに代入し、num_nextは再度乱数で決める
    num_now = num_next
    num_next = rand(1..9)
end

#残りプレイ回数が0になったら「GAME OVER」と表示し、現在のスコアを表示
puts "######################################"
puts "GAME OVER!"
puts "今回のスコア:#{score}"

#現在の日時を取得
now = Time.now.strftime("%Y-%m-%d %H:%M:%S %Z")

#log.txtへのファイルパスを作成
filepath = "#{__dir__}/log.txt"

#log.txtを追記モードで開く
File.open(filepath, "a") do |file|
    #log.txtに日時とスコアを記録する
    file.puts "#{now}のスコア:#{score}"
end
