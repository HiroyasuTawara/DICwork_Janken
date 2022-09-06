#プレイヤーの手を「0~2」の値で取得するロジック
class Player
	
  def hand
		janken_hand_str = ["0","1","2"]
    # プレイヤーに入力を要求
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    # input_hand にプレイヤーの入力値を代入
    input_hand = gets.chomp

    # input_hand に代入した入力値が正しければ繰り返し処理を終了
		# それ以外（アルファベットも含む）なら繰り返し処理を継続
    while true
			if janken_hand_str.include?(input_hand)
				puts"---------------------------------------------"
				return input_hand.to_i
        #入力値は正しいのでinput_handを返し終了 
			else
        # 入力値が正しくないので、再入力を要求
				puts "※入力された数値が正しくありません※"
        puts "0〜2の数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
				input_hand = gets.chomp
      end
    end
  end
end

# 相手の手を「0~2」の値でランダムに取得するロジック
class Enemy
  def hand
		janken_hand_int = [0,1,2]
		janken_hand_int.sample
  end
end

# 二つの値の比較、結果の出力、GameStartループ判定用のboolean値を返すロジック
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{相手の手}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
    if player_hand == enemy_hand
			# Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
      # 「あいこ」を出力します。
      puts "あいこ"
			true
      #「true」を返してじゃんけんを繰り返し実行させます。
      # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
    elsif ((player_hand) - (enemy_hand) + 3) % 3 == 2
      puts "あなたの勝ちです"
    	false
    else
			puts "あなたの負けです"
    	false
    end
  end
end
# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    # 変数「next_game」に「true」を代入しましょう。
		next_game = true
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    while next_game 
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon