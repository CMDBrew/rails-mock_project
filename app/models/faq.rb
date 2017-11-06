class Faq < ApplicationRecord

  acts_as_list

  validates :question, :answer, :position,
            presence: true

  scope :by_position, -> { order(position: :asc) }

end
