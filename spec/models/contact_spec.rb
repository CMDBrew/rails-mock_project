require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'has a valid factory' do
    # Using the shortened version of FactoryBot syntax.
    # Add:  "config.include FactoryBot::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:contact)).to be_valid
  end

  let(:contact) { create(:contact) }

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:message) }
    include_examples 'email format'
  end

  describe 'Callbacks' do
    let(:subject) { build(:contact) }

    it 'should send mail to admin' do
      expect(subject).to receive(:notify_admin)
      subject.save
    end
  end
end
