require "dry/cli"
require 'dry/cli/utils/files'
require 'hanami/cli/commands'
require 'hanami/cli/commands/command'

module Hanami
  module Enhancer
    module Generator
      module Util
        def template_path(template_name)
          File.expand_path(File.dirname(__FILE__) + "/templates/#{template_name}.erb")
        end

        def project_name()
          Hanami::Environment.new.project_name
        end

        def generate_file(destination, source, context)
          Dry::CLI::Utils::Files::write(
            destination,
            render(source, context)
          )

          say(:create, destination)
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