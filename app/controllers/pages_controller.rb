class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  require 'date'

  def home
    @events = Event.all.order(:created_at)
    @vaults = Vault.all.order(:created_at)
    @donations = Donation.all.order(:created_at)
    @successful_events = Event.select { |e| e.current_amount > e.goal_amount   &&  Date.parse(e.opening_date) < Date.today}
  end

  def dashboard
    @user_devise = current_user
    # filter only the events where the user_id: is equal to the current_user.id and ordering by created_at
    @events = Event.where(user_id: current_user.id).order(:created_at)

    # DONATIONS EVENTS
    # filter only where the user_id is equal to the current_user_id AND the status is 'succeeded'
    @donations_events = Donation.where(user_id: current_user.id, status: 'succeeded').where.not(event_id: nil).order(:created_at)

    # DONATIONS VAULTS
    # filter only where the user_id is equal to the current_user_id AND the status is 'succeeded'
    @donations_vaults = Donation.where(user_id: current_user.id, status: 'succeeded').where.not(vault_id: nil).order(:created_at)

    @attendees = Attendee.where(user_id: current_user.id).order(:created_at)

    # sum of all donations made by the user
    @donation_sum = Donation.where(user_id: current_user.id, status: 'succeeded').sum(:contribution)

    # sum of all donations donated to the user's events
    @contribution_sum = @events.sum(:current_amount)
  end
end
