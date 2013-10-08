class Attendee
    attr_accessor :first_name, 
                  :last_name, 
                  :email, 
                  :home_phone,
                  :street, 
                  :city, 
                  :state, 
                  :zipcode

  def initialize(data)
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @email      = data[:email]
    @home_phone = data[:home_phone]
    @street     = data[:street]
    @city       = data[:city]
    @state      = data[:state]
    @zipcode    = data[:zipcode]
  end


end
