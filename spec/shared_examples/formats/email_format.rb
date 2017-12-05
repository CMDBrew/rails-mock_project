RSpec.shared_examples 'email format' do
  it { should allow_value('abc@gmail.com').for(:email) }
  it { should allow_value('abc@xxx.me').for(:email) }
  it { should allow_value('abc@xxx.yahoo').for(:email) }
  it { should_not allow_value('abc@xxx').for(:email) }
  it { should_not allow_value('abc.com').for(:email) }
  it { should_not allow_value('abc.email.com').for(:email) }
  it { should_not allow_value('abc@email').for(:email) }
end
