class Week < ActiveRecord::Base
  has_many :category_histories
  belongs_to :cycle

  scope :in_cycle, ->(cycle) { includes(:cycle).where(cycle: cycle) }

end
