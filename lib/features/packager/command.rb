# encoding: utf-8

module Features
  module Packager
    # Command line interface
    # @see CmdParse::Command
    class Command < CmdParse::Command
      # Creates command line interface
      # @see CmdParse::Command

      # Assigns CmdParse::CommandParser
      # @param parser [CommandParser] instance of CmdParse::CommandParser
      # @see CmdParse::CommandParser
      def self.cli=(parser)
        class_variable_set(:@@cli, parser)
      end

      # Retrieves CmdParse::CommandParser
      # @return [CommandParser] instance of CmdParse::CommandParser
      # @see CmdParse::CommandParser
      def self.cli
        class_variable_get(:@@cli)
      end
    end
  end
end
