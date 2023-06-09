require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # The erb method takes the view file name (as a Ruby symbol)
    # and reads its content so it can be sent 
    # in the response.
    return erb(:index)
  end

  get '/hello' do
    return erb(:hello)
  end

  get '/names' do
    names = params[:names]

    return "#{names}"
  end

  post '/sort-names' do
    names = params[:names]

    sorted_names = names.split(",").sort.join(",")

    return sorted_names
  end
end
