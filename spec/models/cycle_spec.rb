require 'spec_helper'

describe Cycle do
  describe '.get_active' do

    before(:all) do
      @test_cycle = create(:cycle)
      @categories = create_list(:category, 2)
    end

    it 'returns the active cycle if the cycle is beginning' do
      cycle = Cycle.get_active
      expect(cycle.number).to eq(@test_cycle.number)
    end

    it 'returns the active cycle if the cycle is in progress' do
      create(:restricted_history, category: @categories.first)

      cycle = Cycle.get_active
      expect(cycle.number).to eq(@test_cycle.number)
    end

    it 'returns a new cycle instance if the previous cycle is complete' do
      week = create(:week)
      level = create(:limit_level, name: 'restricted')
      create(:category_history, week: week, limit_level: level, category: @categories.first)
      create(:category_history, week: week, limit_level: level, category: @categories.last)

      cycle = Cycle.get_active
      expect(cycle.number).to eq(@test_cycle.number + 1)
    end
  end

  describe '#get_active_week' do
    it 'active week is one week greater than the week of the last history' do
      history_week = create(:week, active: true)
      categories = create_list(:category, 2)
      level = create(:limit_level, name: 'restricted')
      create(:category_history, week: history_week, limit_level: level, category: categories.first)
      cycle = history_week.cycle

      week = cycle.get_active_week
      expect(week.start_date).to eq(history_week.start_date + 1.week)
    end
  end

end
