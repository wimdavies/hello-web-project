require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do
    name = params[:name]

    return "Hello #{name}!"
  end

  get '/names' do
    names = params[:names]

    return "#{names}"
  end

  post '/sort-names' do
    # names is a comma-separated string of names
    names = params[:names]

    sorted_names = names.split(",").sort.join(",")

    return sorted_names
  end

  # Request:
  # POST http://localhost:9292/sort-names

  # With body parameters:
  # names=Joe,Alice,Zoe,Julia,Kieran

  # Expected response (sorted list of names):
  # Alice,Joe,Julia,Kieran,Zoe
  
end
