# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  # User.create( first_name: Faker::Name.first_name,
  #              last_name: Faker::Name.last_name,
  #              email: Faker::Internet.email,
  #              password: 'super' )

  # Idea.create( title: Faker::ChuckNorris.fact,
  #              description: Faker::Lorem.paragraph,
  #              user_id: 1 + rand(9))

  Review.create( body: Faker::Hipster.sentence,
                 idea_id: 10 + rand(9),
                 user_id: 1 + rand(9))
end
