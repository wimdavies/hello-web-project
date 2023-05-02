# GET /names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

Method: GET
Path: /names
Query parameters: 
  names (string)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Response: 200 OK -->

name1, name2, name3
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /names?names=Julia, Mary, Karim

# Expected response:

Julia, Mary, Karim
```

```
# Request:

GET /names?names=Will, Leo

# Expected response:

Will, Leo
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
