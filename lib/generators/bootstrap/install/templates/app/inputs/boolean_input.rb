class BooleanInput < SimpleForm::Inputs::BooleanInput
  def label_input
    content = "".html_safe
    [ :input, :error, :hint ].each do |component|
      next if options[component] == false
      rendered = send(component)
      content.safe_concat rendered.to_s if rendered
    end
    (options[:label] == false ? "" : label) + "<div class=\"input\"><ul class=\"inputs-list\"><li><label>#{content}</label></li></ul></div>".html_safe
  end
end