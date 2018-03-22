# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  i = i+1
  Question.create(title: "Question nro #{id}",
                  description: "description nro #{id}: Lorem ipsum...",
                  voto: rand(0..200))

end
