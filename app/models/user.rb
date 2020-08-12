class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # DB Relations
  has_many :play_grounds

  # carrierwave
  mount_uploader :image, ImageUploader

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

    # ストリートコートの名前のみ取得し整形する
    def select_territory_names
      street_court_names = PlayGround.street_court.map(&:court_name)
      street_court_names.map do | court_name |
        [court_name, court_name]
      end
    end
  end
end
