module Rubynion
	class TestCardDefiner < Test::Unit::TestCase
		def test_estate
			estate_card = "estate".is.victory_card do |card|
				card.need 2.cost
				card.get 1.victory_point
			end
			assert_instance_of(Card, estate_card)
			assert_equal("estate", estate_card.name)
			assert(estate_card.victory_card?)
			assert_equal(1, estate_card.victory_points)
			assert_equal(2, estate_card.cost)
		end

		def test_copper
			copper_card = "copper".is.treasure_card do |card|
				card.need 0.cost
				card.get 1.treasure_point
			end
			assert_instance_of(Card, copper_card)
			assert_equal("copper", copper_card.name)
			assert(copper_card.treasure_card?)
			assert_equal(1, copper_card.treasure_points)
			assert_equal(0, copper_card.cost)
		end
	end
end
