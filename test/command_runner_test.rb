gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_runner'

class CommandRunnerTest < Minitest::Test  

  def test_it_loads_a_CSV_into_the_registry
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    assert_equal 10, cr.attendee_count
  end

  def test_it_counts_the_queue_when_empty
    cr = CommandRunner.new
    assert_equal 0, cr.queue_count
  end

  def test_it_counts_a_loaded_queue
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert_equal 2, cr.queue_count
  end

  def test_it_replaces_queued_items_on_a_second_find
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    cr.find_attendees_by_first_name("Audrey")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_last_name("Nguyen")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_email("arannon@jumpstartlab.com")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_home_phone("6154385000")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_street("3155 19th St NW")
    assert_equal 1, cr.queue_count
    cr.find_attendees_by_city("Washington")
    assert_equal 2, cr.queue_count
    cr.find_attendees_by_state("DC")
    assert_equal 2, cr.queue_count
    cr.find_attendees_by_zipcode("20009")
    assert_equal 1, cr.queue_count
  end

  def test_it_calls_queue_print
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert cr.respond_to?(:queue_print) 
  end

  def test_queue_print
    skip
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert_equal 0, cr.queue_print.first 
  end

  def test_it_calls_queue_save_method
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert cr.respond_to?(:queue_save)
  end

  def test_it_executes_the_queue_save_method
    cr = CommandRunner.new
    cr.load('./test/fixtures/partial_attendees.csv')
    cr.find_attendees_by_first_name("Sarah")
    assert "woot", cr.queue_save("new_file")
  end

  
end
