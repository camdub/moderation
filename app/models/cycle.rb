class Cycle < ActiveRecord::Base
  has_many :weeks
  def self.get_active
    curr_cycle = Cycle.where(active: true).first
    histories = CategoryHistory.joins(week: [:cycle])
    cycle_length = Category.count * LimitLevel.count
    if histories.count == 0 || histories.count < cycle_length
      curr_cycle
    else
      curr_cycle.active = false
      curr_cycle.save
      Cycle.create(number: curr_cycle.number+1, active: true)
    end
  end

  def get_active_week
    # get week where active is true
    week = Week.where(active: true).first
    history = CategoryHistory.where(week_id: week.id).first

    unless history.nil?
      week = Week.create(week_number: week.week_number+1, start_date: week.start_date + 1.week, cycle: self)
    end
    week
  end

end
