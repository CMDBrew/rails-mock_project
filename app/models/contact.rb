class Contact < ApplicationRecord

  after_create :notify_admin

  validates :name, :message,
            presence: true
  validates :email,
            presence: true,
            email_format: true

  private

  def notify_admin
    ContactMailer.notify_admin(self).deliver_now
  end

end
