require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it 'has a valid factory' do
    expect(build(:subscriber)).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    include_examples 'email format'
  end

  describe 'Callbacks' do
    let(:subject) { build(:subscriber) }

    it 'should send mail to admin' do
      expect(subject).to receive(:notify_admin)
      subject.save
    end
  end
end
