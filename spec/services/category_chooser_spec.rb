require 'spec_helper'
require 'category_chooser'

# [x] returns vaild category
# [x] returns unchosen category
# [x] respects cycles/weeks
# [x] avoids same category in same week (not one cat for both restricted and limited)

# QUESIONS
# passing string/id/AR object to choose (cameron says string)
# bad to test for two things in a test, if yes, how do you join common logic
# should we unit test all of our private chooser methods?

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
    categories = create(:category, 2)
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

