class DashboardController < ApplicationController
	before_filter :authenticate_user!
	layout "dashboard"
  def index
  	@sites = current_user.sites.all
  end	
end
