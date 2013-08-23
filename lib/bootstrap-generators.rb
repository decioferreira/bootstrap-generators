require 'rails'

module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      config.app_generators.stylesheets false

      # Fonts
      config.assets.paths << File.expand_path('../../vendor/assets/fonts', __FILE__)
      config.assets.precompile += %w( .svg .eot .woff .ttf )

      initializer 'bootstrap-generators.setup' do |app|
        app.config.less.paths << File.expand_path('../../vendor/twitter/bootstrap/less', __FILE__) if app.config.respond_to?(:less)
        app.config.assets.paths << File.expand_path('../../vendor/twitter/bootstrap/sass', __FILE__) if app.config.respond_to?(:sass)
      end
    end
  end
end
