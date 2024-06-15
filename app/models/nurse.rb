# == Schema Information
#
# Table name: nurses
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position_id :bigint           not null
#
# Indexes
#
#  index_nurses_on_position_id  (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => services.id)
#
class Nurse < ApplicationRecord
  include UserModelModule

  belongs_to :position, class_name: 'Service', inverse_of: :nurses

  def name
    "#{self.user.family_name} #{self.user.first_name} (#{position.name})"
  end
end
