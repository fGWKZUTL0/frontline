class ChangeColumnToHospitalId < ActiveRecord::Migration[7.1]
  def up
    rename_column :users, :hospital_id, :tenant_id
    rename_column :patients, :hospital_id, :tenant_id
    rename_column :medical_records, :hospital_id, :tenant_id

    create_policy :users
    create_policy :patients
    create_policy :medical_records
  end

  def down
    remove_policy :users
    remove_policy :patients
    remove_policy :medical_records

    rename_column :users, :tenant_id, :hospital_id
    rename_column :patients, :tenant_id, :hospital_id
    rename_column :medical_records, :tenant_id, :hospital_id
  end
end
