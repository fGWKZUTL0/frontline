class CreateMedicalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_records, id: :uuid do |t|
      t.references :hospital, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.date :writing_date
      t.references :writer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
