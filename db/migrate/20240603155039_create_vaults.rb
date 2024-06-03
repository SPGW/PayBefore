class CreateVaults < ActiveRecord::Migration[7.1]
  def change
    create_table :vaults do |t|
      t.float :donation_amount
      t.float :current_amount_vault
      t.string :name

      t.timestamps
    end
  end
end
