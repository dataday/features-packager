# encoding: utf-8

require 'fileutils'
require 'features/packager/helper'

# List command class
# @see Features::Packager::Command
class List < Features::Packager::Command
  # Lists packaged features
  # @see Features::Packager::Helper
  include Features::Packager::Helper

  # Class constructor
  def initialize
    super('list', takes_commands: false)
    short_desc('Lists packaged features')
  end

  # Lists published features
  # @param path [String] the destination directory
  def list(path)
    files = Dir["#{path}/*.feature"]
    if files.size > 0
      Dir["#{path}/*.feature"].reject do |item|
        unless File.directory? item
          file = Pathname.new item
          puts "Packaged feature file: #{file.basename}"
        end
      end
    else
      puts "No features found: #{path}"
    end
  end

  # Executes command passing in parameters
  # @param _type [String] the publish type, e.g., publish all features
  def execute(_type)
    puts "Features packaged: #{List.features}" if List.cli.data[:verbose]
    list(List.features)
  end
end
