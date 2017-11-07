FactoryBot.define do
  factory :faq do
    question { Faker::Lorem.sentence(1) }
    answer   { Faker::Lorem.paragraph(3) }
    position { 0 }
  end
end
