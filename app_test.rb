ENV["RACK_ENV"] = "test"

require "./app"
require "test/unit"
require "rack/test"

class ToDoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    App
  end

  def test_it_adds_item_to_todo_list
    get "/"
    assert last_response.body.include?("Make tea")
  end
  #
  # def test_it_edits_item_in_todo_list
  #   post "/todos/", :todo => "Buy food"
  #   put "/todos/1/edit", :edit_todo => "Get milk"
  #   get "/"
  #   assert last_response.body.include?("Get milk")
  # end

  def test_it_deletes_item_in_todo_list
    post "/todos/", :todo => "Buy Sugar"
    delete "/todos/1"
    get "/"
    assert !last_response.body.include?("Buy Sugar")
  end

  # def test_it_marks_item_as_completed
  #   put "/todos/0/complete"
  #   get "/"
  #   assert last_response.body.include?('<p class="todo completed">Make tea')
  # end
  #
  # def test_it_marks_item_as_incomplete
  #   put "/todos/0/incomplete"
  #   get "/"
  #   assert last_response.body.include?('<p class="todo incomplete">Make tea')
  # end

  # def test_it_clears_completed_todos
  #   post "/add_todo", :todo => "Go shopping"
  #   post "/complete_todo", :index => "1"
  #   post "/complete_todo", :index => "2"
  #   post "/clear_completed_todos"
  #   get "/"
  #   assert last_response.body.include?('Your to-do list is empty')
  # end

end
