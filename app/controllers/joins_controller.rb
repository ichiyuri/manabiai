class JoinsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    event = Event.find(params[:event_id])
    current_user.join(event)
    flash[:success] = 'Joinしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.unjoin(event)
    flash[:success] = 'Joinを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end