require 'bundler'
Bundler.require

require 'test/unit'
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'

class TestApp < Rails::Application
  config.root = File.dirname(__FILE__)
end
Rails.application = TestApp

module Rails
  def self.root
    @root ||= File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'rails'))
  end
end
Rails.application.config.root = Rails.root

# Call configure to load the settings from
# Rails.application.config.generators to Rails::Generators
# Rails::Generators.configure!

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

def copy_routes
  routes = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'routes.rb'))
  destination = File.join(Rails.root, "config")
  FileUtils.mkdir_p(destination)
  FileUtils.cp routes, destination
end

def copy_application_javascript
  application_js = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'application.js'))
  destination = File.join(Rails.root, "app", "assets", "javascripts")
  FileUtils.mkdir_p(destination)
  FileUtils.cp application_js, destination
end

require 'generators/bootstrap/install/install_generator'
