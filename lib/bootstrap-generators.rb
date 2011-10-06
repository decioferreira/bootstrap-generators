require 'rails/generators'

module Bootstrap
  module Generators; end
end

Rails::Generators.hidden_namespaces << 'rails'
Rails::Generators.hidden_namespaces << 'erb:controller' << 'erb:scaffold'

