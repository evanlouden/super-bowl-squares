require 'capybara/rspec'

Capybara.server = :puma, { Silent: true }
Capybara.default_max_wait_time = 5

begin
  Capybara.javascript_driver = :selenium_chrome_headless
rescue StandardError
  # if selenium or chrome driver not available, tests can still run with :rack_test
end

RSpec.configure do |config|
  config.include Capybara::DSL, type: :feature
end
