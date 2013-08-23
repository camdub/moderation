require 'spec_helper'

describe ActiveCategory do
  describe '#restricted' do
    let(:categories) { ['meat', 'sweets'] }
    let(:active_category) { ActiveCategory.new }

    it 'returns the what category is currently restricted' do
      expect(categories).to include(active_category.restricted)
    end

    it 'returns the category that is currently limited' do
      expect(categories).to include(active_category.limited)
    end
  end
end