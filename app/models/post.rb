class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders]

  before_save :update_published_date

  validates :title,
            presence: true

  scope :by_published_date, -> { order(published_date: :desc) }
  scope :published, lambda {
    where('published = ? AND published_date <= ?', true, Time.zone.now)
  }
  scope :published_in, lambda { |year|
    where('extract(year  from published_date) = ?', year).
      by_published_date
  }

  private

  def slug_candidates
    [
      :title,
      %i[title slug_sequence]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank?
  end

  def slug_sequence
    slug = normalize_friendly_id(title)
    self.class.where(['slug LIKE ?', "%#{slug}%"]).count + 1
  end

  def update_published_date
    return if published_date.present?
    self.published_date = created_at
  end

end
