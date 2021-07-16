class ResponsesController < ApplicationController
  def create
    @event_id = params[:event_id]
    @response = Response.new
    @response.event_id = @event_id.to_i
    @response.user_id = current_user.id
    @response.save
    redirect_to "event/#{@event_id}"
  end
end
