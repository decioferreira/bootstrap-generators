source "https://rubygems.org"

# Specify your gem's dependencies in bootstrap_generators.gemspec
gemspec

# Dummy application
rails_version = ENV["RAILS_VERSION"] || "default"
rails = case rails_version
when "master"
  { github: "rails/rails" }
when "default"
  ">= 3.1.0"
else
  "~> #{rails_version}"
end

gem "rails", rails

gem 'sass-rails'
gem 'uglifier'
