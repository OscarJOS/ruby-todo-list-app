require "sinatra"
require "sinatra/reloader"
require "uri"

TODOS = []

get "/" do
  erb :index
end
