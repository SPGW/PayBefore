class VaultsController < ApplicationController
  def show
    @vault = Vault.find(params[:id])
    @donation = Donation.new
  end
end
