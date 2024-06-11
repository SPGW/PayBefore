class ChangeEventLocationToAddress < ActiveRecord::Migration[7.1]
  change_table :events do |t|
    t.rename :location, :address
  end
end
