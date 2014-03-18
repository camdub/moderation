class CategoryHistory < ActiveRecord::Base
  belongs_to :week
  belongs_to :limit_level
  belongs_to :category

  scope :current_cycle, -> { joins(:week).where(weeks: {cycle_id: Cycle.get_active }) }
end
