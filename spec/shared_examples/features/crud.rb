RSpec.shared_examples 'features/controller index' do
  scenario 'view index' do
    visit index_path
    expect(page).to have_http_status(:success)
  end
end

RSpec.shared_examples 'features/controller show' do
  scenario 'view show' do
    visit show_path
    expect(page).to have_http_status(:success)
  end
end
