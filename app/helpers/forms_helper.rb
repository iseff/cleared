module FormsHelper
  def render_form(options={})
    options[:separator] ||= ""
    options[:field_class] ||= ""
    options[:button_text] ||= "Submit"

    str  = "<form method='POST' action='#{form_submit_path(step: @step)}'>" # TODO method and action
    str += "<input type='hidden' name='step' value='#{@step}' />"
    str += "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}' />"
    field_htmls = []

    @fields.each do |field|
      classes = options[:field_class] || ""
      if !field.nil? && !field.trackable
        classes += " inspectletIgnore "
      end

      case field.input_type
      when "text", "email", "date", "password", "tel", "name"
        tag = "<input type='#{field.input_type}' name='#{field.name}' class='#{classes}' id='field_#{field.name.tableize}' placeholder='#{field.placeholder}'"
        tag += "heap-ignore='true'" if !field.nil? && !field.trackable
        tag += " />"
        field_htmls << tag
      when "dropdown"
        fstr = "<select name='#{field.name}' id='field_#{field.name.tableize}' class='#{classes}' "
        fstr += "heap-ignore='true'" if !field.nil? && !field.trackable
        fstr += " >"
        field.options.each do |opt|
          fstr += "<option value='#{opt.value}'>#{opt.name}</option>"
        end
        fstr += "</select>"
        field_htmls << fstr
      when "radio"
        fstr = ""
        field.options.each do |opt|
          fstr += "<input type='radio' name='#{opt.name}' value='#{opt.value}' id='field_#{field.name.tableize}' class='#{classes}' "
          fstr += "heap-ignore='true'" if !field.nil? && !field.trackable
          fstr += " /> #{opt.value}"
        end
        field_htmls << fstr
      end
    end

    btn_text = "Submit"
    if options[:button_text]&.is_a?(String)
      btn_text = options[:button_text]
    elsif options[:button_text]&.is_a?(Hash)
      btn_text = options[:button_text][@step]
    elsif options[:button_text]&.is_a?(Array)
      btn_text = options[:button_text][@step.to_i - 1]
    end

    field_htmls << "<button id='signup-submit' class='btn btn-primary'>#{btn_text}</button>"

    str += field_htmls.join(options[:separator])
    str += "</form>"
    str.html_safe
  end
end
