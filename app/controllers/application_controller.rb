class ApplicationController < ActionController::Base
  def render_page(options={})
    options[:type] ||= LandingPage
    # based on domain, get the Page
    page = page_for(page_type: options[:type], host: request.host)
    template = page.template
    tvs = template.variables
    @v = {}
    tvs.each { |tv| @v[tv.key_name] = tv.default_value.html_safe }
    page.variable_values.each { |vv| @v[vv.template_variable.key_name] = vv.value.html_safe }

    # always try to get a form, just in case the user wants it on the homepage
    @step = params[:step] || 1
    form = Form.where(url: request.host).first
    @fields = nil
    if !form.nil?
      @fields = form.fields.where(step: @step)
    end

    render inline: template.template_code
  end

  def landing_page_for(host)
    page_for(page_type: LandingPage, host: host)
  end

  def form_page_for(host)
    page_for(page_type: FormPage, host: host)
  end

  def form_for(host)
    page_for(page_type: Form, host: host)
  end

  def page_for(options={})
    options[:page_type].where(url: options[:host]).last
  end

end
