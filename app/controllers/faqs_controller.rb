class FaqsController < ApplicationController

  def index
    @faqs = Faq.by_position.decorate
  end

end
