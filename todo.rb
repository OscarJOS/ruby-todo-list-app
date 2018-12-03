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


get "/" do
  erb :index
end

get "/add_todo" do
  erb :add_todo
end

post "/create" do
  add_new_todo(params[:todo])
  redirect "/"
end
