ENV['RACK_ENV'] = 'test'

require './todo'
require 'test/unit'
require 'rack/test'

class ToDoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # def test_it_prints_empty_array
  #   get '/'
  #   assert last_response.ok?
  #   assert_equal "[]\n", last_response.body
  # end

  # def test_it_shows_index_page
  #   get '/'
  #   puts last_response.body
  #   assert last_response.body.include?("Let's add a new item")
  # end

  def test_it_adds_item_to_todo_list
    post '/add_todo', :todo => 'Make tea'
    get '/'
    puts "***********************"
    puts last_response.body
    assert last_response.body.include?('Make tea')
  end


end
