require 'rails_helper'

RSpec.describe FaqsController, type: :feature do
  let(:index_path) { faqs_path }

  feature 'As a visitor I want to see faqs' do
    it_behaves_like 'features/controller index'
  end
end
