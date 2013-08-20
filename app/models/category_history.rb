class CategoryHistory < ActiveRecord::Base
  belongs_to :week
  belongs_to :limit_level
  belongs_to :category
end
