module Bootstrap
  module Generators
    class Railtie < ::Rails::Railtie
      if ::Rails.version < "3.1"
        require 'bootstrap/generators/railtie'
      else
        config.app_generators.stylesheets false
        require 'bootstrap/generators/engine'
      end
      require 'bootstrap/generators/version'
    end
  end
end
