# frozen_string_literal: true

require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"
require_relative "./support/authentication"
require_relative "./support/parallel"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.include FactoryBot::Syntax::Methods
  config.include AuthenticationForFeatureRequest, type: :feature


  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    if example.metadata[:type] == :feature
      example.run
      DatabaseCleaner.clean_with :truncation
    else
      DatabaseCleaner.start
      example.run
      DatabaseCleaner.clean
    end
  end



  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[ no-sandbox headless disable-popup-blocking disable-gpu window-size=1280,1024]
    }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.default_driver = :chrome
Capybara.ignore_hidden_elements = false
