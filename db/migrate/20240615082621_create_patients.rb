class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :family_name
      t.string :first_name
      t.date :born_date
      t.references :doctor, null: false, foreign_key: { to_table: :users}
      t.references :nurse, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
