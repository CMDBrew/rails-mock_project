class Contact < ApplicationRecord

  validates :name, :message,
            presence: true
  validates :email,
            presence: true,
            email_format: true

end
