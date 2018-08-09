class FormResponseMailer < ApplicationMailer
  def form_step1_completion_email
    @responder_id = params[:responder_id]
    @form = params[:form]
    @form_responses = params[:form_responses]


    mail(to: "corp@assemblerlabs.com", subject: "Form submission: #{@form.name} by #{@responder_id}")
  end
end
