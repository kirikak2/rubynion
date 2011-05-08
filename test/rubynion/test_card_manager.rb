require 'helper'
require 'rubynion/card_manager'

module Rubynion
	class TestCardManager < Test::Unit::TestCase
		# card_list is mock data.
		# it should write Card class.
		def setup
			card_list = [1,2,3,4,5,6,7,8,9,10] 
			@card_manager = CardManager.new(card_list) 
		end

		# At first, Pooled_cards has 10 cards.
		def test_initialize
			assert_equal(10, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.used_cards.length)
			assert_equal(0, @card_manager.staged_cards.length)
			assert_equal(0, @card_manager.handed_cards.length)
		end

		# draw 5 cards
		def test_draw_card_draw_5_cards
			@card_manager.draw_card(5)
			assert_equal(5, @card_manager.handed_cards.length)
			assert_equal(5, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.staged_cards.length)
			assert_equal(0, @card_manager.used_cards.length)
		end

		# draw over the number of pooled_cards when used_cards empty, cannot draw 
		def test_draw_card_draw_10_over_cards
			@card_manager.draw_card(15)
			assert_equal(10, @card_manager.handed_cards.length)
			assert_equal(0, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.staged_cards.length)
			assert_equal(0, @card_manager.used_cards.length)
		end

		# draw over the number of pooled_cards when used_card not empty,
		# used_card shuffle and move to pooled_card, and draw left pooled_card
		def test_draw_card_draw_8_cards
			@card_manager.turn_start
			@card_manager.turn_end
			assert_nothing_raised{
				@card_manager.draw_card(8)
			}
			assert_equal(0, @card_manager.used_cards.length)
			assert_equal(2, @card_manager.pooled_cards.length)
			assert_equal(8, @card_manager.handed_cards.length)
		end

		# turn start
		def test_turn_start
			@card_manager.turn_start
			assert_equal(5, @card_manager.handed_cards.length)
			assert_equal(5, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.staged_cards.length)
			assert_equal(0, @card_manager.used_cards.length)
		end

		# use card
		def test_use_card
			@card_manager.turn_start
			@card_manager.use_card(3)
			assert_equal(4, @card_manager.handed_cards.length)
			assert_equal(1, @card_manager.staged_cards.length)
			assert_equal(3, @card_manager.staged_cards[0])
			assert_equal(5, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.used_cards.length)
		end

		# use invalid card, then raise Error
		def test_use_invalid_card
			@card_manager.turn_start
			assert_raise(StandardError, "11 is not found in handed_cards."){
				@card_manager.use_card(11)
			}
		end
		
		# scrap card
		def test_scrap_card
			@card_manager.turn_start
			@card_manager.scrap_card [1, 2, 3]
			assert_equal(2, @card_manager.handed_cards.length)
			assert_equal(5, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.staged_cards.length)
			assert_equal(0, @card_manager.used_cards.length)
		end

		# thrown invalid card
		def test_scrap_card_invalid_card
			@card_manager.turn_start
			assert_raise(StandardError, "11 is not found in handed_cards."){
				@card_manager.scrap_card [1, 2, 11]
			}
		end

		# scrap invalid argument
		def test_scrap_card_invalid_argument
			@card_manager.turn_start
			assert_raise(ArgumentError, "thrown_card argument must be Array class."){
				@card_manager.scrap_card 1
			}
		end

		# turn end
		def test_turn_end
			@card_manager.turn_start
			@card_manager.use_card(2)
			@card_manager.turn_end
			assert_equal(0, @card_manager.handed_cards.length)
			assert_equal(5, @card_manager.used_cards.length)
			assert_equal(5, @card_manager.pooled_cards.length)
			assert_equal(0, @card_manager.staged_cards.length)
		end

		# reset cards
		def test_reset_cards
			@card_manager.pooled_cards.clear
			@card_manager.used_cards.concat [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
			@card_manager.reset_cards
		end

		# reset card if poold_cards is not empty
		def test_reset_cards_if_pooled_cards_is_not_empty
			assert_raise(StandardError, "pooled card isn't empty."){
				@card_manager.reset_cards
			}
		end
	end
end
