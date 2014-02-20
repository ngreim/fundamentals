# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name: 'user1', email: 'user1@example.com', password: 'secret', password_confirmation: 'secret')

user.skip_confirmation!
user.save

user = User.create!(name: 'user2', email: 'user2@example.com', password: 'secret', password_confirmation: 'secret')

user.skip_confirmation!
user.save

Game.create!(home_score: 0, away_score: 0)



