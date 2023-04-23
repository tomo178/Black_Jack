
require_relative "deck"


class Player

    attr_accessor :player_score

    def initialize(deck)
    @player_score = 0
    @deck = deck
    end

    def card_draw
        random_index = rand(@deck.size)
        card = @deck.delete_at(random_index)
        suit = card[0]
        rank = card[1..-1].to_i

        # スートの最初の文字を日本語に変換
        japanese_suit = case suit
        when 'h' then 'ハート'
        when 's' then 'スペード'
        when 'c' then 'クラブ'
        when 'd' then 'ダイヤ'
        end
        puts "あなたの引いたカードは#{japanese_suit}の#{rank}です。"
        score = card_score(rank)
        update_player_score(score)
    end


    def card_score(rank)
        if rank == 1
            #Aを除く総得点が10点以下ならA＝11点、11点以上なら1点
            if player_score <= 10
                score = 11
            else
                score = 1
            end

        elsif rank <= 10
            score = rank
        else
            score = 10
        end
        score
    end

    def update_player_score(score)
        @player_score += score
    end

end
