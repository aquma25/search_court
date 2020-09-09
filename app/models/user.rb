class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # DB Relations
  has_many :court_members, dependent: :destroy
  has_many :play_grounds, through: :court_members

  # Validation
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i # 半角英数字のみ
  validates :nick_name, presence: true, length: { maximum: 8 }, format: { with: VALID_PASSWORD_REGEX }

  # carrierwave
  mount_uploader :image, ImageUploader

  # scopes
  scope :nick_names_own_a_court, ->(court_name){ where('territory = ?', court_name) }

  # static method
  class << self
    # TODO:loginしているユーザがadmin権限を持っているかどうか(将来的にロジック要変更)
    def admin_user?(current_user)
      current_user&.id == 1
    end

    # Userのprofile画像を表示
    def disp_prof_image(user_image = nil)
      user_image.present? ? user_image.url : "no_image.png"
    end

    # 県庁所在地のみ取得し整形する
    def select_prefecture_names
      prefecture_names = [
        "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
        "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
        "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県",
        "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
        "鳥取県", "島根県", "岡山県", "広島県", "山口県",
        "徳島県", "香川県", "愛媛県", "高知県",
        "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
      ]
      prefecture_names.zip(prefecture_names)
    end

    # ストリートコートの名前のみ取得し整形する
    def select_territory_names
      court_names = PlayGround.street_courts.map(&:court_name)
      court_names.zip(court_names)
    end
  end
end
