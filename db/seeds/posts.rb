Post.delete_all

categories = []

5.times do
  categories << Faker::Lorem.word
end

20.times do
  Post.create(
    title: Faker::Lorem.sentence(1),
    content: Faker::Lorem.paragraph(20),
    category_list: categories.sample(1 + rand(categories.count)),
    published: true
  )
end
