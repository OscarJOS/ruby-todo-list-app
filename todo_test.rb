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

  # def test_it_prints_items_in_array
  #   @todos = ["wash clothes", "cook dinner"]
  #   get '/'
  #   assert last_response.ok?
  #   assert_equal "cook dinner", last_response.body
  # end
end
