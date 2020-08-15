class PlayGround < ApplicationRecord
  # DB Relations
  has_many :court_members
  has_many :users, through: :court_members
  has_many :images, dependent: :destroy

  # gem "geocoder"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # scopes
  scope :street_courts, ->(){ where(place: "ストリートコート") }

  # static method
  class << self
    def generate_user_address_marker(latlng, login_user)
      {
        lat: latlng[:lat],
        lng: latlng[:lng],
        picture: {
          url: "http://mt.google.com/vt/icon?color=ff004C13&name=icons/spotlight/spotlight-waypoint-blue.png",
          width:  40,
          height: 40
        },
        infowindow: "@" + login_user.nick_name + "がprofileに登録した住所です（このピンは自身にしか表示されません）"
      }
    end

    # googleMap表示時に基準となる場所の変更
    def get_criteria_latlng(marker_info, login_user)
      return marker_info if login_user.prefecture.empty? || login_user.city.empty?
      search_address = login_user.prefecture + login_user.city

      place_infos = Geocoder.search(search_address)
      return marker_info if place_infos.empty?
      place_latlng = { lat: place_infos[0].data["lat"], lng: place_infos[0].data["lon"] }
      generate_user_address_marker(place_latlng, login_user)
    end

    # 時間と分のみを表示する(ex: "19:00")
    def hm_time_format(time)
      time.strftime("%H:%M")
    end

    # 利用可能時間帯を表示する
    def utilization_time(start_time, end_time)
      return "時間指定なし" if start_time.nil? || end_time.nil?
      hm_time_format(start_time) + " ~ " + hm_time_format(end_time)
    end

    # 利用料金が必要かどうか
    def usage_fee_of_existence(usage_fee)
      usage_fee.nil? ? "なし" : usage_fee.to_s + "円"
    end

    # 利用可能な曜日はいつか
    def usage_week_of_existence(usage_week)
      usage_week.nil? ? ["毎日"] : JSON.parse(usage_week)
    end

    # 表示するコート情報を動的に返す
    def disp_court_infos(court_infos)
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

    # select_formで使用するためにデータ構造を変える
    def arrays_for_select_form
      place_array = ["ストリートコート", "体育館"]
      status_array = ["活発", "普通"]
      weeks = ["月曜", "火曜", "水曜", "木曜", "金曜", "土曜", "日曜"]

      [convert_array_for_select_form(place_array), convert_array_for_select_form(status_array), weeks]
    end

    # select_formで使用するためにデータ構造を変える
    def convert_array_for_select_form(array)
      array.map do | ele |[ele, ele] end
    end
  end
end
