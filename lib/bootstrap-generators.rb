require 'rails'

module Bootstrap
  module Generators
    class Engine < Rails::Engine
      initializer 'bootstrap-generators.setup' do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'less') if app.config.respond_to?(:less)
        app.config.assets.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'sass') if app.config.respond_to?(:sass)
      end
    end
  end
end
