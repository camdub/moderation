class CategoryHistoriesController < ApplicationController

  before_filter :active_category, only: [:index]

  def index
    @category_count = Category.count
  end

  def active_category
    @restricted = ActiveCategory.get_restricted
    @limited = ActiveCategory.get_limited
  end

  def demo
    @histories = CategoryHistory.includes(:week, :category, :limit_level)
  end

  def choose
    CategoryChooser.choose
    histories = CategoryHistory.order(created_at: :desc)
    @r = histories.second
    @l = histories.first
    respond_to do |format|
        format.js {}
    end
  end

end
