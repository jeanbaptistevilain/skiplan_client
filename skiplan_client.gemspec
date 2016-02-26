# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skiplan_client/version'

Gem::Specification.new do |spec|
  spec.name          = "skiplan_client"
  spec.version       = SkiplanClient::VERSION
  spec.authors       = ["SimonRonzani", "jeanbaptistevilain"]
  spec.email         = ["jeanbaptistevilain@gmail.com"]
  spec.description   = "SkiPlan API client gem"
  spec.summary       = "A simple Ruby wrapper for the SkiPlan XML api"
  spec.homepage      = "https://github.com/jeanbaptistevilain/skiplan_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "shoulda-context"
  spec.add_runtime_dependency "rails"
  spec.add_runtime_dependency "nokogiri"
end
