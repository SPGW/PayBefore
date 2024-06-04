class PagesController < ApplicationController
  def home
    @vaults = Vault.all
  end
end
