require "helper"
require "rubynion/card"
require "rubynion/victory_card"

class TestVictoryCard < Test::Unit::TestCase
	def setup
		@card = Rubynion::Card.new(:name => "Estate", :cost => 2)
		@card.extend(Rubynion::VictoryCard)
		@card.victory_points = 1
	end

	def test_victory_card?
		assert_equal(true, @card.victory_card?)
	end

	def test_victory_points
		assert_equal(1, @card.victory_points)
	end
end