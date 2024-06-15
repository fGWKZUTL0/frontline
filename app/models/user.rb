# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  family_name            :string
#  first_name             :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_model_type        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  hospital_id            :bigint           not null
#  user_model_id          :bigint           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_hospital_id           (hospital_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_user_model_id         (user_model_id)
#
# Foreign Keys
#
#  fk_rails_...  (hospital_id => hospitals.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  belongs_to :hospital
  accepts_nested_attributes_for :hospital
  DELEGATED_TYPES = %w(Doctor Nurse)
  delegated_type :user_model, types: DELEGATED_TYPES, dependent: :destroy
  accepts_nested_attributes_for :user_model
  delegate :name, to: :user_model

  attribute :password, default: -> { Devise::Encryptor.digest(::User, SecureRandom.urlsafe_base64) }

  validates :family_name, :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.user_model_delegated_type_options
    DELEGATED_TYPES.map do |type|
      [I18n.t("activerecord.models.#{type.underscore}"), type]
    end
  end
end
