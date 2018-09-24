class ConfirmationMailer < ApplicationMailer
  layout 'confirmation_mailer'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.confirmation.subject
  #
  def confirmation(to, template, name)
    @template = template
    mail to: to, subject: "Thanks for signing up for #{name}", from: "#{name} <corp@assemblerlabs.com>"
  end
end
