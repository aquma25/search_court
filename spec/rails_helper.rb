ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

# テストに必要な外部ライブラリの読み込み
require 'simplecov'
require 'capybara/rspec'
require 'factory_bot'
require 'shoulda-matchers'
require 'vcr'
require 'spec_helper'
require 'rspec/rails'

# テスト実行前に未実行のmigrationファイルを検知して実行する
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# support/config配下のファイルを読み込み
Dir[Rails.root.join("spec/support/config/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/helper/*.rb")].each { |f| require f }

# Fakerを日本語に設定
Faker::Config.locale = :ja

RSpec.configure do |config|

  # focusタグがついたspecがあればそれだけ実行、なければ全spec実行する
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # ロードするfixtureのパスを指定
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  # ディレクトリ構成によってspec typeを自動判別する設定
  config.infer_spec_type_from_file_location!

  # spec実行後のbacktrace表示を簡素化
  config.filter_rails_from_backtrace!

end
