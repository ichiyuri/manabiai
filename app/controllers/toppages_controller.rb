class ToppagesController < ApplicationController
  def index
    if logged_in?
      @event = current_user.events.build  # form_for 用
      @events = Event.order(created_at: :desc).page(params[:page]).per(10)
    end
  end
end
