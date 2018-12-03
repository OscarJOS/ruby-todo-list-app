require "sinatra"
require "sinatra/reloader"
require "uri"

TODOS = []

def add_new_todo(new_todo)
  TODOS << {
    todo: new_todo,
    completed: false
  }
end

def edit_todo(index, todo)
  item_index = index.to_i - 1
  TODOS[item_index][:todo] = todo
end


get "/" do
  erb :index
end

get "/add_todo" do
  erb :add_todo
end

post "/add_todo" do
  add_new_todo(params[:todo])
  redirect "/"
end

get "/edit_todo" do
  erb :edit_todo
end

post "/edit_todo" do
  edit_todo(params[:index], params[:todo],)
  redirect "/"
end
