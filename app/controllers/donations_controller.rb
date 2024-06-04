class DonationsController < ApplicationController
  def create
    if current_user
      @donation = Donation.new(event_params) #this should set the relation of the event (show) to the donation model
      @attendee.user = current_user
      # if @attendee.save
      #   redirect_to event_path(@attendee) # this should lead to the message page
      # else
      #   redirect_to new_user_session_path, notice: 'You are not logged in buddy.'
      # end
    end
  end
end
