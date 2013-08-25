require 'factory_girl'

FactoryGirl.define do
  factory :category do
    name   'meat'
    active true
  end

  factory :limit_level do

  end

  factory :week do
  end

  factory :category_history do
    category
    limit_level
    week
  end

end
