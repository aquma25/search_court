# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


PlayGround.create([
  {
    address: "東京都都渋谷区神南2-3",
    latitude: 35.6673,
    longitude: 139.695,
    court_name: "代々木公園",
    content: "ストリートの聖地。１日中ボーラー達がピックアップで盛り上がっている。外人多め。",
    place: "ストリートコート",
    status: "活発",
    release: nil,
    user_id: 1,
    nearest_station: "渋谷",
    start_time: nil,
    end_time: nil,
    usage_fee: nil,
    usage_week: nil
  },
  {
    address: "東京都世田谷区駒沢公園1-1",
    latitude: 35.6241,
    longitude: 139.663,
    court_name: "駒沢公園",
    content: "24時消灯、地面が少し位斜め。独自のローカルルール有り",
    place: "ストリートコート",
    status: "活発",
    release: nil,
    user_id: 1,
    nearest_station: "駒沢大学",
    start_time: nil,
    end_time: nil,
    usage_fee: nil,
    usage_week: nil
  },
  {
    address: "福岡県福岡市南区清水4-21-50",
    latitude: 33.5665,
    longitude: 130.421,
    court_name: "春吉中学校",
    content: "福岡ストリートガチ勢が集う。別名春吉ガッサ。",
    place: "体育館",
    status: "活発",
    release: nil,
    user_id: 1,
    nearest_station: "高宮",
    start_time: "19:00:00",
    end_time: "21:00:00",
    usage_fee: nil,
    usage_week: ["火曜", "木曜"]
  },
  {
    address: "東京都大田区南蒲田2-10-8",
    latitude: 35.5557,
    longitude: 139.725,
    court_name: "南二くすのき公園",
    content: "バスケットゴール2 台。網に囲まれている。",
    place: "ストリートコート",
    status: "普通",
    release: nil,
    user_id: 1,
    nearest_station: "京急蒲田",
    start_time: "9:00:00",
    end_time: "17:00:00",
    usage_fee: nil,
    usage_week: nil
  },
  {
    address: "神奈川県川崎市高津区二子3-15-1",
    latitude: 35.6034,
    longitude: 139.622,
    court_name: "高津スポーツセンター",
    content: "月、火はシューティング。金のみは5on5のピックアップをしている。",
    place: "体育館",
    status: "活発",
    release: nil,
    user_id: 1,
    nearest_station: "高津",
    start_time: "18:00:00",
    end_time: "21:15:00",
    usage_fee: 220,
    usage_week: ["月曜", "火曜", "金曜"]
  },
  {
    address: "神奈川県横浜市元石川町 青葉 JP 新横浜公園内新横浜元石川線高架道路下",
    latitude: 35.5121,
    longitude: 139.604,
    court_name: "新横浜公園",
    content: "屋根付きで複数ゴールあり",
    place: "ストリートコート",
    status: "活発",
    release: nil,
    user_id: 1,
    nearest_station: "小机",
    start_time: "9:00:00",
    end_time: "21:00:00",
    usage_fee: nil,
    usage_week: nil
  },
  {
    address: "福岡県福岡市西区小戸2-6-1",
    latitude: 33.596,
    longitude: 130.312,
    court_name: "小戸公園",
    content: "福岡のストリートの聖地。海が近くにあり景色が最高。少しでも雨で濡れると半端なく滑るので注意。",
    place: "ストリートコート",
    status: "普通",
    release: nil,
    user_id: 1,
    nearest_station: "姪浜",
    start_time: nil,
    end_time: nil,
    usage_fee: nil,
    usage_week: nil
  }
])