# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |n|
  currentApp = RegisteredApplication.create(name: "Application #{n}", URL: "www.google.com", user: User.first)
  2.times do |n|
    Event.create(name: "Event #{n}", registered_application: RegisteredApplication.last)
  end
end
