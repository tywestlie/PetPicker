# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Steven Tyler', species_to_adopt: 1, search_radius: 5, lat: 33.3, long: 44.4, role: 3, password_digest: 'admin')
user2 = User.create(name: 'Theresa', species_to_adopt: 0, search_radius: 5, lat: 33.3, long: 44.4, role: 2, password_digest: '123')
user3 = User.create(name: 'Tyler Steven', species_to_adopt: 2, search_radius: 5, lat: 33.3, long: 44.4, role: 1, password_digest: '123')
user4 = User.create(name: 'Puppy-boi', species_to_adopt: 1, search_radius: 5, lat: 33.3, long: 44.4, role: 0, password_digest: '123')
