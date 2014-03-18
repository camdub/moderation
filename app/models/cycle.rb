class Cycle < ActiveRecord::Base
  has_many :weeks
  scope :active, -> { where(active: true) }

  def self.new_cycle
    a = self.active.first
    if a.nil?
      self.create(number: 1, active: true)
    else
      a.active = false
      a.save
      self.create(number: a.number+1, active: true)
    end
  end

  def self.get_active
    self.active.first
  end
end
