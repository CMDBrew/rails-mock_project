require 'rails_helper'

RSpec.describe ContactsController, type: :feature do
  let(:new_path) { new_contact_path }

  it_behaves_like 'features/controller new'

  scenario 'submit form' do
    visit contacts_path

    within('#contact-form') do
      fill_in 'contact_name', with: Faker::Name.name
      fill_in 'contact_email', with: Faker::Internet.email
      fill_in 'contact_message', with: Faker::Lorem.paragraph
    end

    first('input[type="submit"]').click
    expect(page).to have_css('.alert-success')
  end
end
