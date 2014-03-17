class Week < ActiveRecord::Base
  has_many :category_histories
  belongs_to :cycle

  scope :get_current_cycle, -> { includes(:cycle).where(cycles: { active: true }) }

end
