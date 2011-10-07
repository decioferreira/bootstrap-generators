require 'generators/erubis'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Erubis
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          filename = filename_with_extensions("_form")
          template filename, File.join("app/views", controller_file_path, filename)
        end
      end

      protected
        def available_views
          %w(index edit show new)
        end
    end
  end
end
