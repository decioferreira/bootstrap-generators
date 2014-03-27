source "https://rubygems.org"

# Specify your gem's dependencies in bootstrap_generators.gemspec
gemspec

# Dummy application
rails_version = ENV["RAILS_VERSION"] || "default"
case rails_version
when "master"
  rails = { github: "rails/rails" }
  gem 'sass-rails', '>= 4.0.2'
when "default"
  rails = ">= 3.1.0"
  gem 'sass-rails'
else
  rails = "~> #{rails_version}"

  if rails_version[0] == '4'
    gem 'sass-rails', '>= 4.0.2'
  else
    gem 'sass-rails'
  end
end

gem 'rails', rails
gem 'uglifier'
