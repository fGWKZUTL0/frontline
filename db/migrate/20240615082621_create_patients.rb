class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :family_name
      t.string :first_name
      t.date :born_date
      t.references :doctor, null: false
      t.references :nurse, null: false

      t.timestamps
    end
  end
end
