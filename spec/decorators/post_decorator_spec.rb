require 'rails_helper'

describe PostDecorator do
  let(:content) { Faker::Lorem.characters(300) }

  let(:post) do
    create(:post, published_date: Time.zone.now, content: "<p>#{content}</p>").
      decorate
  end

  it 'returns published_date in %B %d, %Y format' do
    expect(post.published_date).to eq(Time.zone.now.strftime('%B %d, %Y'))
  end

  it 'returns published_date_short in %b %d, %Y format' do
    expect(post.published_date_short).to eq(Time.zone.now.strftime('%b %d, %Y'))
  end

  it 'returns content_short without html and truncate to 250 letters' do
    expect(post.content_short).to eq("#{content[0..246]}...")
  end
end
