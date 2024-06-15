class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_hospital_as_tenant, unless: :devise_controller?

  def set_hospital_as_tenant
    hospital = Hospital.find(current_user.hospital_id)
    set_current_tenant(hospital)
  end

  protected

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
end
