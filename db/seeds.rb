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
    usage_week: "火, 木"
  }
])