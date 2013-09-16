class AddActiveAndChosenToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :active, :boolean
    add_column :weeks, :chosen, :boolean
  end
end
