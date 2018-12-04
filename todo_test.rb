ENV['RACK_ENV'] = 'test'

require './todo'
require 'test/unit'
require 'rack/test'

class ToDoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # def test_it_shows_index_page
  #   get '/'
  #   puts last_response.body
  #   assert last_response.body.include?("Let's add a new item")
  # end

  # def test_it_adds_item_to_todo_list
  #   post '/add_todo', :todo => 'Make tea'
  #   get '/'
  #   puts "***********************"
  #   puts last_response.body
  #   assert last_response.body.include?('Make tea')
  # end

  def test_it_edits_item_in_todo_list
    post '/add_todo', :todo => 'Make tea'
    post '/edit_todo', :index => '1', :todo => 'Get milk'
    get '/'
    puts "***********************"
    puts last_response.body
    assert last_response.body.include?('Get milk')
  end


end
