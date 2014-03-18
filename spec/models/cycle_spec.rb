require 'spec_helper'

describe Cycle do
  describe '.active' do
    it 'returns the number of the active cycle' do
      curr = Cycle.new_cycle
      expect(Cycle.get_active.number).to eq curr.number
    end
  end

  describe '.new_cycle' do

    before(:all) do
      @old = Cycle.new_cycle
      Cycle.new_cycle
    end

    it 'creates a new cycle where number is + 1 from last cycle' do
      expect(Cycle.get_active.number).to eq @old.number+1
    end

    it 'new cycle is the only active cycle' do
      expect(Cycle.active.count).to eq 1
      expect(Cycle.get_active.number).to_not eq @old.number
    end
  end
end
