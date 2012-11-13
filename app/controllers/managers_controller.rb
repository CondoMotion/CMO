class ManagersController < ApplicationController
  layout "dashboard"
  def index 
    @managers = current_user.owned_company.managers.all
  end

  def create
    if current_user
      @emails = params[:email].split(',')
      @emails.each do |email|
        current_user.owned_company.managers.create(:email => email, :password => "temporary")
      end
      redirect_to(managers_path, :notice => 'sucessfully updated user.')
    else
      redirect_to(managers_path, :notice => 'You are not authorized to do this.')
    end
  end
end
