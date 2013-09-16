# create_week = to create a new week:
  # get_current_week
  # get_cycle_weeks(current_week.cycle)
  # array of weeks == categories.count
    # safety check on start_date vs current date
  # if equal, then create a new week AND a new cycle
  # if not equal, create new week in current cycle

# get_previous_week
  # get weeks sorted by start date desc and take first

# get_cycle_weeks
  # use that week.cycle to get array of all weeks in cycle

# get_cycle_history

# get_unused_categories(cycle)
  # get_cycle_history(current_week.cycle) - Category.all
  # subtract get_current_weeks_categories also

# choose
  # get_previous_week
  # next_week = create_current_week(prev_week)
  # get_unused_categories(current_week.cycle)
  # category = unused_categories.sample
  # create category history


class CategoryChooser
  def self.choose(limit_level)
    cycle = Cycle.get_active
    #week = cycle.get_active_week
    #category = get_unused_categories(current_week.cycle).sample
    #CategoryHistory.create(
    #  week: current_week,
    #  limit_level: limit_level,
    #  category: category
    #)
  end

  private
  def self.get_unused_categories(cycle)
  end

end
