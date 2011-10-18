require 'rails'

module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy BootstrapGenerators default files"
      source_root File.expand_path('../templates', __FILE__)
      class_option :layout, :desc => "Bootstrap layout templates (hero, fluid or container-app)", :default => "hero", :type => :string

      class_option :template_engine

      def copy_lib
        directory "lib/templates/#{options[:template_engine]}"
      end

      def create_layout
        template "layouts/#{options[:layout]}.html.#{options[:template_engine]}", "app/views/layouts/application.html.#{options[:template_engine]}"
        copy_file "layouts/#{options[:layout]}.css.scss", "app/assets/stylesheets/bootstrap-generators.css.scss"
        copy_file "bootstrap-generators.js", "app/assets/javascripts/bootstrap-generators.js"
      end
    end
  end
end
