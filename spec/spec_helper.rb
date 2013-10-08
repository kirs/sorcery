$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["RAILS_ENV"] ||= 'test'

# require 'simplecov'
# SimpleCov.root File.join(File.dirname(__FILE__), '..', 'lib')
# SimpleCov.start

require 'rspec'

require 'rails/all'
require 'active_record'
require 'active_support'
require 'rspec/rails'
# require 'capybara/rspec'
require 'timecop'

require 'sorcery'

require "rails_app/config/environment"

# require File.join(File.dirname(__FILE__), '..','app','models','user')
# require File.join(File.dirname(__FILE__), '..','app','models','authentication')

class TestUser < ActiveRecord::Base
  # authenticates_with_sorcery!
end

class TestMailer < ActionMailer::Base

end


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include RSpec::Rails::ControllerExampleGroup, :example_group => { :file_path => /controller(.)*_spec.rb$/ }
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  #ActiveRecord::Base.logger = Logger.new(STDOUT)
  config.before(:suite) do
    ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate/core")
  end

  config.after(:suite) do
    # ActiveRecord::Migrator.rollback("#{Rails.root}/db/migrate/core")
  end

  config.include ::Sorcery::TestHelpers::Internal
  config.include ::Sorcery::TestHelpers::Internal::Rails
end
