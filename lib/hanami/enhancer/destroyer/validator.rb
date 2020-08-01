require 'hanami/cli/commands'
require 'hanami/cli/commands/command'
require 'hanami/enhancer/destroyer/util'

module Hanami
  module Enhancer
    module Destroyer
      class Validator < Hanami::CLI::Commands::Command
        include Hanami::Enhancer::Destroyer::Util

        desc 'Destroy an validator'

        argument :validator, required: true, desc: 'Name of deleting validation class'

        example [
          'UserRegistration # Will delete UserRegistrationValidator and its spec file'
        ]

        def call(validator:, **options)
          delete_file(validator_path(validator))
          delete_file(validator_spec_path(validator))
        end

        private

        def validator_path(validator)
          "#{Hanami.root}/lib/#{project_name()}/validators/#{underscore(validator)}.rb"
        end

        def validator_spec_path(validator)
          "#{Hanami.root}/spec/#{project_name()}/validators/#{underscore(validator)}_spec.rb"
        end
      end
    end
  end
end

Hanami::CLI.register 'destroy' do |prefix|
  prefix.register 'validator', Hanami::Enhancer::Destroyer::Validator
end