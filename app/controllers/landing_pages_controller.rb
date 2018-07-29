class LandingPagesController < ApplicationController
  def show
    # based on domain, get the Page
    page = Page.where(url: request.domain).first
    template = page.template
    tvs = template.variables
    @v = {}
    tvs.each { |tv| @v[tv.key_name] = tv.default_value }
    page.variable_values.each { |vv| @v[vv.template_variable.key_name] = vv.value }

    render inline: template.template_code
  end
end
