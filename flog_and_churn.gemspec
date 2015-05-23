# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flog_and_churn/version'

Gem::Specification.new do |spec|
  spec.name          = "flog_and_churn"
  spec.version       = FlogAndChurn::VERSION
  spec.authors       = ["Ilya Paripsa"]
  spec.email         = ["iparips@gmail.com"]
  spec.summary       = "Gem for visualising flog and churn metrics"
  spec.description   = "Gem for visualising flog and churn metrics"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rake", "~> 10.4.2"
  spec.add_runtime_dependency "flog", "~> 4.3.2"
  spec.add_runtime_dependency "churn", "~> 1.0.2"
  spec.add_development_dependency "bundler", "~> 1.7"
end
