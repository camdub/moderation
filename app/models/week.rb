class Week < ActiveRecord::Base
  has_many :category_histories
  belongs_to :cycle

  scope :in_cycle, -> { includes(:cycle).where(cycle_id: Cycle.get_active) }

  def self.create_next
    weeks = self.in_cycle.order(week_number: :desc)
    cycle = Cycle.get_active
    if weeks.count == 0
      self.create(cycle: cycle, week_number: 1, start_date: Date.today)
    else
      next_num = weeks.first.week_number + 1
      self.create(cycle: cycle, week_number: next_num, start_date: Date.today)
    end
  end

end
