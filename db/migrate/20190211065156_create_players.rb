class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :full_name
      t.integer :price

      t.timestamps
    end
  end
end
