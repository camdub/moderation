class AddCycleIdToWeek < ActiveRecord::Migration
  def change
    rename_column :weeks, :cycle, :cycle_id
  end
end
