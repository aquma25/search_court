class PlayGround < ApplicationRecord

  # 現環境からpathを判断する
  # @param [String] "development" or "production"
  def self.convert_env_to_path(env)
    case env
    when "development"
      "localhost:3000"
    when "production"
      "18.177.66.221"
    end
  end
end
