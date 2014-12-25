require 'rubygems'
require 'factory_girl'

RSpec.configure do |config|
  Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
end
