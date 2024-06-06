class AddStatusToDonation < ActiveRecord::Migration[7.1]
  def change
    add_column :donations, :status, :string, default: "", null: false
  end
end
