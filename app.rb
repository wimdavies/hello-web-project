require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  get '/' do
    # The code here is executed when a request is received and we need to 
    # send a response. 

    # We can return a string which will be used as the response content.
    # Unless specified, the response status code will be 200 (OK).
    return 'Hiiiiii!'
  end

  get '/hello' do
    name = params[:name]

    return "Hello #{name}"
    # Request:
    # GET /hello?name=Leo
    # Expected response (200 OK):
    # Hello Leo
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: '#{message}'"

    # Request:
    # POST /submit

    # # With body parameters:
    # name=Leo
    # message=Hello world

    # # Expected response (2OO OK):
    # Thanks Leo, you sent this message: "Hello world"
  end

  post '/posts' do
    title = params[:title]

    return "Post entitled #{title} was created"
  end
end
