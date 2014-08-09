require "net/http"
class Action
	def initialize(url)
		@url = URI.parse(url)
		send()
	end
    #create
	def json_post(json)
		request = get_request(Net::HTTP::Post.new(@url.path))
		request.body = json
		send
	end
    #update
	def json_patch(json)
		request = get_request(Net::HTTP::Patch.new(@url.path))
		request.body = json
		send
	end

	def json_delete(json)
		request = get_request(Net::HTTP::Delete.new(@url.path))
		request.body = json
		send
	end

	private
	def get_request(req)
		req["Content-Type"] = "application/json"
		req["Accept"] = "application/json"
		req
	end

	private 
	def send(req)
	  connection = Net::HTTP.new(@url.host, @url.port)
	  res = connection.start {|http| http.request(req) }
	  puts res.message
	end

end