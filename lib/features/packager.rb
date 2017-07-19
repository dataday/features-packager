# encoding: utf-8

require 'cmdparse'
require 'features/packager/helper'
require 'features/packager/version'
require 'features/packager/command'
require 'features/packager/command/list'
require 'features/packager/command/clear'
require 'features/packager/command/publish'

module Features
  module Packager
    # Command line interface
    module CLI
      # Creates command line interface
      # @see Features::Packager::Command

      # Initiates a command line interface
      # @see CmdParse::CommandParser
      def self.init
        cli = CmdParse::CommandParser.new(handle_exceptions: :no_help)
        cli.main_options.banner = 'Associated features'
        cli.main_options.version = Features::Packager::VERSION
        cli.main_options.program_name = File.basename $PROGRAM_NAME
        cli.global_options do |opt|
          opt.on('-v', '--verbose', 'Verbose output') do
            cli.data[:verbose] = true
          end
        end

        # Adds default Help command
        # @see CmdParse::HelpCommand
        cli.add_command(CmdParse::HelpCommand.new, default: true)

        # Adds default Version command
        # @see CmdParse::VersionCommand
        cli.add_command(CmdParse::VersionCommand.new)

        Command.cli = cli
      end

      # Runs the command line interface with
      # additional commands
      # @see CmdParse::Command
      def self.run
        cli = init

        features = CmdParse::Command.new('features')
        features.short_desc = 'Provides commands for managing feature files'

        # Provides List command
        # @see Features::Packager::List
        features.add_command(List.new)

        # Provides Clear command
        # @see Features::Packager::Clear
        features.add_command(Clear.new)

        # Provides Publish command
        # @see Features::Packager::Publish
        features.add_command(Publish.new)

        cli.add_command(features)
        cli.parse
      end
    end
  end
end
