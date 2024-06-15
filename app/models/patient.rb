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
#
# Indexes
#
#  index_patients_on_doctor_id  (doctor_id)
#  index_patients_on_nurse_id   (nurse_id)
#
class Patient < ApplicationRecord
  belongs_to :doctor
  belongs_to :nurse
end
