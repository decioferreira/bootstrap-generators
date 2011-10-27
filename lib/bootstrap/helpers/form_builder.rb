require 'action_view'

module Bootstrap
  module Helpers
    class FormBuilder < ActionView::Helpers::FormBuilder
      def text_field(method, options = {:class => "xxlarge"})
        super
      end

      def text_area(method, options = {:class => "xxlarge"})
        super
      end

      def password_field(method, options = {:class => "xxlarge"})
        super
      end

      def submit(value=nil, options={:class => "btn primary"})
        super
      end
    end
  end
end

ActionView::Base.default_form_builder = Bootstrap::Helpers::FormBuilder

