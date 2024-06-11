class Event < ApplicationRecord

  belongs_to :vault
  belongs_to :user
  has_many :donations
  has_many :attendees

  has_one_attached :photo

  geocoded_by :address #added by AAG for mapbox
  after_validation :geocode, if: :will_save_change_to_address? #added by AAG for mapbox
end
