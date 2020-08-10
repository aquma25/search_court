class PlayGround < ApplicationRecord
  # DB Relations
  belongs_to :user

  # gem "geocoder"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # defaultの表示の中心となるマーカー情報
  def self.default_criteria_latlng(marker_info)
    { lat: marker_info[:lat], lng: marker_info[:lng] }
  end

  # googleMap表示時に基準となる場所の変更
  def self.get_criteria_latlng(marker_info, login_user)
    _temp_user_address = login_user.address.clone
    del_num = _temp_user_address.gsub!("-", "").match(/[0-9]{1,}/).to_s
    search_address = _temp_user_address.delete(del_num)

    place_infos = Geocoder.search(search_address)
    place_infos.empty? ? default_criteria_latlng(marker_info) : { lat: place_infos[0].data["lat"], lng: place_infos[0].data["lon"] }
  end
end
