module Rubynion
  class Game
    def initialize(supply)
      @players = TurnManager.new
    end

    def new_player(name)
      @players << Player.new(name, self)
    end
  end
end
