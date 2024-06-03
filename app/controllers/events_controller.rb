class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
    @events = Event.all

  end

  def new
    @event = Event.new
  end

  def create
    if current_user
      @event = Event.new(event_params)
      @event.user = current_user
      if @event.save
        redirect_to event_path(@event)
      else
        redirect_to new_user_session_path, notice: 'You are not logged in buddy.'
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:event).permit(:name, :price, :description, :category, :photo)
  end

end
