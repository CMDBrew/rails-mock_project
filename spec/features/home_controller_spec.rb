require 'rails_helper'

RSpec.describe HomeController, type: :feature do
  feature 'As a visitor I want to see home page' do
    let(:index_path) { root_path }

    it_behaves_like 'features/controller index'

    scenario 'it should have welcome msg' do
      visit index_path
      expect(page).to have_css 'h2', text: 'WELCOME!'
    end
  end

  feature 'As a visitor I want to see pricings' do
    let(:index_path) { pricing_path }

    it_behaves_like 'features/controller index'
  end
end
