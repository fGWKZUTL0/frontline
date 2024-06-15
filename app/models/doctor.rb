# == Schema Information
#
# Table name: doctors
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position_id :bigint           not null
#
# Indexes
#
#  index_doctors_on_position_id  (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => services.id)
#
class Doctor < ApplicationRecord
  include UserModelModule

  belongs_to :position, class_name: 'Service', inverse_of: :doctors
end
