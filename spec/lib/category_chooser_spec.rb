require 'spec_helper'
require 'category_chooser'

#for now, just testing for return of string; real test will be for 2 new rows in the DB with different LimitLevel IDs
#add another test for .commit
describe CategoryChooser, '.choose' do
	it 'returns one of six categories' do
    valid_categories = ['Fried Food','Caffeine']
    valid_categories.each do |category|
      FactoryGirl.create(:category, name: category)
    end 

    returned_category = CategoryChooser.choose(1) #hardcoding limit level to Restricted for now

		expect(valid_categories).to include(returned_category.name) 
	end
  it 'return a category that has not been chosen' do
    used_categories = ['Fried Food','Caffeine']
    used_categories.each do |name|
      category = FactoryGirl.create(:category, name: name)
      FactoryGirl.create(:category_history, category: category)
    end 
    unused_category = 'White Carbs'
    FactoryGirl.create(:category, name: unused_category)

    returned_category = CategoryChooser.choose(1)

    expect(returned_category.name).to eq unused_category
  end
end
