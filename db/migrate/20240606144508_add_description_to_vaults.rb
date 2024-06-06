class AddDescriptionToVaults < ActiveRecord::Migration[7.1]
  def change
    add_column :vaults, :description, :text
  end
end
