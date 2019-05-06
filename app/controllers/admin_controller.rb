class AdminController < ApplicationController
  # Currently ALL users are admins... if this ever changed, we would need to change this
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def index

    @landing_page = landing_page_for(request.host)
    @form_page = form_page_for(request.host)

    if request.post?
      p = params.permit(:landing_variables, :form_variables).tap do |whitelisted|
        whitelisted[:landing_variables] = params[:landing_variables]
        whitelisted[:form_variables] = params[:form_variables]
      end

      p[:landing_variables]&.each_pair do |variable_id, value|
        next if value.blank?

        vv = PageTemplateVariableValue.find_or_create_by(page_id: @landing_page.id, template_variable_id: variable_id)
        vv.value = value
        vv.save
      end

      p[:form_variables]&.each_pair do |variable_id, value|
        next if value.blank?

        vv = PageTemplateVariableValue.find_or_create_by(page_id: @form_page.id, template_variable_id: variable_id)
        vv.value = value
        vv.save
      end
    end
  end

  def template
    p = params.permit(:id, :name, :template_code)
    @template = Template.find(p[:id])

    if request.post?
      @template.name = p[:name]
      @template.template_code = p[:template_code]
      @template.save
    end
  end

  def form
  end

  def form_responses
    @form = form_for(request.host)
    @form_fields = @form.fields.order(id: :asc)

    frs = FormResponse.where(form_field_id: @form_fields.map(&:id))

    # group responses by responder and then the form_field_id
    # { responder_id: [ [field_id, "response"] ] }, where field_id is ordered
    @responses = {}
    frs.each do |fr|
      @responses[fr.responder_id] ||= []
      @responses[fr.responder_id] << [fr.form_field_id, fr.value]
    end
    #@responses.each_pair do |responder_id, arr|
  #    arr.sort do |a, b|
  #      a[0] <=> b[0]
  #    end
  #  end
  end
end
