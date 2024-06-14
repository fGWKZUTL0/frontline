# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  family_name     :string
#  first_name      :string
#  user_model_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  hospital_id     :bigint           not null
#  user_model_id   :bigint           not null
#
# Indexes
#
#  index_users_on_hospital_id  (hospital_id)
#
# Foreign Keys
#
#  fk_rails_...  (hospital_id => hospitals.id)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
