require "helper"
require "rubynion/card"
require "rubynion/action_card"

class TestActionCard < Test::Unit::TestCase
	def setup
		@card = Rubynion::Card.new(:name => "Village", :cost => 3)
		@card.extend(Rubynion::ActionCard)
		@card.increase_action = 2
		@card.draw_card = 1
	end

	def test_action_card?
		true
	end

	def test_increase_action
		assert_equal(2, @card.increase_action)
	end

	def test_draw_card
		assert_equal(1, @card.draw_card)
	end

	def test_increase_money
		assert_equal(0, @card.increase_money)
	end

	def test_increase_buy
		assert_equal(0, @card.increase_buy)
	end
end
