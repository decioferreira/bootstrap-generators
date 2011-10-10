require 'rails'

module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy BootstrapGenerators default files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_simple_form_inputs
        directory 'app'
      end

      def copy_simple_form_config
        directory 'config'
      end

      def copy_lib
        directory 'lib'
      end

      def create_layout
        template 'application.html.erb', 'app/views/layouts/application.html.erb'
        copy_file 'bootstrap-generators.css.scss', 'app/assets/stylesheets/bootstrap-generators.css.scss'
        copy_file 'bootstrap-generators.js', 'app/assets/javascripts/bootstrap-generators.js'
      end
    end
  end
end
