require 'rails'

module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy BootstrapGenerators default files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_lib
        directory 'lib'
      end

      def create_layout
        template 'application.html.erb', 'app/views/layouts/application.html.erb'
        copy_file 'bootstrap-generators.css.scss', 'app/assets/stylesheets/bootstrap-generators.css.scss'
      end
    end
  end
end
