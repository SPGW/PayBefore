class VaultsController < ApplicationController
  def show
    @vault = Vault.find(params[:id])
  end
end
