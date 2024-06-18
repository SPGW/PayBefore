class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.float :contribution
      t.references :event, null: false, foreign_key: true
      t.references :vault, null: false, foreign_key: true

      t.timestamps
    end
  end
end
