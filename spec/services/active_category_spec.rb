require 'spec_helper'

describe ActiveCategory do
  describe '#restricted' do
    
    let(:categories) { FactoryGirl.create_list(:category, 2).map { |c| c.name } }
    let(:active_category) { ActiveCategory.new }

    it 'returns the what category is currently restricted' do
      expect(categories).to include(active_category.restricted)
    end

    it 'returns the category that is currently limited' do
      expect(categories).to include(active_category.limited)
    end
  end
end