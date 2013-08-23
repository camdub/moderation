# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  'caffiene',
  'alcohol',
  'fried food',
  'sweets',
  'meat',
  'white carbs'
]

categories.each do |category|
  Category.create({ name: category, active: true })
end

