class FormsController < ApplicationController
  def show
    render_page(type: FormPage)
  end

  def submit
    @step = params[:step].to_i || 1
    form = Form.where(url: request.host).first

    @fields = form.fields.where(step: @step)
    responder_id = request.session.id

    form_responses = []
    @fields.each do |field|
      fr = FormResponse.create(form_field_id: field.id, responder_id: responder_id, value: params[field.name])
      form_responses << fr
    end

    # if this is the first step, send an email
    if @step == 1
      FormResponseMailer.with(responder_id: responder_id, form: form, form_responses: form_responses).form_step1_completion_email.deliver_later
    end

    # is there a next step?
    next_step = @step + 1
    any_next_fields = form.fields.where(step: next_step).any?

    if any_next_fields
      redirect_to form_path(step: next_step)
    else
      redirect_to form_complete_path
    end
  end

  def complete
    render_page(type: ConfirmationPage)
  end
end
