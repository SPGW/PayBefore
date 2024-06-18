class Vault < ApplicationRecord
  has_many :events
  has_many :donations
end
