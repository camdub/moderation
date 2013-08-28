class CategoryHistoriesController < ApplicationController

  before_filter :active_category, only: [:index]

  def index
  end

  def active_category
    @restricted = 'meat'
    @limited = 'sweets'
  end

end