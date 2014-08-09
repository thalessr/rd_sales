class Action
	
	def initialize(url)
		@url = URI.parse(url)
	end
     

    def login(username, password)
    	url = URI("https://login.salesforce.com/services/oauth2/token")
    	params = {
    		      :client_id => "3MVG9xOCXq4ID1uFvbJ9BB6PGU7wj0spaO8mfi5Jbzo44zDffWBH9.LZGSqS7KqqCfv1N9h3OUQauNAXKKLCG",
    	          :client_secret => '4750441449194766079', 
    		      :grant_type => 'password',
    		       :username => 'thalesribeiro@salesforce.com',
    		       :password => 'n3wtesteVQpvwxGIwCqrFcPmzmbV7PzE' 
    		     }
    		     
        url.query = URI.encode_www_form(params)
        req = Net::HTTP::Post.new(url)
        req.basic_auth 'user', 'pass'
        send(req,url)
        
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
	def send(req, url)
	  connection = Net::HTTP.new(url.host, url.port)
	  if url.scheme == 'https' || url.port == 443
       connection.use_ssl = true
       connection.verify_mode = OpenSSL::SSL::VERIFY_NONE

     end
	  res = connection.start {|http| http.request(req) }
	  puts res.code
	  puts res.message
	  puts res.body
	end

end
a = Action.new("")
a.login("teste","teste")