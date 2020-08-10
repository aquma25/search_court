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

  # 時間と分のみを表示する(ex: "19:00")
  def self.hm_time_format(time)
    time.strftime("%H:%M")
  end

  # 利用可能時間帯を表示する
  def self.utilization_time(start_time, end_time)
    return "時間指定なし" if start_time.nil? || end_time.nil?
    hm_time_format(start_time) + " ~ " + hm_time_format(end_time)
  end

  # 利用料金が必要かどうか
  def self.usage_fee_of_existence(usage_fee)
    usage_fee.nil? ? "なし" : usage_fee + "円"
  end

  def self.usage_week_of_existence(usage_week)
    usage_week.nil? ? "毎日" : usage_week
  end

  def self.disp_court_infos(court_infos)
    {
      name:             court_infos&.court_name,
      time_zone:        utilization_time(court_infos&.start_time, court_infos&.end_time),
      nearest_station:  court_infos&.nearest_station + "駅",
      address:          court_infos&.address,
      place:            court_infos&.place,
      usage_fee:        usage_fee_of_existence(court_infos&.usage_fee),
      usage_week:       usage_week_of_existence(court_infos&.usage_week),
      status:           court_infos&.status,
      content:          court_infos&.content
    }
  end
end
