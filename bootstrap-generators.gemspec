# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bootstrap/generators/version"

Gem::Specification.new do |spec|
  spec.name          = "bootstrap-generators"
  spec.version       = Bootstrap::Generators::VERSION
  spec.authors       = ["Décio Ferreira"]
  spec.email         = ["decio.ferreira@decioferreira.com"]
  spec.summary       = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1).}
  spec.description   = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1). Checkout http://getbootstrap.com.}
  spec.homepage      = "https://github.com/decioferreira/bootstrap-generators"
  spec.license       = "MIT"

  spec.rubyforge_project = "bootstrap-generators"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "railties", ">= 3.1.0"
end
