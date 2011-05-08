module Rubynion
	# Rubynion player card manager
	class CardManager
		# attr_reader change to be private access.
		attr_reader :pooled_cards, :used_cards, :staged_cards, :handed_cards
		def initialize(cards)
			@pooled_cards = Array.new(cards)
			@used_cards = []
			@staged_cards = []
			@handed_cards = []
		end

		# These methods are actions that effects in pooled_cards
		# Move card from pooled_cards to handed_cards
		def draw_card(how_many_cards)
			how_many_cards.times do
				if @pooled_cards.empty?
					reset_cards
				end
				unless @pooled_cards.empty?
					@handed_cards.push @pooled_cards.shift
				end
			end
		end

		# Move 5 card from pooled_cards to handed_cards
		def turn_start
			draw_card(5)
		end

		# These methods are actions that effects in handed_cards
		# Move card from handed_cards to staged_cards
		def use_card(used_card)
			used_card_in_hand = @handed_cards.find do |card|
				card === used_card
			end
			unless used_card_in_hand.nil?
				@staged_cards.push used_card_in_hand
				@handed_cards.delete_if do |card|
					card === used_card_in_hand
				end
			else
				raise StandardError.new("#{used_card} is not found in handed_cards.")
			end
		end

		# Throw card to Dustbox
		def thrown_card(thrown_cards)
			if thrown_cards.class != Array
				raise ArgumentError.new("thrown_card argument must be Array class.")
			end
			thrown_cards.each do |thrown_card|
				thrown_card_in_hand = @handed_cards.find do |handed_card|
					handed_card === thrown_card
				end
				if thrown_card_in_hand.nil?
					raise StandardError.new("#{thrown_card_in_hand} is not found in handed_cards.")
				end
			end
			thrown_cards.each do |thrown_card|
				@handed_cards.delete_if do |handed_card|
					handed_card === thrown_card
				end
			end
		end

		# These methods are actions that effects in staged_cards
		# turn end
		# All staged_cards move to used_cards
		def turn_end
			@used_cards.concat @handed_cards
			@used_cards.concat @staged_cards
			@handed_cards.clear
			@staged_cards.clear
		end
		
		# These methods are actions that effects in used_cards
		# All used_cards move to pooled_cards and shuffle
		def reset_cards
			unless @pooled_cards.empty?
				raise StandardError.new("pooled card isn't empty.")
			end
			@pooled_cards = @used_cards.shuffle
			@used_cards = @used_cards.clear
		end
	end
end
