require 'spec_helper'
require 'category_chooser'

=begin
diagram of data model -
 https://www.lucidchart.com/documents/view/42f01c50-5327-3592-b940-68330a00520b

Test Cases
  ☑ get current cycle: select weeks where cycle.active = true
    ☐ set week.active = false
    ☑ if week_number == # of categories start a new cycle
      else cont
    ☐ create new week and set to active
  ☑ get list of unchosen categories [1,2] - []
  ☐ create catHist with current week and random cat
  ☐ do same for both limit levels, ensuring both are not equal
=end

describe CategoryChooser do

  let(:limited) { create(:limit_level, :limited) }
  let(:restricted) { create(:limit_level, :restricted) }

  describe '.choose' do
  end

  describe '.get_unused_categories' do
    it 'returns all categories for a new cycle' do
      create_list(:category, 4)
      curr = create(:cycle)
      expect(CategoryChooser.get_unused_categories(curr, restricted).length).to eq 4
    end

    it 'returns a category that hasn\'t been chosen' do
      curr = create(:cycle)
      week = create(:week, week_number: 1, cycle: curr)
      categories = create_list(:category, 4)
      create(:category_history, limit_level: restricted, week: week, category: categories.sample)

      c = CategoryChooser.get_unused_categories(curr, restricted)
      expect(c.length).to eq 3
    end
  end
end

