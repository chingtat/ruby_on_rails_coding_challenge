# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require 'test/unit'
require_relative '../app'
require 'json'

class AppSpec < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # Test the response body being an ics file which is a string type
  def test_root
    get '/'
    assert last_response.ok?
    assert_equal String, last_response.body.class
  end
end
