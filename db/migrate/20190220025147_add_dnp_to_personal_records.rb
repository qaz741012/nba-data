class AddDnpToPersonalRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :personal_records, :dnp, :string
  end
end
