require "sinatra"
require "sinatra/reloader"
require_relative "newtodo"
require_relative "todolist"
require 'sinatra/custom_logger'
require 'logger'



class App < Sinatra::Base
  use Rack::MethodOverride
  helpers Sinatra::CustomLogger

  configure do
    logger = Logger.new(STDOUT)
    set :logger, logger
  end

  TODOS = ToDoList.new

  get "/" do
    @todos = TODOS.todos
    erb :index
  end

  post "/todos/" do
    TODOS.add_new_todo(params[:todo])
    redirect "/"
  end

  put "/todos/:id/edit" do
    TODOS.edit_todo(params[:id], params[:edit_todo],)
    redirect "/"
  end

  delete "/todos/:id" do
    TODOS.delete_todo(params[:id])
    redirect "/"
  end

  put "/todos/:id/complete" do
    TODOS.complete_todo(params[:id])
    redirect "/"
  end

  put "/todos/:id/incomplete" do
    TODOS.incomplete_todo(params[:id])
    redirect "/"
  end

  get "/view_completed_todos" do
    erb :view_completed_todos
  end

  get "/view_incomplete_todos" do
    erb :view_incomplete_todos
  end

  get "/clear_completed_todos" do
    erb :clear_completed_todos
  end

  delete "/todos/delete_all" do
    TODOS.clear_completed_todos
    redirect "/"
  end
end
