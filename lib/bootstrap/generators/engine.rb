module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      initializer 'bootstrap-generators.setup', :after => 'less-rails.after.load_config_initializers' do |app|
        begin # check if less is installed
          app.config.less.paths << File.join(config.root, 'vendor', 'bootstrap')
        rescue
          # less not installed
        end
      end
    end
  end
end
