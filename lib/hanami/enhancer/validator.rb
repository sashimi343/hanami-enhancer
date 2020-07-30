require 'hanami/cli/commands'
require 'hanami/cli/commands/command'
require 'hanami/enhancer/generator_util'

module Hanami
  module Enhancer
    module Validator
      class CLI < Hanami::CLI::Commands::Command
        include Hanami::Enhancer::GeneratorUtil

        desc 'Generate an validator'

        argument :validator, required: true, desc: 'Name of validation class'

        example [
          'UserRegistration # Will generate UserRegistrationValidator and its spec file'
        ]

        def call(validator:, **options)
          context = Hanami::CLI::Commands::Context.new(validator: validator)

          generate_validator(context, validator)
          generate_validator_spec(context, validator)
        end

        private

        def generate_validator(context, validator)
          source = template_path('validator')
          destination = "#{Hanami.root}/lib/#{project_name}/validators/#{underscore(validator)}.rb"

          generate_file(destination, source, context)
        end

        def generate_validator_spec(context, validator)
          source = template_path('validator_spec')
          destination = "#{Hanami.root}/spec/#{project_name}/validators/#{underscore(validator)}_spec.rb"

          generate_file(destination, source, context)
        end
      end
    end
  end
end

Hanami::CLI.register 'generate', aliases: ['g'] do |prefix|
  prefix.register 'validator', Hanami::Enhancer::Validator::CLI
end