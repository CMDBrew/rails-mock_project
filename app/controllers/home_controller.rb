class HomeController < ApplicationController

  def index
    @posts = Post.published.by_published_date.
             limit(3)
    @faqs = Faq.by_position
  end

  def pricing; end

end
