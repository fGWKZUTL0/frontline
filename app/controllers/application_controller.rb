class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_hospital_as_tenant, unless: :devise_controller?

  protected
    def set_hospital_as_tenant
      hospital = Hospital.find(current_user.tenant_id)
      set_current_tenant(hospital)
      TenantLevelSecurity.current_tenant_id { hospital.id }
    end

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
end
