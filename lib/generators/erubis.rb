module Erubis
  module Generators
    module TemplatePath
      def source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'erubis', generator_name, 'templates'))
      end
    end
  end
end

