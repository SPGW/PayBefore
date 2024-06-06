class AddNullToDonations < ActiveRecord::Migration[7.1]
  def change
    change_column :donations, :event_id, :integer, null: true
    change_column :donations, :vault_id, :integer, null: true
  end
end
