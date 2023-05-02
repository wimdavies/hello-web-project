require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /hello" do
    it "should return 'Hello Leo!'" do
      response = get('/hello?name=Leo')

      expect(response.status).to eq 200
      expect(response.body).to eq "Hello Leo!"
    end
 
    it "should return 'Hello Will!'" do
      response = get('/hello?name=Will')

      expect(response.status).to eq 200
      expect(response.body).to eq "Hello Will!"
    end
  end


  # context "GET to /" do
  #   it "returns 200 OK with the right content" do
  #     # Send a GET request to /
  #     # and returns a response object we can test.
  #     response = get("/")

  #     # Assert the response status code and body.
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Some response data")
  #   end
  # end

  # context "POST to /submit" do
  #   it "returns 200 OK with the right content" do
  #     # Send a POST request to /submit
  #     # with some body parameters
  #     # and returns a response object we can test.
  #     response = post("/submit", name: "Dana", some_other_param: 12)

  #     # Assert the response status code and body.
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Hello Dana")
  #   end
  # end
end