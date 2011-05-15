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

    def use
      raise StandardError.new("no action specified.")
    end
  end
end
