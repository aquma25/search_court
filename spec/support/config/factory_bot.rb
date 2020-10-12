require 'factory_bot'

RSpec.configure do |config|
  # テストデータの呼び出しを簡略化
  config.include FactoryBot::Syntax::Methods

  # 毎回全てのexample実行前にfactory_botを読み込ませる
  config.before :all do
    FactoryBot.reload
  end
end