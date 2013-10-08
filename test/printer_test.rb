gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer'

class PrinterTest < Minitest::Test 
  attr_reader :printer 

  def setup
    @printer = Printer.new
  end

  def test_it_formats_a_header
    expected_header = "LAST NAME FIRST NAME EMAIL ZIPCODE CITY STATE ADDRESS PHONE"
    assert_equal expected_header, printer.header
  end

  def attendee_joe
    Attendee.new(:first_name => "Joe",
                 :last_name => "Schmo",
                 :email => "joe@example.com",
                 :zipcode => "80209",
                 :city => "Denver",
                 :state => "CO",
                 :street => "123 First Street",
                 :home_phone => "202-555-5555" )
  end

  def attendee_jane
    Attendee.new(:first_name => "Jane",
                 :last_name => "Schmo",
                 :email => "jane@example.com",
                 :zipcode => "80209",
                 :city => "Denver",
                 :state => "CO",
                 :street => "456 First Street",
                 :home_phone => "202-666-6666" )
  end


  def test_it_formats_an_attendee
    expected = "Schmo  Joe  joe@example.com  80209  Denver  CO  123 First Street  202-555-5555"
    assert_equal expected, printer.format_attendee(attendee_joe)
  end

  def test_it_formats_multiple_attendees
    attendees = [attendee_joe, attendee_jane]
    expected_1 = "Schmo  Joe  joe@example.com  80209  Denver  CO  123 First Street  202-555-5555"
    expected_2 = "Schmo  Jane  jane@example.com  80209  Denver  CO  456 First Street  202-666-6666"
    expected = [expected_1, expected_2].join("\n")
    assert_equal expected, printer.format_attendees(attendees)
  end

  def test_it_has_a_print_attendees_method
    assert printer.respond_to?(:print_attendees)
  end

end
