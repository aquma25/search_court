FactoryBot.define do
  factory :play_ground do
    address         { "東京都都渋谷区神南2-3" }
    latitude        { 35.6673 }
    longitude       { 139.695 }
    court_name      { "代々木公園" }
    content         { "ストリートの聖地。１日中ボーラー達がピックアップで盛り上がっている。外人多め。" }
    place           { "ストリートコート" }
    status          { "活発" }
    release         { nil }
    user_id         { 1 }
    nearest_station { "渋谷" }
    start_time      { nil }
    end_time        { nil }
    usage_fee       { nil }
    usage_week      { nil }
  end
end
