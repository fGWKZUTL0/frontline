# == Schema Information
#
# Table name: hospitals
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hospital < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :medical_records, dependent: :destroy
end
