require "sinatra"
require "sinatra/reloader"
require_relative "newtodo"
require_relative "todolist"


class App < Sinatra::Base
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
end
