class AttendeesController < ApplicationController
  def create
    if current_user
      @attendee = Attendee.new(event_params) #this should set the relation of the event (show) to the attendee model
      @attendee.user = current_user
      if @attendee.save
        redirect_to event_path(@attendee)
      else
        redirect_to new_user_session_path, notice: 'You are not logged in buddy.'
      end
    end
  end
end
