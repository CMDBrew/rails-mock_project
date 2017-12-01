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
    it { should allow_value('abc@gmail.com').for(:email) }
    it { should allow_value('abc@xxx.me').for(:email) }
    it { should allow_value('abc@xxx.yahoo').for(:email) }
    it { should_not allow_value('abc@xxx').for(:email) }
    it { should_not allow_value('abc.com').for(:email) }
    it { should_not allow_value('abc.email.com').for(:email) }
    it { should_not allow_value('abc@email').for(:email) }
  end
end
