module RdSales
	
	class Action

		def initialize(token, sobject)
			@token = JSON.parse(token)
			@sobject = sobject
			@url = get_url
		end

	    #create
		def json_post(json)
			request = get_request(Net::HTTP::Post.new(@url.path))
			request.body = json
			send(request, @url)
		end
	    #update
		def json_patch(json)
			request = get_request(Net::HTTP::Patch.new(@url.path))
			request.body = json
			send(request, @url)
		end

		def json_delete(json)
			request = get_request(Net::HTTP::Delete.new(@url.path))
			request.body = json
			send(request, @url)
		end

		def get_url
			path = "/services/data/v" + RdSales::API_VERSION + "/sobjects/" + @sobject.path
			url = URI.parse(@token["instance_url"] + path)
			url
		end

		private
		def get_request(req)
			req["Content-Type"] = "application/json"
			req["Accept"] = "application/json"
			req["Authorization"] = "Bearer " + @token["access_token"]
			req
		end

		private 
		def send(req, url)
		  connection = Net::HTTP.new(url.host, url.port)
		  if url.scheme == 'https' || url.port == 443
	       connection.use_ssl = true
	       connection.verify_mode = OpenSSL::SSL::VERIFY_NONE

	     end
		  res = connection.start {|http| http.request(req) }
		  puts res.code
		  puts res.message
		  res.body
		end

	end
end
