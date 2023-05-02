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

  # Request:
  # GET /names

  # # Expected response (2OO OK):
  # Julia, Mary, Karim
end
