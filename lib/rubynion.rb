module Rubynion
	ROOT = File.expand_path(File.dirname(__FILE__))
	autoload :Runner,	"#{ROOT}/rubynion/runner"
	autoload :Command, "#{ROOT}/rubynion/command"
end

Rubynion::Runner.new(ARGV).run!
