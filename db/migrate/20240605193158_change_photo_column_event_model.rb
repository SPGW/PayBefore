class ChangePhotoColumnEventModel < ActiveRecord::Migration[7.1]
  change_table :events do |t|
    t.rename :picture, :photo
  end
end
