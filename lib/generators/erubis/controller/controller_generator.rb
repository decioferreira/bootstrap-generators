require 'generators/erubis'
require 'rails/generators/erb/controller/controller_generator'

module Erubis
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      extend TemplatePath
    end
  end
end

