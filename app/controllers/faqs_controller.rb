class FaqsController < ApplicationController

  def index
    @faqs = Faq.by_position
  end

end
