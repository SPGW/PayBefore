class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :vault
end
