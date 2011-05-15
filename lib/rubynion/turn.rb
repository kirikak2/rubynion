module Rubynion
  class Turn
    TURN_MODE = ["ACTION", "BUY"]
    def initialize(player)
      @remaining_action = 1
      @remaining_buy = 1
      @virtual_money = 0
      @player = player
      @game = game
      @turn_mode = "ACTION"
    end

    def start
      player.turn_start
    end

    def use_card(card)
      if @remaining_action == 0
        raise StandardError.new("no action remain.")
      end

      if @turn_mode != "ACTION"
        raise StandardError.new("you can't do more action.")
      end
      @player.card_deck.use_card(card).use
    end

    def action_end
      @turn_mode = "BUY"
    end

    def buy_card(card)
      if @remaining_buy == 0
        raise StandardError.new("you can't buy any card.")
      end
      @player.this_game.buy_card(card)
    end

    def end
      player.turn_end
    end
  end
end
