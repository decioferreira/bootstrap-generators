$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap/generators/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap-generators"
  s.version     = Bootstrap::Generators::VERSION
  s.authors     = ["Décio Ferreira"]
  s.email       = ["decio.ferreira@decioferreira.com"]
  s.homepage    = "http://decioferreira.github.com/bootstrap-generators/"
  s.summary     = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1).}
  s.description = %q{Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1). Checkout http://twitter.github.com/bootstrap.}
  s.license     = "MIT"

  s.rubyforge_project = "bootstrap-generators"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"

  s.add_development_dependency "rails", ">= 3.1"

  s.add_runtime_dependency "railties", ">= 3.1"
end
