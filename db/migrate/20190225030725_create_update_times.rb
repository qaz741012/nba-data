class CreateUpdateTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :update_times do |t|

      t.timestamps
    end
  end
end
