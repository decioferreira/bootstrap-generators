module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      initializer 'bootstrap-generators.setup', :after => 'less-rails.after.load_config_initializers' do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'bootstrap')
      end
    end
  end
end
