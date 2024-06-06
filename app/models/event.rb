class Event < ApplicationRecord
  belongs_to :vault
  belongs_to :user
  has_many :donations
  has_many :attendees

  has_one_attached :photo
end
