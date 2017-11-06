Post.delete_all

20.times do
  Post.create(
    title: Faker::Lorem.sentence(1),
    content: Faker::Lorem.paragraph(20),
    published: true
  )
end
