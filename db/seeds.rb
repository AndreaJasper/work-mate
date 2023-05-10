# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Users

workorders = Workorders.create([
  { title: 'Filler' },
  { description: 'Rebuild machine from scratch' },
  { multiplie: 1 },
  { labor_hours: 36 },
  { user_id: user.first }
])

# Users.create!(name: "Jane Doe",
#              email: "admin@example.com",
#              password: "password"
# )

# 10.times do |n|
#     name = Faker::Name.unique.name
#     email = Faker::Internet.email
#     password = "password"
#     User.create!(name: name,
#                  email: email,
#                  passowrd: password
#     )
# end

# #Workorders

# users = User.workorder(created_at).take(6)
# 10.times do
#   title = Faker::Lorem.sentence
#   description = Faker::Lorem.sentence(5)
#   multiplier = Faker::Number(1)
#   labor_hours = Faker::Number(2)
#   user.each { |user| user.workorders.create!(title: title, description: description, )}
# end