class Image < ApplicationRecord
  # carrierwave
  mount_uploader :image, ImageUploader

  # scopes
  scope :get_same_id_records, ->(snake_class_name_id, id){ where(snake_class_name_id, id) }

  # static method
  class << self

    # Imagesテーブルに紐づいているモデルの画像をSTIを使用し一括管理する
    def save_format(id, params_hash, controller_name)
      snake_class_name = controller_name.singularize # ex: "play_ground
      snake_class_name_id = snake_class_name + "_id" # ex: "play_ground_id"
      camel_class_name = snake_class_name.camelize + "Image"  # "ex: PlayGroundImage"
      camel_image_class_name = camel_class_name.constantize # ex: "PlayGroundImage"を文字列からクラス名へ

      image_array = []
      image_array << params_hash["image_first"] if params_hash["image_first"]
      image_array << params_hash["image_second"] if params_hash["image_second"]
      image_array << params_hash["image_third"] if params_hash["image_third"]
      image_array.compact

      camel_image_class_name.transaction do
        camel_image_class_name.get_same_id_records(snake_class_name_id, id).delete_all
        image_array.each do |image|
          type_hash = { image: image }
          type_hash.store(snake_class_name_id.to_sym, id)
          type_image = camel_image_class_name.new(type_hash)
          type_image.save!
        end
      rescue => e
        break
      end

      params = {}
      params_hash.delete("image_first") if params_hash["image_first"]
      params_hash.delete("image_second") if params_hash["image_second"]
      params_hash.delete("image_third") if params_hash["image_third"]
      params_hash.each { |k, v| params.store(k.to_sym, v) }
      return params
    end
  end
end