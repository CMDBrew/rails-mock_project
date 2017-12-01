require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    it 'should be 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'should filter posts by month & year' do
      create(:post, published: true, published_date: Time.zone.now).decorate
      create(:post, published: true, published_date: Time.zone.now - 1.month).decorate
      create(:post, published: true, published_date: Time.zone.now - 2.months).decorate

      get :index
      expect(assigns(:posts).count).to eq(1)
    end

    it 'should filter posts by category' do
      create(:post, published: true, category_list: 'tag_1').decorate
      create(:post, published: true, category_list: 'tag_2').decorate

      get :index, params: { category: 'tag_1' }
      expect(assigns(:posts).count).to eq(1)
    end

    it 'should order posts by published_date' do
      post1 = create(:post, published: true)
      post2 = create(:post, published: true)
      post3 = create(:post, published: true)

      get :index
      expect(assigns(:posts).pluck(:published_date)).to(
        match_array([post3.published_date, post2.published_date, post1.published_date])
      )
    end

    it 'should not include future posts' do
      create(:post, published: true, published_date: Time.zone.now + 1.day).decorate
      post2 = create(:post, published: true, published_date: Time.zone.now).decorate

      get :index
      expect(assigns(:posts).pluck(:id)).to match_array([post2.id])
    end

    include_examples 'post aside'
  end

  describe 'GET show' do
    let(:post) { create(:post, published: true) }

    it 'should be 200' do
      get :show, params: { id: post.slug }
      expect(response).to have_http_status(200)
    end

    include_examples 'post aside'
  end
end
