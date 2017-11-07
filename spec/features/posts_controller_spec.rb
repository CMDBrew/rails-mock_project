require 'rails_helper'

RSpec.describe PostsController, type: :feature do
  let(:post)       { create(:post, published: true) }
  let(:index_path) { posts_path }
  let(:show_path)  { post_path(post) }

  it_behaves_like 'features/controller index'
  it_behaves_like 'features/controller show'
end
