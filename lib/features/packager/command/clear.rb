# encoding: utf-8

require 'fileutils'
require 'features/packager/helper'

# Clear command class
# @see Features::Packager::Command
class Clear < Features::Packager::Command
  # Clears published features from custom directory
  # @see Features::Packager::Helper
  include Features::Packager::Helper

  # Class constructor
  def initialize
    super('clear', takes_commands: false)
    short_desc('Clears published features')
  end

  # Clears published features
  # @param path [String] the destination directory
  def clear(path)
    if path.directory? && path.readable?
      unless Clear.source?(path)
        FileUtils.rm_r Dir["#{path}/*.feature"]
        puts "Directory #{path} cleared"
      end
    else
      puts "Directory #{path} doesn't exist"
    end
  end

  # Executes command passing in parameters
  # @param path [String] the destination directory
  def execute(path)
    puts "Removing features from #{path}" if Clear.cli.data[:verbose]
    path = Pathname.new path
    clear(path)
  end
end
