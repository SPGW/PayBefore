class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :event, optional: true
  belongs_to :vault, optional: true


  validates :contribution, presence: true
end
