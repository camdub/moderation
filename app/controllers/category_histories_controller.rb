class CategoryHistoriesController < ApplicationController

  before_filter :active_category, only: [:index]

  def index
  end

  def active_category
    @restricted = ActiveCategory.get_restricted
    @limited = ActiveCategory.get_limited
  end

end