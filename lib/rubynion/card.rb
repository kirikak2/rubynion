module Rubynion
	class Card
    attr_reader :name, :cost
		TYPE = %w(Victory Curse Treasure Action Reaction)
		def initialize(params)
			@name = params[:name]
			@cost = params[:cost]
		end

    def method_missing(name, *args)
      if /.+_card\?/ =~ name.to_s
        false
      end
    end

		def append_effect(&block)
			@append_effect = block
		end

		def has_append_effect?
			!@append_effect.nil?
		end

		def append_effect
			if has_append_effect?
				@append_effect.call
			else
				raise StandardError.new("no append effect.")
			end
		end
	end
end
