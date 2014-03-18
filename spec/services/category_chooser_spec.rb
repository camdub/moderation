require 'spec_helper'
require 'category_chooser'

=begin
diagram of data model -
 https://www.lucidchart.com/documents/view/42f01c50-5327-3592-b940-68330a00520b

Test Cases
  ☑ get current cycle: select weeks where cycle.active = true
    ☑ if week_number == # of categories start a new cycle
      else cont
    ☑ create new week
  ☑ get list of unchosen categories [1,2] - []
  ☑ create catHist with current week and random cat
  ☐ do same for both limit levels, ensuring both are not equal
=end

describe CategoryChooser do

  let!(:limited) { create(:limit_level, :limited) }
  let!(:restricted) { create(:limit_level, :restricted) }

  describe '.choose' do

    it 'starts a new cycle if all categories have been chosen' do
      curr = Cycle.new_cycle
      categories = create_list(:category, 4)
      categories.each_with_index do |c, i|
        w = create(:week, week_number: i+1, cycle: curr)
        create(:category_history, limit_level: restricted, week: w, category: c)
      end
      CategoryChooser.choose
      expect(Cycle.get_active).to_not eq curr
    end

    it 'creates a new category history in correct cycle' do
      curr = Cycle.new_cycle
      categories = create_list(:category, 4)
      w = create(:week, week_number: 1, cycle: curr)
      create(:category_history, limit_level: restricted, week: w, category: categories.sample)
      create(:category_history, limit_level: limited, week: w, category: categories.sample)

      CategoryChooser.choose
      histories = CategoryHistory.current_cycle.where(limit_level: restricted)
      expect(histories.count).to eq 2
    end

    it 'does not pick the same category for limit levels' do
      curr = Cycle.new_cycle
      categories = create_list(:category, 2)
      CategoryChooser.choose

      histories = CategoryHistory.current_cycle.map { |c| c.category.name }
      expect(histories.first).to_not eq histories.last
    end
  end

  describe '.get_unused_categories' do
    it 'returns all categories for a new cycle' do
      create_list(:category, 4)
      curr = Cycle.new_cycle
      expect(CategoryChooser.get_unused_categories(restricted).length).to eq 4
    end

    it 'returns a category that hasn\'t been chosen' do
      curr = Cycle.new_cycle
      week = create(:week, week_number: 1, cycle: curr)
      categories = create_list(:category, 4)
      create(:category_history, limit_level: restricted, week: week, category: categories.sample)

      c = CategoryChooser.get_unused_categories(restricted)
      expect(c.length).to eq 3
    end
  end
end

