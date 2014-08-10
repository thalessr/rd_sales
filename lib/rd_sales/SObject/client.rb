module RdSales
	class Client
		attr_accessor :name, :last_name, :email, :company, :job_tile, :phone, :website

		def to_json
			{
				'FirstName' => @name, 
				'LastName'  => @last_name,
				'Email'     => @email,
				'Company'   => @company,
				'Phone'     => @phone,
				'Title'     => @job_tile,
				'Website'   => @website

			}.to_json
		end

		def path
			"Lead/"
		end
	end
end