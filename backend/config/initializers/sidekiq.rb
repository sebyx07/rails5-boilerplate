# frozen_string_literal: true

redis_url = ENV["REDIS_URL"]
if Rails.env.development?
  redis_url += "0"
elsif Rails.env.test?
  redis_url += "1"
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

if Rails.env.development? || Rails.env.test?
  Sidekiq.redis { |conn| conn.flushdb }
end
