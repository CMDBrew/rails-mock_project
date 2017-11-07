# Decorates Post
class PostDecorator < ApplicationDecorator

  delegate_all

  def published_date
    object.published_date.strftime('%B %d, %Y')
  end

  def published_date_short
    object.published_date.strftime('%b %d, %Y')
  end

  def content_short
    return if content.blank?
    truncate(strip_tags(content), length: 250)
  end

end
