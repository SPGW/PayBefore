class UpdateCurrentAmountDefaultInEvents < ActiveRecord::Migration[7.1]
  def change
    change_column_default :events, :current_amount, from: nil, to: 0.0
    change_column_default :events, :goal_amount, from: nil, to: 0.0
  end
end
