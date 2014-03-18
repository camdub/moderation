require 'factory_girl'

FactoryGirl.define do

  sequence :category_options do |n|
    categories = %w(meat sweets alcohol fried_food caffeine white_carbs)
    categories[n % categories.length]
  end

  factory :category do
    name { generate(:category_options) }
    active true
  end

  factory :cycle do
    sequence(:number, 1)
    active true
  end

  factory :limit_level do
    trait :restricted do
      name 'restricted'
    end

    trait :limited do
      name 'limited'
    end
  end

  factory :week do
    week_number 1
    cycle
    start_date { Date.today }
  end

  factory :category_history do
    week
    category
    association :limit_level

    trait :limited_history do
      association :category, name: 'sweets'
    end
  end

end
