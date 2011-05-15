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
    attr_reader :card
    def initialize(name)
      @card = Card.new(:name => name)
      self
    end

    def action(&block)
      @card.extend(ActionCard)
      block.call(@card)
      self
    end

    def treasure(&block)
      @card.extend(TreasureCard)
      block.call(@card)
      self
    end

    def victory(&block)
      @card.extend(VictoryCard)
      block.call(@card)
      self
    end

    def reaction(&block)
      @card.extend(ReactionCard)
      block.call(@card)
      self
    end

    def curse(&block)
      @card.extend(CurseCard)
      block.call(@card)
      self
    end
  end
end
