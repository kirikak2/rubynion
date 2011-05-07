require "helper"
require "rubynion/card"
require "rubynion/curse_card"

class TestCurseCard < Test::Unit::TestCase
	def setup
		@card = Rubynion::Card.new(:name => "curse", :cost => 0)
		@card.extend(Rubynion::CurseCard)
		@card.curse_points = -1
	end

	def test_curse_card?
		assert_equal(true, @card.curse_card?)
	end

	def test_curse_points
		assert_equal(-1, @card.curse_points)
	end
end
