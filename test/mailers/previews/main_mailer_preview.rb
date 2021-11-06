# Preview all emails at http://localhost:3000/rails/mailers/main_mailer
class MainMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/main_mailer/confirm
  def confirm
    mailr = Mailr.first
    MainMailer.confirm(mailr)
  end

  # Preview this email at http://localhost:3000/rails/mailers/main_mailer/remind
  def remind
    MainMailer.remind
  end

end
