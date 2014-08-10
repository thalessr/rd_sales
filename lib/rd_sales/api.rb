module RdSales
	class API
		attr_accessor :client_secret, :client_id, :username, :password
        
        def initialize(client_secret, client_id, username, password)
        	@params = {
					:client_id => client_id,
					:client_secret => client_secret, 
					:grant_type => 'password',
					:username => username,
					:password => password
    		     }
        end

        def get_token
        	url = URI("https://login.salesforce.com/services/oauth2/token")
        	url.query = URI.encode_www_form(@params)
	        req = Net::HTTP::Post.new(url)
	        token = send(req,url) 
	        token
        end

		def send(req, url)
			connection = Net::HTTP.new(url.host, url.port)
			if url.scheme == 'https' || url.port == 443
				connection.use_ssl = true
				connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end
			res = connection.start {|http| http.request(req) }
			puts "#{res.code} - #{res.message}"
			res.body
		end

	end
end