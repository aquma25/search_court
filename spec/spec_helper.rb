
require 'simplecov'
require 'vcr'

SimpleCov.start 'rails'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # focusタグがついたspecがあればそれだけ実行、なければ全spec実行する
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # specをランダム実行
  config.order = :random

  config.shared_context_metadata_behavior = :apply_to_host_groups

end

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.debug_logger = File.open("rspec_vcr.log","w")
  #config.ignoreを追記
  config.ignore_request do |request|
    request.uri == 'https://github.com/' #uriがgithubの場合は無視する
  end
  config.allow_http_connections_when_no_cassette = true
end