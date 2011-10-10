# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootstrap/generators/version"

Gem::Specification.new do |s|
  s.name        = "bootstrap-generators"
  s.version     = Bootstrap::Generators::VERSION
  s.authors     = ["Décio Ferreira"]
  s.email       = ["decio.ferreira@decioferreira.com"]
  s.homepage    = "https://github.com/decioferreira/bootstrap-generators"
  s.summary     = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 3.}
  s.description = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 3. Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. Checkout http://twitter.github.com/bootstrap.}

  s.rubyforge_project = "bootstrap-generators"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_dependency "railties", ">= 3.0"
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rails", ">= 3.0"
end
