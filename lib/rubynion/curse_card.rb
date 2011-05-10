module Rubynion
  module CurseCard
    attr_accessor :curse_points

    def self.extended(mod)
      mod.curse_points = -1
    end

    def curse_card?
      true
    end
  end
end
