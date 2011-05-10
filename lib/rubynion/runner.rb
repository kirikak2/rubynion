require 'optparse'
require 'yaml'

module Rubynion
  # Rubynion runner.
  class Runner
    COMMANDS = %w(start stop restart config status)

    attr_accessor :options
    attr_accessor :command
    attr_accessor :arguments
    def initialize(argv)
      @argv = argv
      @options = {

      }
      parse!
    end

    def self.commands
      commands = COMMANDS
      commands
    end

    # Parse rule specified.
    def parser
      @parser ||= OptionParser.new do |opts|
        opts.banner  =  "Usage: thin [options] #{self.class.commands.join("|")}"
      end
    end

    # Parse the options.
    def parse!
      parser.parse! @argv
      @command = @argv.shift
      @arguments = @argv
    end

    # Parse the current shell arguments and run the command.
    # Exists on error.
    def run!
      if self.class.commands.include?(@command)
        run_command
      elsif @commad.nil?
        puts "no command given."
      else
        puts "no command given."
      end
    end

    # Send the command to the controller
    def run_command
      Command.send(@command)
    end
  end
end
