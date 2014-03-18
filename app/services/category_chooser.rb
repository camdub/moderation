# get cycle #
# get weeks from cycle #
# if weeks == categories, start new cycle
# if weeks == 0, just continue


class CategoryChooser
  def self.choose(limit_level)
    current = Cycle.get_active
    weeks = Week.in_cycle(current)
    if weeks == Category.count
      current = Cycle.new_cycle
    end
  end

  def self.get_unused_categories(cycle, limit)
    categories = Category.all
    if cycle.weeks.empty?
      categories
    else
      used = Category.joins(:category_histories).where(category_histories: {week_id: cycle.weeks.to_a, limit_level: limit})
      categories - used
    end
  end

end
