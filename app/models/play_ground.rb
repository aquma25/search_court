class PlayGround < ApplicationRecord
  # DB Relations
  belongs_to :user

  # gem "geocoder"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.generate_user_address_marker(latlng, login_user)
    {
      lat: latlng[:lat],
      lng: latlng[:lng],
      picture: {
        url: "http://mt.google.com/vt/icon?color=ff004C13&name=icons/spotlight/spotlight-waypoint-blue.png",
        width:  40,
        height: 40
      },
      infowindow: "@" + login_user.nick_name + "がprofileに登録した住所です"
    }
  end

  # googleMap表示時に基準となる場所の変更
  def self.get_criteria_latlng(marker_info, login_user)
    _temp_user_address = login_user.address.clone
    del_num = _temp_user_address.gsub!("-", "").match(/[0-9]{1,}/).to_s
    search_address = _temp_user_address.delete(del_num)

    place_infos = Geocoder.search(search_address)
    return marker_info if place_infos.empty?
    place_latlng = { lat: place_infos[0].data["lat"], lng: place_infos[0].data["lon"] }
    generate_user_address_marker(place_latlng, login_user)
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
    usage_fee.nil? ? "なし" : usage_fee.to_s + "円"
  end

  # 利用可能な曜日はいつか
  def self.usage_week_of_existence(usage_week)
    usage_week.nil? ? "毎日" : usage_week.to_s
  end

  # 表示するコート情報を動的に返す
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
