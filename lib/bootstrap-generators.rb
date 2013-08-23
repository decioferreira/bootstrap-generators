require 'rails'

module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      config.app_generators.stylesheets false

      initializer 'bootstrap-generators.setup' do |app|
        app.config.less.paths << File.expand_path('../../vendor/twitter/bootstrap/less', __FILE__) if app.config.respond_to?(:less)
        app.config.assets.paths << File.expand_path('../../vendor/twitter/bootstrap/sass', __FILE__) if app.config.respond_to?(:sass)

        app.config.assets.precompile += %w(bootstrap-ie.js)
      end
    end
  end
end
