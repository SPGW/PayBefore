class AttendeesController < ApplicationController
  def create
    if current_user
      @event = Event.find(params[:event_id])
      @attendee = Attendee.new
      @attendee.user = current_user
      @attendee.event = @event
      @attendee.save
      redirect_to event_path(@event)
    end
  end
end
