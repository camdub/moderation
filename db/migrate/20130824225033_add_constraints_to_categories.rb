class AddConstraintsToCategories < ActiveRecord::Migration
  def change
    change_column :categories, :name, :string, null: false
    change_column :categories, :active, :boolean, null: false
  end
end
