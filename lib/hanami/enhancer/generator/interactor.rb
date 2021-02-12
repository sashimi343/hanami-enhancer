require 'hanami/cli/commands'
require 'hanami/cli/commands/command'
require 'hanami/enhancer/generator/util'

module Hanami
  module Enhancer
    module Generator
      class Interactor < Hanami::CLI::Command
        include Hanami::Enhancer::Generator::Util

        desc 'Generate an interactor'

        argument :domain_name, required: true, desc: 'Domain for a new interaction'
        argument :interaction_name, required: true, desc: 'Name of new interaction'

        example [
          'user register # Will generate UserInteractor::Register and its spec file'
        ]

        def call(domain_name:, interaction_name:, **options)
          generate_interactor(binding, domain_name, interaction_name)
          generate_interactor_spec(binding, domain_name, interaction_name)
        end

        private

        def generate_interactor(context, domain_name, interaction_name)
          source = template_path('interactor')
          destination = "#{Hanami.root}/lib/#{project_name}/interactors/#{underscore(domain_name)}/#{underscore(interaction_name)}.rb"

          generate_file(destination, source, context)
        end

        def generate_interactor_spec(context, domain_name, interaction_name)
          source = template_path('interactor_spec')
          destination = "#{Hanami.root}/spec/#{project_name}/interactors/#{underscore(domain_name)}/#{underscore(interaction_name)}_spec.rb"

          generate_file(destination, source, context)
        end
      end
    end
  end
end

Hanami::CLI.register 'generate', aliases: ['g'] do |prefix|
  prefix.register 'interactor', Hanami::Enhancer::Generator::Interactor
end
