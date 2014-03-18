class LimitLevel < ActiveRecord::Base
  has_many :category_histories

  scope :restricted, -> { where(name: 'restricted').first }
  scope :limited, -> { where(name: 'limited').first }
end
