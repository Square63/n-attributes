# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'n_attributes/version'

Gem::Specification.new do |spec|
  spec.name          = "n_attributes"
  spec.version       = NAttributes::VERSION
  spec.authors       = ["Sohair Ahmad"]
  spec.email         = ["sohair.ahmad@square63.com"]
  spec.summary       = %q{Creates a field inside a model that allows you to store arbitrary n number of attributes against a specified field.}
  spec.description   = %q{Creates a field inside a model that allows you to store arbitrary n number of attributes against a specified field.}
  spec.homepage      = "https://github.com/Square63/n_attributes"
  spec.license       = "MIT"

  spec.rubyforge_project = "n_attributes"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
