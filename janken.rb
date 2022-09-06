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
    # 出力用
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    # PlayerクラスとEnemyクラスの戻り値からじゃんけんするロジック
    if player_hand == enemy_hand
      puts "あいこ"
			true
    elsif ((player_hand) - (enemy_hand) + 3) % 3 == 2
      puts "あなたの勝ちです"
    	false
    else
			puts "あなたの負けです"
    	false
    end
  end
end

# じゃんけんゲームを実行するロジック
class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    # ループ判定用変数「next_game」に初期値「true」を代入
		next_game = true
    # 「next_game」が「false」だと繰り返し処理を終了する
    while next_game 
      # 変数「next_game」にjanken.ponの戻り値を代入。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

GameStart.jankenpon