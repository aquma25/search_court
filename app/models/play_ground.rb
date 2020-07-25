class PlayGround < ApplicationRecord
  # relation
  belongs_to :user

  # gem "geocoder"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
