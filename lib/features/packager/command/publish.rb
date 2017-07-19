# encoding: utf-8

require 'fileutils'
require 'features/packager/helper'

# Publish command class
# @see Features::Packager::Command
class Publish < Features::Packager::Command
  # Publishes packaged features to custom directory
  # @see Features::Packager::Helper
  include Features::Packager::Helper

  # Class constructor
  def initialize
    super('publish', takes_commands: false)
    short_desc('Publishes packaged features')
  end

  # Publishes published features
  # @param path [String] the destination directory
  def publish(files, path)
    # return unless files are present
    return unless files
    # create directory unless it already exists
    FileUtils.mkdir_p path unless path.directory?
    # return if publishing to gem folder
    return if Publish.source? path
    files.each do |file|
      file = Pathname.new file
      FileUtils.cp file, path
      puts "Published feature: #{path}/#{file.basename}"
    end
  end

  # Executes command passing in parameters
  # @param path [String] the destination directory
  def execute(path)
    puts "Publishing #{files} to #{path}" if Publish.cli.data[:verbose]
    path = Pathname.new path
    files = Dir["#{Publish.features}/*.feature"]
    publish(files, path)
  end
end
