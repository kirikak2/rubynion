module Rubynion
	ROOT = File.expand_path(File.dirname(__FILE__))
	require "#{ROOT}/rubynion/card_definer"
	autoload :Runner,	"#{ROOT}/rubynion/runner"
	autoload :Command, "#{ROOT}/rubynion/command"
	autoload :CardManager, "#{ROOT}/rubynion/card_manager"
	autoload :Card,	"#{ROOT}/rubynion/card"
	autoload :CurseCard, "#{ROOT}/rubynion/curse_card"
	autoload :ActionCard, "#{ROOT}/rubynion/action_card"
	autoload :ReactionCard, "#{ROOT}/rubynion/reaction_card"
	autoload :TreasureCard, "#{ROOT}/rubynion/treasure_card"
	autoload :VictoryCard, "#{ROOT}/rubynion/victory_card"
end

Rubynion::Runner.new(ARGV).run!
