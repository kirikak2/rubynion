module Rubynion
  class TurnManager < Array
    def initialize(max_players)
      @max_player = max_player
      super()
    end

    alias old_push push
    def push(player)
      if self.length + 1 > @max_player
        raise StandardError.new("This game reached max_players.")
      end
      old_push(player)
    end

    def start
      unless self.length >= 2
        raise StandardError.new("Can't start this game.")
      end
      @turn = 0
    end

    def next_turn
      @turn = (@turn + 1) % self.length
    end

    def this_turn_player
      self[@turn]
    end

    def nth_player(num)
      self[(@turn + num) % self.length]
    end

    def next_player
      nth_player(1)
    end

    def other_players
      self.clone.delete_at(@self)
    end
  end
end
