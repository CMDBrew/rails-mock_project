require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    # Using the shortened version of FactoryBot syntax.
    # Add:  "config.include FactoryBot::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:post)).to be_valid
  end

  let(:post) { create(:post) }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { expect(post.published_date).to eq(post.created_at) }
  end

  describe 'Scopes' do
    it 'should only include recent posts' do
      create_list(:post, 5, published_date: Time.zone.now - 1.year)
      create_list(:post, 4, published_date: Time.zone.now)

      expect(Post.recent.count).to eq(4)
    end

    it 'should only include past posts' do
      create_list(:post, 5, published_date: Time.zone.now - 1.year)
      create_list(:post, 4, published_date: Time.zone.now)

      expect(Post.past.count).to eq(5)
    end

    it 'should order posts by published_date' do
      post1 = create(:post, published_date: Time.zone.now)
      post2 = create(:post, published_date: Time.zone.now - 2.days)
      post3 = create(:post, published_date: Time.zone.now - 1.day)

      expect(Post.by_published_date).to match_array [post1, post3, post2]
    end

    it 'should only include published posts' do
      create(:post, published_date: Time.zone.now + 2.days, published: true)
      create(:post, published_date: Time.zone.now - 2.days, published: false)
      post = create(:post, published_date: Time.zone.now - 2.days, published: true)

      expect(Post.published).to match_array [post]
    end

    it 'should only include posts published in month & year' do
      create(:post, published_date: Time.zone.now + 2.months, published: true)
      post = create(:post, published_date: Time.zone.now - 2.months, published: true)

      expect(Post.published_in(Time.zone.now - 2.months)).to match_array [post]
    end
  end

  describe 'Callbacks' do
    context 'Slug Sequence' do
      before(:each) do
        @post1 = create(:post, title: 'title')
        @post2 = create(:post, title: 'title')
      end

      it 'should no have the same slug' do
        expect(@post1.slug).not_to eq(@post2.slug)
      end

      it 'should add suffix to slug if duplicates' do
        expect(@post2.slug).to eq("#{@post1.slug}-2")
      end
    end
  end
end
