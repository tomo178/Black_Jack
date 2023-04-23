
require_relative "Player"
require_relative "Dealer"

loop do
    deck_instance = Deck.new
    player = Player.new(deck_instance.deck)
    dealer = Dealer.new(deck_instance.deck)

    puts "ブラックジャックを開始します。"

    # 実行開始時、ディーラーとプレイヤー全員に２枚ずつカードが配られる
    player.card_draw
    player.card_draw

    dealer.card_draw
    puts "ディーラーの引いた2枚目のカードはわかりません。"

    game_over = false

    loop do
      puts "あなたの現在の得点は#{player.player_score}です。カードを引きますか？(Y/N)"
      operator = gets.chomp.downcase

      if operator == "y"
          player.card_draw

          if player.player_score >= 22
              puts "あなたの得点が22点を超えました。ゲームオーバーです。"
              game_over = true
              break
          end
      elsif operator == "n"
          puts "あなたはカードを引くのを止めました。"
          break
      else
          puts "無効な入力です。Y または N を入力してください。"
      end
    end

    unless game_over
      # ゲームオーバーでない場合、ディーラーのターンに進む
      loop do
        dealer.card_draw
        if dealer.dealer_score >= 22
          puts "ディーラーの得点が22点を超えました。あなたの勝ちです！"
          game_over = true
          break
        elsif dealer.dealer_score >= 17
          break
        end
      end

      # ゲーム結果の表示
      puts "あなたの得点は#{player.player_score}です。"
      puts "ディーラーの得点は#{dealer.dealer_score}です。"

      if player.player_score > dealer.dealer_score
        puts "あなたの勝ちです！"
      elsif player.player_score < dealer.dealer_score
        puts "あなたの負けです。"
      else
        puts "引き分けです。"
      end
    end

    # もう一度プレイするかどうか尋ねる
    puts "もう一度プレイしますか？(Y/N)"
    answer = gets.chomp.downcase
    break if answer == "n"

    if game_over
      puts "ゲームオーバーです。プログラムを終了します。"
      break
    end
  end

puts "ブラックジャックを終了します。"
