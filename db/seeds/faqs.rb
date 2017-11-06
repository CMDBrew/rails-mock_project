Faq.delete_all

10.times do
  Faq.create(
    question: Faker::Lorem.sentence(1),
    answer: Faker::Lorem.paragraph(3)
  )
end
