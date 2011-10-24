require 'rails'

module Bootstrap
  module Generators
    class Railtie < ::Rails::Railtie
      if ::Rails.version < "3.1"
        require 'bootstrap/generators/railtie'
      else
        config.app_generators.stylesheets false
        require 'bootstrap/generators/engine'
      end
      require 'bootstrap/generators/version'
    end
  end
end

# FIXME: Move this from here (find if this is the best way to do it)
module Rails
  module Generators
    class GeneratedAttribute
      def simple_form_input_class
        @simple_form_input_class ||= case field_type
          when :time_select     then 'small'
          when :datetime_select then 'small'
          when :date_select     then 'small'
          when :check_box       then ''
          else
            'xxlarge'
        end
      end
    end
  end
end

require 'simple_form'

module SimpleForm
  class ErrorNotification
    def render
      if has_errors?
        template.content_tag(:div, template.content_tag(error_notification_tag, error_message, html_options), :class => 'alert-message error')
      end
    end
  end
end

