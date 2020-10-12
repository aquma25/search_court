RSpec.configure do |config|

  # jsを使用するsystem specの場合はchromeのヘッドレスドライバを使用するよう設定
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end

  # jsを使用しないテストの場合は、高速なRack::Testドライバを使用
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
end