module FormsHelper
  def render_form(options={})
    options[:separator] ||= ""

    str  = "<form method='POST' action='#{form_submit_path(step: @step)}'>" # TODO method and action
    str += "<input type='hidden' name='step' value='#{@step}' />"
    str += "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}' />"
    field_htmls = []
    @fields.each do |field|
      case field.input_type
      when "text", "email", "date", "password"
        field_htmls << "<input type='#{field.input_type}' name='#{field.name}' placeholder='#{field.placeholder}' />"
      when "dropdown"
        fstr = "<select name='#{field.name}'>"
        field.options.each do |opt|
          fstr += "<option value='#{opt.value}'>#{opt.name}</option>"
        end
        fstr += "</select>"
        field_htmls << fstr
      when "radio"
        fstr = ""
        field.options.each do |opt|
          fstr += "<input type='radio' name='#{opt.name}' value='#{opt.value}' /> #{opt.value}"
        end
        field_htmls << fstr
      end
    end

    str += field_htmls.join(options[:separator])
    str += "</form>"
    str.html_safe
  end
end
