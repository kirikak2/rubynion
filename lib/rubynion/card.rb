module Rubynion
	class Card
    attr_reader :name
		attr_accessor :cost
		TYPE = %w(Victory Curse Treasure Action Reaction)
		def initialize(params)
			@name = params[:name]
			unless params[:cost].nil?
				@cost = params[:cost]
			end
		end

    def method_missing(name, *args)
      if /.+_card\?/ =~ name.to_s
        false
      end
    end

		def attribute(params)
			if params.class != Hash
				raise ArgumentError.new("attribute params must be Hash class.")
			end
			params.each do |key, val|
				instance_variable_set("@#{key}", val)
			end
		end

		alias need attribute
		alias get attribute

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
