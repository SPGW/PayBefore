class AddDateToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :opening_date, :string
  end
end
