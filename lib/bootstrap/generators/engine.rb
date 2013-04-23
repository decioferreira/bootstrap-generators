module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      initializer 'bootstrap-generators.setup', :group => :all do |app|
        config.less.paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'less') if config.respond_to?(:less)
        config.sass.load_paths << File.join(config.root, 'vendor', 'twitter', 'bootstrap', 'sass') if config.respond_to?(:sass)
      end
    end
  end
end
