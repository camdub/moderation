class CategoryChooser
  def self.choose(limit_level)
    Category.
      includes(:category_histories).
      where("category_histories.category_id IS NULL").
      references(:category_histories).
      sample
  end
end
