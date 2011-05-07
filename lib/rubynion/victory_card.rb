module Rubynion
  module VictoryCard
    attr_accessor :victory_points

		def self.extended(mod)
			mod.victory_points = 0
		end

    def victory_card?
      true
    end
  end
end
