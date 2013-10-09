require 'mongoid/version'

Mongoid.configure do |config|
  config.connect_to("devise-test-suite")
  config.use_utc = true
  config.include_root_in_json = true
end
