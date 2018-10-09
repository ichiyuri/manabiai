class ToppagesController < ApplicationController
  def index
    if logged_in?
      @event = current_user.events.build  # form_for 用
      @events = current_user.events.order('created_at DESC').page(params[:page])
    end
  end
end
