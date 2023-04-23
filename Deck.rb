
#カードの情報保存クラス
class Deck

    attr_reader :deck

    def initialize
        @deck = deck_create
    end

    #デッキの52枚のデータ
    def deck_create
        suits = ["h", "s", "c", "d"]
        ranks = (1..13).to_a
        deck = suits.product(ranks).map { |suit, rank| "#{suit}#{rank}" }
    end

end


