module FormsHelper
  def render_form(options={})
    options[:separator] ||= ""
    options[:field_class] ||= ""
    options[:button_text] ||= "Submit"

    str  = "<form method='POST' action='#{form_submit_path(step: @step)}'>" # TODO method and action
    str += "<input type='hidden' name='step' value='#{@step}' />"
    str += "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}' />"
    field_htmls = []

    first = true

    @fields.each do |field|
      classes = options[:field_class] || ""
      trackable = true
      if field.trackable == false
        trackable = false
        classes += " inspectletIgnore "
      end

      fstr = ""
      fstr += "<label>#{field.label}</label>" if !field.label.blank?
      case field.input_type
      when "text", "email", "date", "password", "tel", "name", "number"
        fstr += "<input type='#{field.input_type}' name='#{field.name}' class='#{classes}' id='field_#{field.name.tableize}' placeholder='#{field.placeholder}'"
        fstr += "heap-ignore='true'" if !trackable

        if first
          fstr += " autofocus"
        end

        fstr += " />"
        field_htmls << fstr
      when "dropdown"
        fstr += "<select name='#{field.name}' id='field_#{field.name.tableize}' class='#{classes}' "
        fstr += "heap-ignore='true'" if !trackable

        if first
          fstr += " autofocus"
        end

        fstr += " >"
        field.options.each do |opt|
          fstr += "<option value='#{opt.value}'>#{opt.name}</option>"
        end
        fstr += "</select>"
        field_htmls << fstr
      when "radio"
        field.options.each do |opt|
          fstr += "<input type='radio' name='#{opt.name}' value='#{opt.value}' id='field_#{field.name.tableize}' class='#{classes}' "
          fstr += "heap-ignore='true'" if !trackable
          fstr += " /> #{opt.value}"
        end
        field_htmls << fstr
      end

      first = false
    end

    btn_text = "Submit"
    if options[:button_text]&.is_a?(String)
      btn_text = options[:button_text]
    elsif options[:button_text]&.is_a?(Hash)
      btn_text = options[:button_text][@step]
    elsif options[:button_text]&.is_a?(Array)
      btn_text = options[:button_text][@step.to_i - 1]
    end

    field_htmls << "<button id='signup-submit' class='btn btn-primary'>#{btn_text.html_safe}</button>"

    str += field_htmls.join(options[:separator])
    str += "</form>"
    str.html_safe
  end
end
