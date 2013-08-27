require 'spec_helper'

describe ActiveCategory do

  before(:all) do
    @active_category = ActiveCategory.new
  end

  describe '#restricted' do
    
    let(:restricted) { FactoryGirl.create(:restricted_history) }

    it 'returns the category that is currently restricted' do
      expect(restricted.category.name).to eq(@active_category.restricted)
    end
  end

  describe '#limited' do

    let(:limited) { FactoryGirl.create(:limited_history) }

    it 'returns the category that is currently limited' do
      expect(limited.category.name).to eq(@active_category.limited)
    end
  end

end