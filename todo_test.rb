ENV['RACK_ENV'] = 'test'

require './todo'
require 'test/unit'
require 'rack/test'

class ToDoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_adds_item_to_todo_list
    post '/add_todo', :todo => 'Make tea'
    get '/'
    assert last_response.body.include?('Make tea')
  end

  def test_it_edits_item_in_todo_list
    post '/add_todo', :todo => 'Make tea'
    post '/edit_todo', :index => '1', :todo => 'Get milk'
    get '/'
    assert last_response.body.include?('Get milk')
  end

  def test_it_deletes_item_in_todo_list
    post '/add_todo', :todo => 'Buy Sugar'
    post '/delete_todo', :index => "3"
    post '/delete_todo', :index => "2"
    post '/delete_todo', :index => "1"
    get '/'
    assert last_response.body.include?('Your to-do list is empty')
  end

  def test_it_marks_item_as_completed
    post '/add_todo', :todo => 'Make tea'
    post '/complete_todo', :index => "2"
    get '/'
    assert last_response.body.include?('<p class="todo completed">2: Make tea</p>')
  end

  def test_it_marks_item_as_incomplete
    post '/incomplete_todo', :index => "2"
    get '/'
    assert last_response.body.include?('<p class="todo incomplete">2: Make tea</p>')
  end
end
