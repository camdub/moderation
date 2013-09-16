class Week < ActiveRecord::Base
  has_many :category_histories
  belongs_to :cycle

  scope :get_previous_week, ->{ }

  def self.create_current_week
  end
end
