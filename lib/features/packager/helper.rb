# encoding: utf-8

require 'pathname'

module Features
  module Packager
    # Helper module
    module Helper
      def self.included(base)
        base.extend ClassMethods
      end
      # Helper class methods
      module ClassMethods
        # Creates a fully qualified root path
        def root
          path = File.dirname __dir__
          root = Pathname.new File.join path, '/../../'
          root.realpath
        end

        # Creates a fully qualified path
        # from custom fragment
        # @param fragment [String] the path fragment
        # @return [String] the resulting path
        def path(fragment)
          File.join root, fragment
        end

        # Checks that the specified path isn't
        # the gems source directory
        # @param path [String] the path fragment
        def source?(path)
          true if path.to_s.eql? features
          false
        end

        # Creates a fully qualified lib path
        # @return [String] the resulting path
        def lib
          path '/lib'
        end

        # Creates a fully qualified bin path
        # @return [String] the resulting path
        def bin
          path '/bin'
        end

        # Creates a fully qualified features path
        # @return [String] the resulting path
        def features
          path('/features')
        end
      end
    end
  end
end
