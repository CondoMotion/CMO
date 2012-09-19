class CompaniesController < ApplicationController
	before_filter :authenticate_user!
	layout "dashboard"
  def index
  	@company = current_user.owned_company
  end	

  def create
  	@company = Company.new(params[:company])
  	@company.company_owner = current_user

  	respond_to do |format|
      if @company.save
        format.html { redirect_to dashboard_path, notice: 'Company was successfully created.' }
      else
        format.html { redirect_to dashboard_path }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	@company = Company.find(params[:id])

  	respond_to do |format|
  		if @company.update_attributes(params[:company])
  			format.html { redirect_to companies_path, notice: 'Company updated'}
  		else
  			format.html { redirect_to companies_path, notice: 'Error updating company'}
  		end
  	end
  end
end
