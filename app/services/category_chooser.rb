class CategoryChooser
  def self.choose
    if Week.in_cycle.count == Category.count
      Cycle.new_cycle
    end
    new_week = Week.create_next
    rcat = get_unused_categories(LimitLevel.restricted).sample
    lcats = get_unused_categories(LimitLevel.limited) - [rcat]

    CategoryHistory.create([{
      week: new_week,
      limit_level: LimitLevel.restricted,
      category: rcat
    },{
      week: new_week,
      limit_level: LimitLevel.limited,
      category: lcats.sample
    }])
  end

  def self.get_unused_categories(limit)
    categories = Category.all
    cycle = Cycle.get_active
    if cycle.weeks.empty?
      categories
    else
      used = Category.joins(:category_histories).where(category_histories: {week_id: cycle.weeks.to_a, limit_level_id: limit})
      categories - used
    end
  end

end
