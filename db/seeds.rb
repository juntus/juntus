# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


raise "You cannot seed the production database" if Rails.env.production?

Idea.destroy_all

1.upto(50).each do |i|
  Idea.create(title: "Idea #{i}", description: "Idea #{i} description", short_description: "Idea here " * SecureRandom.random_number(20))
end