class CreateCategoryHistories < ActiveRecord::Migration
  def change
    create_table :category_histories do |t|
      t.references :week
      t.references :limit_level
      t.references :category

      t.timestamps
    end
  end
end
