lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hanami/enhancer/version'

Gem::Specification.new do |spec|
  spec.name          = 'hanami-enhancer'
  spec.version       = Hanami::Enhancer::VERSION
  spec.authors       = ['Kohei Kakimoto']
  spec.email         = ['naige.1028@gmail.com']

  spec.summary       = "Enhance 'hanami generate' command"
  spec.description   = "Add various sub-commands to 'hanami generate' command, like interactor or validator"
  spec.homepage      = 'https://github.com/sashimi343/hanami-enhancer'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-cli"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end