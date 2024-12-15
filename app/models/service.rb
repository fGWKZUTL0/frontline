# == Schema Information
#
# Table name: services
#
#  id            :bigint           not null, primary key
#  category_code :integer
#  name          :string
#  order_num     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Service < ApplicationRecord
  has_many :doctors, dependent: :nullify
  has_many :nurses, dependent: :nullify
  
  enum category_code: { doctor_position: 1, nurse_position: 2 }
end
