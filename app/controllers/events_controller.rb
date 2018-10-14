class EventsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update,:destroy ]


  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'イベントを投稿しました。'
      redirect_to root_url
    else
      @events = current_user.events.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'イベントの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = current_user.events.find_by(id: params[:id])
  end
  
  def update
    @event = current_user.events.find_by(id: params[:id])
    if @event.update(event_params)
      flash[:success] = 'イベントは正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'イベントは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @event.destroy
    flash[:success] = 'イベントを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def event_params
    params.require(:event).permit(:content , :title , :item, :start,:finish)
  end
  
  def correct_user
    @event = current_user.events.find_by(id: params[:id])
    unless @event
      redirect_to root_url
    end
  end
end