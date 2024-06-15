class AddHospitalIdToPatient < ActiveRecord::Migration[7.1]
  def change
    add_reference :patients, :hospital, null: false, foreign_key: true
  end
end
