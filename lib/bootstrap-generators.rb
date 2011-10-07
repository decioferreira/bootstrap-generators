require 'rails'
require 'rails/generators'

module BootstrapGenerators
  module Rails
    class Railtie < ::Rails::Railtie
      if ::Rails.version.to_f >= 3.1
        # Erubis has the default template engine
        config.app_generators.template_engine :erubis
        config.app_generators.stylesheets false
        require 'bootstrap-generators/engine'
      else
        # Erubis has the default template engine
        config.generators.template_engine :erubis
      end
    end
  end
end

Rails::Generators.hidden_namespaces << 'rails'
Rails::Generators.hidden_namespaces << 'erb:controller' << 'erb:scaffold'
Rails::Generators.hidden_namespaces << 'erubis:controller' << 'erubis:scaffold'
