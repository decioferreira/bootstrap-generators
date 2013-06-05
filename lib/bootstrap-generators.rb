require 'rails'

module Bootstrap
  module Generators
    class Engine < Rails::Engine
      initializer 'bootstrap-generators.setup' do
        config.less.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'less') if config.respond_to?(:less)
        config.assets.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'sass') if config.respond_to?(:sass)
      end
    end
  end
end
