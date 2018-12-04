require "sinatra"
require "sinatra/reloader"
require "uri"

class ToDoList
  attr_accessor :todos

  def initialize
    @todos = []
  end

  def add_new_todo(todo)
    newtodo = NewToDo.new(todo)
    @todos << newtodo.new_todo
  end

  def edit_todo(index, todo)
    item_index = index.to_i - 1
    @todos[item_index][:todo] = todo
  end

  def delete_todo(index)
    item_index = index.to_i - 1
    @todos.delete_at(item_index)
  end

  def complete_todo(index)
    item_index = index.to_i - 1
    @todos[item_index][:completed] = true
  end

  def incomplete_todo(index)
    item_index = index.to_i - 1
    @todos[item_index][:completed] = false
  end
end


class NewToDo
  attr_accessor :todo, :completed

  def initialize(todo)
    @todo = todo
    @completed = false
  end

  def new_todo
    {
      todo: @todo,
      completed: @completed
    }
  end
end


TODOS = ToDoList.new

get "/" do
  erb :index
end

get "/add_todo" do
  erb :add_todo
end

post "/add_todo" do
  TODOS.add_new_todo(params[:todo])
  redirect "/"
end

get "/edit_todo" do
  erb :edit_todo
end

post "/edit_todo" do
  TODOS.edit_todo(params[:index], params[:todo],)
  redirect "/"
end

get "/delete_todo" do
  erb :delete_todo
end

post "/delete_todo" do
  TODOS.delete_todo(params[:index])
  redirect "/"
end

get "/complete_todo" do
  erb :complete_todo
end

post "/complete_todo" do
  TODOS.complete_todo(params[:index])
  redirect "/"
end

get "/incomplete_todo" do
  erb :incomplete_todo
end

post "/incomplete_todo" do
  TODOS.incomplete_todo(params[:index])
  redirect "/"
end

get "/view_completed_todos" do
  erb :view_completed_todos
end

get "/view_incomplete_todos" do
  erb :view_incomplete_todos
end
