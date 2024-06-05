class Event < ApplicationRecord
  belongs_to :vault
  belongs_to :user
  has_many :attendees
  has_many :donations
end
