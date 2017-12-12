# Application Mailer
class ApplicationMailer < ActionMailer::Base

  layout 'mailer'

  default(
    from: ENV['SMTP_NOTIFICATION_EMAIL'],
    reply_to: ENV['SMTP_NOTIFICATION_EMAIL']
  )

end
