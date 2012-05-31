module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      initializer 'bootstrap-generators.after.load_config_initializers', :after => :load_config_initializers do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'less') if app.config.respond_to?(:less)
        app.config.sass.load_paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'sass') if app.config.respond_to?(:sass)
      end
    end
  end
end
