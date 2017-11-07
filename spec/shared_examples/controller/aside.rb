RSpec.shared_examples 'post aside' do
  it 'shoud assigns dates' do
    create(:post, published: true, published_date: Time.zone.now).decorate
    create(:post, published: true, published_date: Time.zone.now - 1.month).decorate

    get :index
    expect(assigns(:dates).count).to eq(2)
  end

  it 'shoud assigns categories' do
    create(:post, published: true, category_list: %w[tag_1 tag_2]).decorate
    create(:post, published: true, category_list: %w[tag_1]).decorate

    get :index
    expect(assigns(:categories).count).to eq(2)
  end
end
