require 'spec_helper'

feature 'Categories are correctly chosen for a whole cycle' do

  background do
    create(:limit_level, :restricted)
    create(:limit_level, :limited)
  end

  scenario 'starting a new cycle with no history' do
    list = create_list(:category, 2)

    CategoryChooser.choose(:restricted)
    CategoryChooser.choose(:limted)

    visit root_path
    expect(page).to have_content list.first.name
    expect(page).to have_content list.last.name
  end

  scenario 'the cycle after 2 weeks'

  scenario 'the start of the second cycle'
end
