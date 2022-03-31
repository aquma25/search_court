source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem "actionview"
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'mini_racer', platforms: :ruby
# gem 'redis', '~> 4.0'
# gem 'bcrypt'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'  # bin/rspecでrspec実行可能
  gem 'pry-byebug'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'launchy' # featureテスト中にsave_and_open_pageを記載することで、キャプチャのHTMLを自動で開くことが出来る
  gem 'shoulda-matchers',
    git: 'https://github.com/thoughtbot/shoulda-matchers.git',
    branch: 'rails-5' # リッチなマッチャが使用できるようにする
  gem 'vcr' # API呼び出し時に、一回目の呼び出しを記録して、次回以降は記録されたレスポンスを返してくれる
  gem 'webmock' # vcrの処理時に水面下で利用されるHTTPスタブ化ライブラリ
  gem 'simplecov' # コードカバレッジ解析ツール(何％終わったかを計測したHTMLファイルを作成する)
end

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'

  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :production do
  gem 'unicorn'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Add Gems
gem 'dotenv-rails'
gem 'jquery-rails'

# GoogleMap
gem 'geocoder'
gem 'gmaps4rails'

# login機能
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'

# GoogleでのSNS認証
gem 'omniauth'
gem 'omniauth-google-oauth2'

gem 'carrierwave'
gem 'mini_magick'
gem 'http'