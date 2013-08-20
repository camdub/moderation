class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_number
      t.date :start_date
      t.integer :cycle

      t.timestamps
    end
  end
end
