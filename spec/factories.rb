FactoryGirl.define do
  factory :category do
    name "Alcohol"
    active true
  end
  factory :category_history do
    category
  end
end
