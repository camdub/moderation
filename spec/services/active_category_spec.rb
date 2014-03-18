require 'spec_helper'

describe ActiveCategory do

  before(:all) do
    #@active_category = ActiveCategory.new
    # insert extra records (to test 'currently' chosen categories)
    #week = create(:week, start_date: Date.today - 1.weeks)
    #create(:restricted_history, week: week)
    #create(:limited_history, week: week)
  end

  describe '#restricted' do

    let(:restricted) { create(:restricted_history) }

    it 'returns the category that is currently restricted'
    #  expect(restricted.category.name).to eq(@active_category.restricted)
    #end
  end

  describe '#limited' do

    let(:limited) { create(:limited_history) }

    it 'returns the category that is currently limited'
      #expect(limited.category.name).to eq(@active_category.limited)
    #end
  end

end
