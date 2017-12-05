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
    valid?
  end

  def self.create(attributes = {})
    object = new(attributes)
    object.create
  end

  alias save create

  private

  def attributes=(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end
