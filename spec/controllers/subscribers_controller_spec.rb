require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  describe 'Subscriber create Ajax' do
    it 'renders create template' do
      post :create, params: {}, format: :js
      expect(response).to render_template('subscribers/create')
    end

    it 'renders create template' do
      params = {
        subscriber: {
          email: Faker::Internet.email
        }
      }

      post :create, params: params, format: :js
      expect(response).to render_template('subscribers/create')
    end

    it 'returns success message' do
      params = {
        subscriber: {
          email: Faker::Internet.email
        }
      }

      post :create, params: params, format: :js
      expect(flash[:success]).to be_present
    end
  end
end
