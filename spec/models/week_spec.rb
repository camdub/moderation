require 'spec_helper'

describe Week do
  it { expect(subject).to have_many(:category_histories) }

  describe '.in_cycle' do

    it 'returns a list of weeks of the current cycle' do
        @past = Cycle.new_cycle
        Week.create(week_number: 3, cycle: @past)

        @current = Cycle.new_cycle
        Week.create(week_number: 1, cycle: @current)
        Week.create(week_number: 2, cycle: @current)
        expect(Week.in_cycle.count).to eq 2
    end
  end

  describe '.create_next' do
    let (:curr) { Cycle.new_cycle }

    it 'creates week #1 if no weeks in current cycle' do
        w = Week.create_next
        expect(w.week_number).to eq 1
        expect(Week.in_cycle.count).to eq 1
    end

    it 'creates sequencial week in current cycle' do
        Week.create(week_number: 1, cycle: curr, start_date: Date.today)
        Week.create(week_number: 2, cycle: curr, start_date: Date.today)
        expect(Week.create_next.week_number).to eq 3
        expect(Week.in_cycle.count).to eq 3
    end
  end
end
