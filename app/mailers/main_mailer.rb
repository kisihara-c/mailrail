class MainMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.main_mailer.confirm.subject
  #
  def confirm(mailr)
    @mailr = mailr

    mail to: mailr.dest_address, subject: "reserved success"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.main_mailer.remind.subject
  #
  def remind
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
