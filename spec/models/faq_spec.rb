require 'rails_helper'

RSpec.describe Faq, type: :model do
  it 'has a valid factory' do
    # Using the shortened version of FactoryBot syntax.
    # Add:  "config.include FactoryBot::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:faq)).to be_valid
  end

  let(:faq) { create(:faq) }

  describe 'Validations' do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:answer) }
    it { should validate_presence_of(:position) }
  end

  describe 'Scopes' do
    it 'should order by position' do
      create_list(:faq, 5)
      expect(Faq.by_position.pluck(:position)).to match_array((1..5).to_a)
    end
  end
end
