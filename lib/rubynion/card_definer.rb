class Integer
  def draw_card
    {:draw_card, self}
  end

  def action
    {:increase_action, self}
  end

  def buy
    {:increase_buy, self}
  end

  def money
    {:increase_money, self}
  end

  def cost
    {:cost, self}
  end

  def victory_point
    {:victory_points, self}
  end

  def treasure_point
    {:treasure_points, self}
  end
end

class String
  def is
    Rubynion::CardDefiner.new(self)
  end
end

module Rubynion
  class CardDefiner
    def initialize(name)
      @card = Card.new(:name => name)
      self
    end

    def action_card(&block)
      @card.extend(ActionCard)
      block.call(@card)
      @card
    end

    def treasure_card(&block)
      @card.extend(TreasureCard)
      block.call(@card)
      @card
    end

    def victory_card(&block)
      @card.extend(VictoryCard)
      block.call(@card)
      @card
    end

    def reaction_card(&block)
      @card.extend(ReactionCard)
      block.call(@card)
      @card
    end

    def curse_card(&block)
      @card.extend(CurseCard)
      block.call(@card)
      @card
    end
  end
end
