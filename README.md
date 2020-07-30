# hanami-enhancer

This gem helps you to generate some classes (like interactor, validator etc.) by adding sub-commands to 'hanami generate' command.

## Installation

Add this line to your Gemfile.

```ruby
group :plugins do
  gem 'hanami-enhancer', github: 'sashimi343/hanami-enhancer'
end
```

## Usage

#### Generate interactors

Run the following command in your terminal and generate two files. (interactor class and its spec)

```bash
$ hanami generate interactor user register

    create /path/to/your_app/lib/project_name/interactors/user/register.rb
    create /path/to/your_app/spec/project_name/interactors/user/register.rb
```

lib/project_name/interactors/user/register.rb:

```ruby
require 'hanami/interactor'

module UserInteractor
  class Register
    include Hanami::Interactor

    def initialize(params = {})
      @params = params
    end

    def call()
      raise NotImplementedError.new("you must implement #{self.class}##{__method__}")
    end
  end
end
```

spec/project_name/interactors/user/register.rb:

```ruby
require_relative '../../../spec_helper.rb'

RSpec.describe UserInteractor::Register do
  # your code goes here
end
```

## License

This gem is released under the MIT License, see [LICENSE.txt](https://github.com/sashimi343/hanami-enhancer/blob/master/LICENSE.txt).