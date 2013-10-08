require 'csv'

class AttendeeParser
  attr_reader :attendees

  def parse_file(filename)
    data = open_file(filename)
    @attendees = data.collect { |line| build_attendee(line) }
    @attendees.count
  end

  def open_file(filename)
    CSV.open(filename, :headers => true, :header_converters => :symbol)
  end

  def build_attendee(line)
    Attendee.new(:first_name  => line[:first_name], 
                 :last_name   => line[:last_name],
                 :email       => line[:email_address],
                 :home_phone  => line[:homephone],
                 :street      => line[:street],
                 :city        => line[:city],
                 :state       => line[:state],
                 :zipcode     => line[:zipcode])
    end
  end


