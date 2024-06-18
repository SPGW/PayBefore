class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.float :goal_amount
      t.float :current_amount
      t.string :picture
      t.text :description
      t.string :location
      t.references :vault, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
