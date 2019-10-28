# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times.each do |i|
  User.create(
    name: "test#{i}",
    password: 'aaaaaaaa'
  )
end

Room.create(
  name: 'Test'
)
PlayerEntry.create(
  room_id: Room.first.id,
  user_id: User.first.id,
)
