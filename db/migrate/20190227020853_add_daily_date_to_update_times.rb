class AddDailyDateToUpdateTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :update_times, :daily_date, :date
  end
end
