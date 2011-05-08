require "helper"

module Rubynion
	class TestTreasureCard < Test::Unit::TestCase
		def setup
			@card = Card.new(:name => "Copper", :cost => 0)
			@card.extend(TreasureCard)
			@card.treasure_points = 1
		end

		def test_treasure_card?
			assert_equal(true, @card.treasure_card?)
		end

		def test_treasure_points
			assert_equal(1, @card.treasure_points)
		end
	end
end
