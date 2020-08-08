class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # DB Relations
  has_many :play_grounds

  # carrierwave
  mount_uploader :image, ImageUploader

  # Userのprofile画像を表示
  def self.disp_prof_image(user_image = nil)
    user_image.present? ? user_image.url : "no_image.png"
  end
end
