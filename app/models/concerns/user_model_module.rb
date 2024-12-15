module UserModelModule
  extend ActiveSupport::Concern

  included do
    has_one :user, as: :user_model, touch: true
  end
end
