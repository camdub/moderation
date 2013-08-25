class ActiveCategory
  def initialize
  end

  def restricted
    Category.first.name
  end

  def limited
    Category.first.name
  end
end