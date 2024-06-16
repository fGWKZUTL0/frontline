# == Schema Information
#
# Table name: medical_records
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :bigint           not null
#  tenant_id  :bigint           not null
#  writer_id  :bigint           not null
#
# Indexes
#
#  index_medical_records_on_patient_id  (patient_id)
#  index_medical_records_on_tenant_id   (tenant_id)
#  index_medical_records_on_writer_id   (writer_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#  fk_rails_...  (tenant_id => hospitals.id)
#  fk_rails_...  (writer_id => users.id)
#
class MedicalRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :writer, class_name: 'User'
  belongs_to :hospital, foreign_key: :tenant_id
  multi_tenant :tenant

  validates :title, :content, presence: true

  has_rich_text :content

  def writing_date
    I18n.l created_at unless created_at.nil?
  end
end
