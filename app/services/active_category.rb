class ActiveCategory
  def restricted
    @restricted ||= get_record('restricted').name
  end

  def limited
    @limited ||= get_record('limited').name
  end

  private
  def get_record(limit_level)
    CategoryHistory.
      includes(:limit_level).
      where(limit_levels: { name: limit_level }).
      references(:limit_level)
      .first.category
  end

end