module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      initializer 'bootstrap-generators.after.load_config_initializers', :after => :load_config_initializers do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'less') if app.config.less
        app.config.sass.load_paths << File.join(config.root, 'vendor', 'twitter', 'sass', 'bootstrap', 'lib') if app.config.sass
      end
    end
  end
end
