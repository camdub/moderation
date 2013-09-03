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
        CategoryHistory.
          includes(:limit_level, :week).
          where(limit_levels: { name: limit_level }).
          references(:limit_level).order("weeks.start_date DESC")
          .first
    end
  end

end