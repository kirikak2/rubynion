module Rubynion
  module TreasureCard
    attr_accessor :treasure_points

		def self.extended(mod)
			mod.treasure_points = 0
		end

    def treasure_card?
      true
    end
  end
end
