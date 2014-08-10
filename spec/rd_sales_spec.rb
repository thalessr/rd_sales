require 'spec_helper'
   
describe RdSales do
	before do
		@api = RdSales::API.new('client_secret', 
		              "client_id",
		              'username',
		              'password')
		@lead = RdSales::Client.new
		@lead.name = "Test"
		@lead.last_name = "Test"
		@lead.company = "rspec"
		@action = RdSales::Action.new(@api.get_token, @lead)
	end

	it "should provide a token" do
		expect(@api.get_token).not_to be_nil
	end

	it "should build a valid url" do
		expect(@action.get_url).not_to be_nil
	end

	it "should add new sobject" do
		response = @action.json_post(@lead.to_json)
		success = JSON.parse(response)["success"]
		expect(success).to be true
	end

end