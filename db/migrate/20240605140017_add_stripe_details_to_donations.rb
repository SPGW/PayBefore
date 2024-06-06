class AddStripeDetailsToDonations < ActiveRecord::Migration[7.1]
  def change
    add_column :donations, :payment_intent_id, :string
    add_column :donations, :is_complete, :boolean, default: false, null: false
  end
end
