FactoryBot.define do
  factory :post do
    title          { Faker::Lorem.sentence(1) }
    content        { Faker::Lorem.paragraph }
    category_list  { Faker::Lorem.word }
    published      { Faker::Boolean.boolean }
    published_date { nil }
  end
end
