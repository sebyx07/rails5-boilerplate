ActiveJob::Base.queue_adapter = :test
RSpec.configure do |config|
  config.include ActiveJob::TestHelper

  config.around :example, background: true do |example|
    perform_enqueued_jobs do
      example.run
    end
  end
end
