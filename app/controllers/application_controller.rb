class ApplicationController < ActionController::Base
  def render_page(options={})
    options[:type] ||= LandingPage
    # based on domain, get the Page
    page = options[:type].where(url: request.domain).first
    template = page.template
    tvs = template.variables
    @v = {}
    tvs.each { |tv| @v[tv.key_name] = tv.default_value }
    page.variable_values.each { |vv| @v[vv.template_variable.key_name] = vv.value }

    # always try to get a form, just in case the user wants it on the homepage
    @step = params[:step] || 1
    form = Form.where(url: request.domain).first
    @fields = nil
    if !form.nil?
      @fields = form.fields.where(step: @step)
    end

    render inline: template.template_code
  end

end
