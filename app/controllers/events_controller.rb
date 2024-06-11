class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @backCounter = 0
    @events = Event.all.order(:created_at)
    @vaults = Vault.all.order(:created_at)
    @users = User.all
    @donations = Donation.all
  end

  def show
    @event = Event.find(params[:id])
    @donation = Donation.new
    @users = User.all
    @attendee = Attendee.new
    @existed_attendee = Attendee.find_by(event: @event, user: current_user)
    # @attendees = Attendee.all
    @attendees = Attendee.select { |att| att.event_id == @event.id}
    @markers = {     # necessary for mapbox
        lat: @event.latitude,
        lng: @event.longitude
      }
  end

  def new
    @vaults = Vault.all
    @event = Event.new
  end

  def create
    if current_user
      @event = Event.new(event_params)
      @event.user = current_user
      if @event.save
        redirect_to event_path(@event)
      else
        render :new, notice: 'apologies, the form was not correctly filled in.'
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :address, :description, :goal_amount, :vault_id, :photo, :markers, :opening_date)
  end

end
