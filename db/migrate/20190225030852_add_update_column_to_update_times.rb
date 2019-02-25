class AddUpdateColumnToUpdateTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :update_times, :coach_play, :datetime
    add_column :update_times, :daily, :datetime
  end
end
