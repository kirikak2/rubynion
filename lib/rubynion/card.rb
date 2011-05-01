module Rubynion
	class Card
		TYPE = %w(Victory Curse Treasure Action Reaction)
		def initialize(params)
			@name = params[:name]
			@cost = params[:cost]
		end
	end
end
