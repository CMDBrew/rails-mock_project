# Subscriber Mailer
class SubscriberMailer < MandrillMailer

  def notify_admin(subscriber)
    @subscriber = subscriber
    subject = 'New Subscriber'
    body = mandrill_template(
      ENV['MANDRILL_CONTACT_SUBMISSION_TEMPLATE'],
      'TABLE' => table
    )
    email_to = ENV['MANDRILL_SMTP_NOTIFICATION_EMAIL']
    send_mail(email_to, subject, body)
  end

  private

  def table
    render_to_string(
      partial: 'mailers/table',
      locals: {
        resource: @subscriber,
        fields:   %w[email]
      },
      layout: false
    )
  end

end
