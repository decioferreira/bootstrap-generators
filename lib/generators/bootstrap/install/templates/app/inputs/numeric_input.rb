class NumericInput < SimpleForm::Inputs::NumericInput
  def label_input
    content = "".html_safe
    [ :input, :error, :hint ].each do |component|
      next if options[component] == false
      rendered = send(component)
      content.safe_concat rendered.to_s if rendered
    end
    (options[:label] == false ? "" : label) + "<div class=\"input\">#{content}</div>".html_safe
  end
end

