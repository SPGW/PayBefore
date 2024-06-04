class Event < ApplicationRecord
  belongs_to :vault
  belongs_to :user
end
