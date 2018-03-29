# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  id = i + 1
  Question.create(title: "Question nbr #{id}",
                  description: "description nro #{id}: Lorem ipsum...",
                  votos: rand(3000..9000),)
end
