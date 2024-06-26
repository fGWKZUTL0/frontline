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
require "test_helper"

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
