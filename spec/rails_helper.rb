# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  # test_data
  def test_data
    @bach1 = Bachelorette.create(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')
    @bach2 = Bachelorette.create(name: 'Angel Byun', season_number: 16, season_description: 'Like Heaven and Hell')

    @pete = @bach1.contestants.create(name: 'Pilot Pete', age: 34, hometown: 'Irving, TX')
    @brandon = @bach1.contestants.create(name: 'Brandon Brandon', age: 29, hometown: 'Los Angeles, CA')
    @ben = @bach1.contestants.create(name: 'Ben Higgins', age: 32, hometown: 'Los Angeles, CA')
    @scott = @bach2.contestants.create(name: 'Scott Someone', age: 30, hometown: 'Denver, CO')

    @outing1 = Outing.create!(name: 'Helicopter Ride', location: 'Bali', date: '2019-09-12')
    @outing2 = Outing.create!(name: 'Kickball', location: 'Garden', date: '2019-09-11')
    @outing3 = Outing.create!(name: 'Hot Springs', location: 'Kyoto', date: '2019-09-14')

    @cont_out1 = ContestantOuting.create(contestant: @pete, outing: @outing2)
    @cont_out2 = ContestantOuting.create(contestant: @brandon, outing: @outing2)
    @cont_out3 = ContestantOuting.create(contestant: @ben, outing: @outing2)
    @cont_out4 = ContestantOuting.create(contestant: @pete, outing: @outing1)
    @cont_out5 = ContestantOuting.create(contestant: @ben, outing: @outing1)
    @cont_out6 = ContestantOuting.create(contestant: @ben, outing: @outing3)
  end
end
