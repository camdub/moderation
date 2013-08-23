class CategoryHistoriesController < ApplicationController

  before_filter :active_category, only: [:index]

  def index
  end

  def active_category
    ac ||= ActiveCategory.new
    @restricted = ac.restricted
    @limited = ac.limited
  end

end