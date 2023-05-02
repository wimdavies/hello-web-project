# POST /sort-names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

Method: POST
Path: /sort-names
Body params:
  names (comma-separated string of names)

returns: sorted list in same format

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

when `names` = `Joe,Alice,Zoe,Julia,Kieran`
```html
<!-- EXAMPLE -->
<!-- Response: 200 OK -->

Alice,Joe,Julia,Kieran,Zoe
```


## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /sort-names
body params: names: 'Will'

# Expected response:

Will
```

```
# Request:

POST /sort-names
body params: names: 'Alice,Will'

# Expected response:

Alice,Will
```

```
# Request:

POST /sort-names
body params: names 'Joe,Alice,Zoe,Julia,Kieran'


# Expected response:
Alice,Joe,Julia,Kieran,Zoe
```

```
# Request:

POST /sort-names
body params: names: 'Will,Leo,Alice,Kay'

# Expected response:

Alice,Kay,Leo,Will
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
