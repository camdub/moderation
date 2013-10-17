class ActiveCategory

  class << self
    def get_restricted
      get_name :restricted
    end

    def get_limited
      get_name :limited
    end

    private
    def get_name(level)
      record = get_record(level)
      record.nil? ? "" : record.category.name
    end

    def get_record(limit_level)
      CategoryHistory.joins(:week, :limit_level)
      .where(weeks: {active: true}, limit_levels: {name: limit_level}).first
    end
  end

end
