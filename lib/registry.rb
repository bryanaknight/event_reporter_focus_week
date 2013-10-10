require './lib/attendee'

class Registry
  attr_accessor :attendees

  def find_all_by_first_name(name)
    attendees.find_all{ |a| a.first_name.downcase == name.downcase }
  end

  def find_all_by_last_name(name)
    attendees.find_all{ |a| a.last_name.downcase == name.downcase }
  end

  def find_all_by_email(email_address)
    attendees.find_all{ |a| a.email == email_address }
  end

  def find_all_by_home_phone(phone_number)
    attendees.find_all { |a| a.home_phone.scan(/\w+/).join == phone_number.scan(/\w+/).join}
  end

  def find_all_by_street(address)
    attendees.find_all { |a| a.street == address}
  end

  def find_all_by_city(city)
    attendees.find_all { |a| a.city.downcase == city.downcase}
  end

  def find_all_by_state(state)
    attendees.find_all { |a| a.state.downcase == state.downcase}
  end  

  def find_all_by_zipcode(zipcode)
    attendees.find_all { |a| a.zipcode == zipcode}
  end

  def find_by_first_name(name)
    attendees.find {|a| a.first_name.downcase == name.downcase}
    #.enum to return this one object as array?
  end

  def count
    attendees.count
  end

end
