class SubscribersController < ApplicationController

  layout false

  respond_to :js

  def create
    @subscriber = Subscriber.new subscriber_params
    return unless @subscriber.save
    @subscriber = Subscriber.new
    flash.now[:success] = t('.success')
  end

  private

  def subscriber_params
    params.fetch(:subscriber, {}).permit(:email)
  end

end
