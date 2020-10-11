# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
User.create!(
    nickname: 'Test',
    email: 'test@example.com',
    description: 'Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    password: 'pass1234',
    password_confirmation: 'pass1234'
)
10.times do |i|
    User.create!(
        nickname: 'Test' + i.to_s,
        email: "test#{i}@example.com",
        description: 'Test account',
        password: 'pass1234',
        password_confirmation: 'pass1234'
    )
end
