class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
	 dashboard_path
	end

	layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'edit'
      "dashboard"
    else
      "application"
    end
  end
end
