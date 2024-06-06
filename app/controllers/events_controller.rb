class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @backCounter = 0
    @events = Event.all.order(:created_at)
    @vaults = Vault.all
    @users = User.all
    @donations = Donation.all
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @donation = Donation.new
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
        render :new, notice: 'hey guy the form is not correct.'
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
    params.require(:event).permit(:name, :location, :description, :goal_amount, :vault_id, :photo)
  end

end
