class PlayGroundImage < Image
  belongs_to :play_ground, optional: true

  # scopes
  scope :get_images, ->(play_ground_id){ where(play_ground_id: play_ground_id).map(&:image) }
end