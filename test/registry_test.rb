gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'

class RegistryTest < Minitest::Test  
  attr_reader :registry
  
  def setup
    @registry = Registry.new
  end

  def test_it_finds_attendees_by_first_name
    registry.attendees = [
      Attendee.new(:first_name => "sarah"),
      Attendee.new(:first_name => "SArah"),
      Attendee.new(:first_name => "Billy")
    ]
    attendees = registry.find_all_by_first_name("Sarah")
    assert_equal 2, attendees.count
      attendees.each do |attendee|
    assert_equal "sarah", attendee.first_name.downcase
    end
  end

  def test_it_finds_attendees_by_last_name_irrespective_of_case
     registry.attendees = [
      Attendee.new(:last_name => "johnson"),
      Attendee.new(:last_name => "Myers"),
      Attendee.new(:last_name => "Johnson")
    ]
    attendees = registry.find_all_by_last_name("johnson")
    assert_equal 2, attendees.count
      attendees.each do |attendee|
    assert_equal "johnson", attendee.last_name.downcase
    end
  end

  def test_it_finds_attendees_by_email_irrespective_of_case
    registry.attendees = [
      Attendee.new(:email => "arannon@jumpstartlab.com"),
      Attendee.new(:email => "arannon@jumpstartlab.com"),
      Attendee.new(:email => "fake@gmail.com")
    ]
    attendees = registry.find_all_by_email("arannon@jumpstartlab.com")
    assert_equal 2, attendees.count
      attendees.each do |attendee|
    assert_equal "arannon@jumpstartlab.com", attendee.email
    end
  end

  def test_it_finds_all_attendees_by_home_phone_irrespective_of_format
  registry.attendees = [
    Attendee.new(:home_phone => "123-456-7890"),
    Attendee.new(:home_phone => "1234567890"),
    Attendee.new(:home_phone => "0")
  ]
  attendees = registry.find_all_by_home_phone("1234567890")
  assert_equal 2, attendees.count
    attendees.each do |attendee|
  assert_equal "1234567890", attendee.home_phone.scan(/\w+/).join
    end
  end

  def test_it_finds_all_attendees_by_city
  registry.attendees = [
    Attendee.new(:city => "Washington"),
    Attendee.new(:city => "Washington"),
    Attendee.new(:city => "Vancouver")
  ]
  attendees = registry.find_all_by_city("Washington")
  assert_equal 2, attendees.count
    attendees.each do |attendee|
  assert_equal "washington", attendee.city.downcase
    end
  end

  def test_it_finds_all_attendees_by_state
  registry.attendees = [
    Attendee.new(:state => "DC"),
    Attendee.new(:state => "FL"),
    Attendee.new(:state => "DC")
  ]
  attendees = registry.find_all_by_state("DC")
  assert_equal 2, attendees.count
    attendees.each do |attendee|
  assert_equal "DC", attendee.state
    end
  end

  def test_it_finds_all_attendees_by_zipcode
  registry.attendees = [
    Attendee.new(:zipcode => "20016"),
    Attendee.new(:zipcode => "20016"),
    Attendee.new(:zipcode => "01508")
  ]
  attendees = registry.find_all_by_zipcode("20016")
  assert_equal 2, attendees.count
    attendees.each do |attendee|
  assert_equal "20016", attendee.zipcode
    end
  end  

  def test_it_finds_first_attendee_by_first_name_irrespective_of_case
    registry.attendees = [
      Attendee.new(:first_name => "Sarah", :last_name => "Brown"),
      Attendee.new(:first_name => "SArah"),
      Attendee.new(:first_name => "Billy")
    ]
    attendees = registry.find_by_first_name("Sarah")
    assert_kind_of Attendee, attendees
    assert_equal "sarah", attendees.first_name.downcase
    assert_equal "brown", attendees.last_name.downcase
  end




end

