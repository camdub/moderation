# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Category.delete_all
LimitLevel.delete_all
Cycle.delete_all
CategoryHistory.delete_all

categories = [
  'caffeine',
  'alcohol',
  'fried food',
  'sweets',
  'meat',
  'white carbs'
]

categories.each do |category|
  Category.create({ name: category, active: true })
end

limit_levels = [
  'restricted',
  'limited'
]

limit_levels.each { |level| LimitLevel.create(name: level) }
Cycle.create(number: 1, active: true)
