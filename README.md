# RdSales

The purpose of the gem is to integrate to SalesForce through rest api

## Installation

Add this line to your application's Gemfile:

    gem 'rd_sales', git: 'https://github.com/thalessr/rd_sales.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rd_sales

##Testing
 Run the command rake spec

## Usage
Write the following code into your ApplicationController
```ruby
   #callback
   before_action :setup_api
   def setup_api
     begin
       api = RdSales::API.new('client_secret', 
                               "client_id",
                               'username',
                               'password')
       @token = api.get_token
     rescue => e
       flash.now[:alert] = 'There was a problem connecting to SalesForce api'
     end
     @token
    end
```
##Adding a Lead
````Ruby
@lead = RdSales::Client.new
#fill out the Lead fields (skipping these steps)
action = RdSales::Action.new(@token, @lead)
action.json_post(@lead.to_json)

````

Rails app using this gem can be seen at https://github.com/thalessr/rd_example

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rd_sales/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
