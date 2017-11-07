require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'should be 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'should limit posts to 3' do
      create_list(:post, 10, published: true)

      get :index
      expect(assigns(:posts).count).to eq(3)
    end

    it 'should order posts by published_date' do
      post1 = create(:post, published: true, published_date: Time.zone.now - 3.hours).decorate
      post2 = create(:post, published: true, published_date: Time.zone.now - 2.hours).decorate
      post3 = create(:post, published: true, published_date: Time.zone.now).decorate

      get :index
      expect(assigns(:posts)).to eq([post3, post2, post1])
    end

    it 'should order faqs by position' do
      faq1 = create(:faq, position: 3).decorate
      faq2 = create(:faq, position: 1).decorate
      faq3 = create(:faq, position: 2).decorate

      get :index
      expect(assigns(:faqs)).to eq([faq2, faq3, faq1])
    end
  end

  describe 'GET pricing' do
    it 'should be 200' do
      get :pricing
      expect(response).to have_http_status(200)
    end
  end
end
