def get_num
    loop do
        puts "数字が全て異なる3桁の整数を入力してください。"
        #ユーザーの予想した数字を受け取り、配列に変換する
        b = gets.chomp.split(//)
    
        #以下、エラー処理
        #1.数字以外の文字がある時
        if b.any?(/\D/)
            puts "数字ではない文字が含まれています。"
        #2.桁数が3桁でない時
        elsif b.size != 3
            puts "3桁より多いか少ない数字です。"
        #3.重複する桁がある時
        elsif b.uniq.size != 3
            puts "同じ数字の桁があります。"
        else
            break
        end
    end
    return b
end

def hit_and_blow(a, b)
    #ヒットとブローのカウントを初期化
    hit, blow = 0, 0
#ヒットのカウント
    #aとbをzipで合体させ、[[1,2],[3,4],[5,6]]のような入れ子の配列にする
    #これでインデックス番号が同じもの同士の小さな配列ができる
    a.zip(b).each do |x, y|
        if x == y.to_i
            hit += 1
        end
    end
    #ヒットの数が3だった場合はここで終了（勝利）
    if hit == 3
        puts "ヒット:#{hit} ブロー:#{blow}"
        puts "おめでとう！正解！"
        exit
    #ヒットの数が3でない場合はブローのカウントへ
    else
        b.each do |x|
            if a.include?(x.to_i) == true
                blow += 1
            end
        end
    end
    blow = blow - hit
    return "ヒット:#{hit} ブロー:#{blow}"
end