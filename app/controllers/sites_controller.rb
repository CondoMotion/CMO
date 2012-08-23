class SitesController < ApplicationController
  before_filter :authenticate_user!, :except => :show

  layout :resolve_layout

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find_by_subdomain!(request.subdomain)
    if user_signed_in?
      @role = @site.memberships.find_by_user_id(current_user.id).role
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        @membership = Membership.new({:site_id => @site.id, :user_id => current_user.id, :role_id => 1})
        @membership.save
        format.html { redirect_to root_url(subdomain: @site.subdomain), notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private

    def resolve_layout 
      case action_name
      when "show"
        "site"
      else
        "dashboard"
      end
    end

end
