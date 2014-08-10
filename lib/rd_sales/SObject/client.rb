class Client
	attr_accessor :name, :last_name, :email, :company, :job_tile, :phone, :website, :path

	def initialize
		@path = "Lead/"
	end

	def to_json
		{
			'FirstName' => @name, 
			'LastName' => @last_name,
			'Email' => @email,
			'Company' => @company

		}.to_json
	end
	
end