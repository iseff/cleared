class FormsController < ApplicationController
  def show
    render_page(type: FormPage)
  end

  def submit
    @step = params[:step].to_i || 1
    form = Form.where(url: request.domain).first

    @fields = form.fields.where(step: @step)

    @fields.each do |field|
      fr = FormResponse.create(form_field_id: field.id, responder_id: request.session.id, value: params[field.name])
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
