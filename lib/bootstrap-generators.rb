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

  class LayoutGenerator < ::Rails::Generators::Base
    desc "This generator installs Twitter Bootstrap Layout"
    source_root File.expand_path('../generators/layout', __FILE__)

    def copy_layout
      say_status("copying", "layout", :green)
      copy_file "application.html.erb", "app/views/layouts/application.html.erb"
    end

    def copy_stylesheet
      say_status("copying", "layout stylesheet", :green)
      copy_file "bootstrap-layout.css", "app/assets/stylesheets/bootstrap-layout.css"
    end
  end
end

Rails::Generators.hidden_namespaces << 'rails'
Rails::Generators.hidden_namespaces << 'erb:controller' << 'erb:scaffold'
Rails::Generators.hidden_namespaces << 'erubis:controller' << 'erubis:scaffold'
