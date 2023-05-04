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
    it "should return the greeting message as an HTML page" do
      response = get('/hello')

      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Hello!</h1>'
    end
 
    # it "should return 'Hello Will!'" do
    #   response = get('/hello?name=Will')

    #   expect(response.status).to eq 200
    #   expect(response.body).to eq "Hello Will!"
    # end
  end

  context "GET /names" do
    it "returns 'Julia, Mary, Karim'" do
      response = get('/names?names=Julia, Mary, Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end

    it "returns 'Will, Leo'" do
      response = get('/names?names=Will, Leo')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Will, Leo')
    end
  end

  context "POST /sort-names" do
    it "given 'Will', returns 'Will'" do
      response = post('/sort-names', names: "Will")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Will')
    end
    
    it "given 'Alice,Will', returns 'Alice,Will'" do
      response = post('/sort-names', names: "Alice,Will")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Will')
    end

    it "given 'Joe,Alice,Zoe,Julia,Kieran', returns 'Alice,Joe,Julia,Kieran,Zoe'" do
      response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end

    it "given 'Will,Leo,Alice,Kay', returns 'Alice,Kay,Leo,Will'" do
      response = post('/sort-names', names: "Will,Leo,Alice,Kay")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Kay,Leo,Will')
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