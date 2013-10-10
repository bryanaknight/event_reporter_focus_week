gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'

class CommandInterpreterTest < Minitest::Test  
  attr_reader :ci

  def setup
    @ci = CommandInterpreter.new(FakeCommandRunner)
  end

  class FakeCommandRunner

    def load(filename)
      "running load with #{filename}"
    end

    def queue_print(order)
      if order
        "running queue print ordered by #{order}"
      else
        "running queue print in the default order"
      end
    end

    def queue_count
      "running queue count"
    end

    def queue_clear
      "running queue clear"
    end

    def queue_save(filename)
      "saves queue to #{filename}"
    end

    def help
      "running help for available commands"
    end

    def help_for_command(command)
      "help for #{command} is on the way!"
    end

    def find(attribute,criteria)
      "finding all attendees with #{attribute} #{criteria}"
    end

  end

  def test_it_accepts_a_load_instruction
    command = "load some_data.csv"
    result = ci.run(command)
    assert_equal "running load with some_data.csv", result
  end

  def test_it_runs_loads_without_a_filename
    result = ci.run("load")
    assert_equal "running load with event_attendees.csv", result
  end

  def test_it_prints_ordered_by_the_last_name
    result = ci.run("queue print by last_name")
    assert_equal "running queue print ordered by last_name", result
  end

  def test_it_prints_with_no_order_specified
    result = ci.run("queue print")
    assert_equal "running queue print in the default order", result
  end

  def test_it_counts_the_queue
    result = ci.run("queue count")
    assert_equal "running queue count", result
  end

  def test_it_clear_the_queue
    result = ci.run("queue clear")
    assert_equal "running queue clear", result
  end

  def test_it_saves_the_queue_to_a_file
    result = ci.run("queue save to fake_file.csv")
    assert_equal "saves queue to fake_file.csv", result
  end

  def test_help
    result = ci.run("help")
    assert_equal "running help for available commands", result
  end

  def test_help_for_specific_command
    result = ci.run("help queue print")
    assert_equal "help for queue print is on the way!", result
  end

  def test_find_by_attribute_criteria_finds_all_attendees
    result = ci.run("find first_name John")
    assert_equal "finding all attendees with first_name John", result
  end

end
