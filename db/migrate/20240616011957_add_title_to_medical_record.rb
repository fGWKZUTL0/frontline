class AddTitleToMedicalRecord < ActiveRecord::Migration[7.1]
  def up
    remove_column :medical_records, :writing_date
    add_column :medical_records, :title, :string
  end

  def down
    add_column :medical_records, :writing_date, :date
    remove_column :medical_records, :title, :string
  end
end
