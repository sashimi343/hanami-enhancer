require 'hanami/cli/commands'
require 'hanami/cli/commands/command'
require 'hanami/enhancer/destroyer/util'

module Hanami
  module Enhancer
    module Destroyer
      class Interactor < Hanami::CLI::Commands::Command
        include Hanami::Enhancer::Destroyer::Util

        desc 'Destroy an interactor'

        argument :domain_name, required: true, desc: 'Domain for a deleting interaction'
        argument :interaction_name, required: true, desc: 'Name of deleting interaction'

        example [
          'user register # Will delete UserInteractor::Register and its spec file'
        ]

        def call(domain_name:, interaction_name:, **options)
          delete_file(interactor_path(domain_name, interaction_name))
          delete_file(interactor_spec_path(domain_name, interaction_name))
        end

        private

        def interactor_path(domain_name, interaction_name)
          "#{Hanami.root}/lib/#{project_name()}/interactors/#{underscore(domain_name)}/#{underscore(interaction_name)}.rb"
        end

        def interactor_spec_path(domain_name, interaction_name)
          "#{Hanami.root}/spec/#{project_name()}/interactors/#{underscore(domain_name)}/#{underscore(interaction_name)}_spec.rb"
        end
      end
    end
  end
end

Hanami::CLI.register 'destroy' do |prefix|
  prefix.register 'interactor', Hanami::Enhancer::Destroyer::Interactor
end