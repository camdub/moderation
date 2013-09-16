class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :number
      t.boolean :active

      t.timestamps
    end
  end
end
