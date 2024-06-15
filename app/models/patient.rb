# == Schema Information
#
# Table name: patients
#
#  id          :bigint           not null, primary key
#  born_date   :date
#  family_name :string
#  first_name  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  doctor_id   :bigint           not null
#  nurse_id    :bigint           not null
#  tenant_id   :bigint           default(3), not null
#
# Indexes
#
#  index_patients_on_doctor_id  (doctor_id)
#  index_patients_on_nurse_id   (nurse_id)
#  index_patients_on_tenant_id  (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (tenant_id => hospitals.id)
#
class Patient < ApplicationRecord
  belongs_to :doctor
  belongs_to :nurse
  belongs_to :hospital, foreign_key: :tenant_id
  multi_tenant :tenant
  has_many :medical_records, dependent: :destroy

  def name
    "#{family_name} #{first_name}"
  end
end
