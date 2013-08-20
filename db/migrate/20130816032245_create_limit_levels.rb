class CreateLimitLevels < ActiveRecord::Migration
  def change
    create_table :limit_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
