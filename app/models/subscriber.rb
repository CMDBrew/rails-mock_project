class Subscriber

  include ActiveModel::Model

  attr_accessor :email, :first_name, :last_name

  validates :email, presence: true, email_format: true

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def persisted?
    false
  end

  def new_record?
    true
  end

  def create
    return false unless valid?
    notify_admin
  end

  def self.create(attributes = {})
    object = new(attributes)
    object.create
  end

  alias save create

  private

  def notify_admin
    SubscriberMailer.notify_admin(self).deliver_now
  end

  def attributes=(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end
