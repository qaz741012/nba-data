class CreateSubareas < ActiveRecord::Migration[5.2]
  def change
    create_table :subareas do |t|
      t.string :name
      t.integer :area_id

      t.timestamps
    end
  end
end
