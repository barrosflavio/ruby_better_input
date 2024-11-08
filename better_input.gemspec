# frozen_string_literal: true

require_relative "lib/better_input/version"

Gem::Specification.new do |spec|
  spec.name = "better_input"
  spec.version = Bi::VERSION
  spec.authors = ["Barros Flavio"]
  spec.email = ["flaviomarbs@gmail.com"]

  spec.summary = "A better input function for ruby"
  spec.description = <<~DESC
  This is an improved input function for Ruby.\n
  \n
  Using this gem, you can easily get user input with real-time type validation, ensuring that the data provided is as expected, among other things.\n
  \n
  If you have any questions, check the documentation: https://github.com/barrosflavio/ruby_better_input\n
  \n
  Features:\n
    - Ask, receive and check input in a single line\n
    - Support for types such as integer, float and boolean.\n
    - Input validation with clear error messages.\n
    - Intuitive and easy-to-use function.\n
  DESC
  spec.homepage = "https://github.com/barrosflavio/ruby_better_input"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/barrosflavio/ruby_better_input"
  spec.metadata["changelog_uri"] = "https://github.com/barrosflavio/ruby_better_input/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
