# Contact Mailer
class ContactMailer < MandrillMailer

  def notify_admin(contact)
    @contact = contact.reload
    subject = 'Contact Submission'
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
        resource: @contact,
        fields:   %w[name email message created_at]
      },
      layout: false
    )
  end

end
