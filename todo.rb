require "sinatra"
require "sinatra/reloader"
require "uri"

TODOS = []

get "/" do
  TODOS
end
