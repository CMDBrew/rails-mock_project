require 'rails_helper'

RSpec.describe FaqsController, type: :controller do
  describe 'GET index' do
    it 'should be 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'should order faqs by position' do
      faq1 = create(:faq, position: 3).decorate
      faq2 = create(:faq, position: 1).decorate
      faq3 = create(:faq, position: 2).decorate

      get :index
      expect(assigns(:faqs)).to eq([faq2, faq3, faq1])
    end
  end
end
