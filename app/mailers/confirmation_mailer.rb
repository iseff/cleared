class ConfirmationMailer < ApplicationMailer
  layout 'confirmation_mailer'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.confirmation.subject
  #
  def confirmation(to, template)
    @template = template
    mail to: to
  end
end
