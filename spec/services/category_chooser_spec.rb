require 'spec_helper'
require 'category_chooser'

=begin
diagram of data model -
 https://www.lucidchart.com/documents/view/42f01c50-5327-3592-b940-68330a00520b

Test Cases
  - get current cycle: select weeks where cycle.active = true
    - set week.active = false
    - if week_number == # of categories start a new cycle
      else cont
    - create new week and set to active
  - get list of unchosen categories [1,2] - []
  - create catHist with current week and random cat
  - do same for both limit levels, ensuring both are not equal
=end

describe CategoryChooser, '.choose' do

  let(:limited) { create(:limit_level, :limited) }
  let(:restricted) { create(:limit_level, :restricted) }

  it 'returns one of six categories' do
    valid_categories = create_list(:category, 2)

    returned_category = CategoryChooser.choose(limited.name)

    expect(valid_categories).to include(returned_category)
  end

  it 'return a category that has not been chosen' do
    used_categories = create_list(:category, 3)
    used_categories.take(2).each do |category|
      create(:category_history, category: category)
    end

    unused_category = used_categories.last
    returned_category = CategoryChooser.choose(limited.name)

    expect(returned_category).to eq unused_category
  end

  it 'returns any category at the start of a new cycle' do
    categories = create_list(:category, 2)
    histories = {}
    categories.each_with_index do |category, idx|
      histories[idx] = create(:category_history, category: category)
    end
    new_category = CategoryChooser.choose(limited.name)

    # expect histories[0].cycle == histories[1].cycle
    # expect histories[0].cycle + 1 == histories[new].cycle
  end

  it 'start of new cycle allows all categories to be chosen' do
    categories = create_list(:category, 2)
    histories = {}
    categories.each_with_index do |category, idx|
      histories[idx] = create(:category_history, category: category)
    end
    new_category = CategoryChooser.choose(limited.name)

    # expect categories.include? new_category
  end

  it 'does not choose the same category for differnt levels in the same week' do
    categories = create_list(:category, 2)
    limited_category = CategoryChooser.choose(limited.name)
    restricted_category = CategoryChooser.choose(restricted.name)

    # expect limited_category != restricted_category
  end
end

