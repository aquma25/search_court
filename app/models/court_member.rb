class CourtMember < ApplicationRecord
  belongs_to :user
  belongs_to :play_ground
end
