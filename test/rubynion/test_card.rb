require 'helper'
require 'rubynion/card'

class TestCard < Test::Unit::TestCase
	def setup
		@card = Rubynion::Card.new(:name => "dummy", :cost => 0)
	end

	def test_name
		assert_equal("dummy", @card.name)
	end
	
	def test_cost
		assert_equal(0, @card.cost)
	end

	#  *_card? be false
	def test_victory_card?
		assert_equal(false, @card.victory_card?)
	end

	def test_curse_card?
		assert_equal(false, @card.curse_card?)
	end

	def test_treasure_card?
		assert_equal(false, @card.treasure_card?)
	end

	def test_action_card?
		assert_equal(false, @card.action_card?)
	end

	def test_reaction_card?
		assert_equal(false, @card.reaction_card?)
	end
end