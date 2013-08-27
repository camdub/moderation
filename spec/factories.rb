require 'factory_girl'

FactoryGirl.define do
  factory :category do
    name   'meat'
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
    cycle 1
    start_date { Date.today }
  end

  factory :category_history do
    factory :restricted_history do
      association :limit_level, :restricted
      category
      week
    end

    factory :limited_history do
      association :limit_level, :limited
      association :category, name: 'sweets'
      week
    end
  end

end
