module Rubynion
  module ActionCard
    attr_accessor :increase_action, :increase_money,
      :increase_buy, :draw_card

    def self.extended(mod)
      mod.increase_action = 0
      mod.increase_money = 0
      mod.increase_buy = 0
      mod.draw_card = 0
    end

    def self.included(mod)
      @increase_action = 0
      @increase_money = 0
      @increase_buy = 0
      @draw_card = 0
    end

    def action_card?
      true
    end
  end
end
