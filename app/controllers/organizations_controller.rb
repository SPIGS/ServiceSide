class OrganizationsController < ApplicationController
  def show
    org_id = params[:id].to_i
    @org = Organization.find_by_id(org_id)
    @events = Event.where(org_id: org_id)
    current_user_org = -10000
    if !current_user.organization.blank?
      current_user_org = Organization.find_by_name(current_user.organization).id
    end
    @works_here = false
    if current_user_org == org_id
      @works_here = true
    end
  end

  def index
    @organizations = Organization.all
  end
end
