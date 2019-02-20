class Rename3pmToTpmAnd3paToTpaInPersonalResords < ActiveRecord::Migration[5.2]
  def change
    rename_column :personal_records, '3pm', :tpm
    rename_column :personal_records, '3pa', :tpa
  end
end
