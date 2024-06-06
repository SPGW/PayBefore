class PagesController < ApplicationController
  def home
    @vaults = Vault.all.order(:created_at)
  end
end
