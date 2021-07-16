class OrganizationsController < ApplicationController
  def show
    org_id = params[:id].to_i
    @org = Organization.find_by_id(org_id)
    @events = Event.where(org_id: org_id)
    current_user_org = Organization.find_by_name(current_user.organization).id
    @works_here = false
    if current_user_org == org_id
      @works_here = true
      print("works here\n")
    end
  end

  def index
    @organizations = Organization.all
  end
end
