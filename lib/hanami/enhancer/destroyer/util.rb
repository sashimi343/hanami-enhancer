require "dry/cli"
require 'dry/cli/utils/files'
require 'hanami/cli/commands'
require 'hanami/cli/commands/command'

module Hanami
  module Enhancer
    module Destroyer
      module Util
        def project_name()
          Hanami::Environment.new.project_name
        end

        def delete_file(path)
          Dry::CLI::Utils::Files::delete(path)
          say(:delete, path)
        end

        def camelize(str)
          str.split(/_/).map{ |w| w[0] = w[0].upcase; w }.join
        end

        def underscore(str)
          camelize(str).gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .downcase
        end
      end
    end
  end
end