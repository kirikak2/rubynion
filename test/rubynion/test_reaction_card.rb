require "helper"

module Rubynion
	class TestReactionCard < Test::Unit::TestCase
		def setup
			@card = Card.new(:name => "Moat", :cost => 2)
			@card.extend(ReactionCard)
			@card.draw_card = 2
		end

		def test_reaction_card?
			assert_equal(true, @card.reaction_card?)
		end

		def test_action_card?
			assert_equal(true, @card.action_card?)
		end

		def test_draw_card
			assert_equal(2, @card.draw_card)
		end
	end
end
