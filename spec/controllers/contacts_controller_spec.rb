require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET new' do
    it 'should be 200' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'assigns a blank contact to the view' do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe 'POST create' do
    it 'renders form template' do
      params = {
        contact: {
          name: Faker::Name.name
        }
      }

      post :create, params: params
      expect(response).to render_template('new')
    end

    it 'assign flash[:error] if missing params name' do
      params = {
        contact: {
          email: Faker::Internet.email,
          message: Faker::Lorem.paragraph
        }
      }

      post :create, params: params
      expect(flash[:error]).to be_present
    end

    it 'assign flash[:error] if missing params email' do
      params = {
        contact: {
          name: Faker::Name.name,
          message: Faker::Lorem.paragraph
        }
      }

      post :create, params: params
      expect(flash[:error]).to be_present
    end

    it 'assign flash[:error] if missing params message' do
      params = {
        contact: {
          name: Faker::Name.name,
          email: Faker::Internet.email
        }
      }

      post :create, params: params
      expect(flash[:error]).to be_present
    end

    it 'assign flash[:success] if contact is valid' do
      params = {
        contact: {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          message: Faker::Lorem.paragraph
        }
      }

      post :create, params: params
      expect(flash[:success]).to be_present
    end
  end

  describe 'POST create Ajax' do
    it 'renders create_error template' do
      params = {
        contact: {
          name: Faker::Name.name
        }
      }

      post :create, params: params, format: :js
      expect(response).to render_template('contacts/create_error')
    end

    it 'renders create template' do
      params = {
        contact: {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          message: Faker::Lorem.paragraph
        }
      }

      post :create, params: params, format: :js
      expect(response).to render_template('contacts/create')
    end
  end
end
