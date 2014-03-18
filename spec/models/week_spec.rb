require 'spec_helper'

describe Week do
  it { expect(subject).to have_many(:category_histories) }

  describe '.in_cycle' do

    before(:each) do
        @current = create(:cycle, active: true)
        @past = create(:cycle, active: false)
    end

    it 'returns a list of weeks of the current cycle' do
        create(:week, week_number: 1, cycle: @current)
        create(:week, week_number: 2, cycle: @current)
        create(:week, week_number: 3, cycle: @past)

        expect(Week.in_cycle(@current).length).to eq 2
    end
  end
end
