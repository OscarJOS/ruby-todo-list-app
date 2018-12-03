ENV['RACK_ENV'] = 'test'

require './todo'
require 'test/unit'
require 'rack/test'

class ToDoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_prints_empty_array
    get '/'
    assert last_response.ok?
    assert_equal "[]\n", last_response.body
  end
end
