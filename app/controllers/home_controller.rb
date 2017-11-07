class HomeController < ApplicationController

  def index
    @posts = Post.published.by_published_date.
             limit(3).decorate
    @faqs = Faq.by_position.decorate
  end

  def pricing; end

end
