gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/writer'

class WriterTest < Minitest::Test 

  def test_it_takes_a_filename
    skip
    writer = Writer.new
    assert_equal "Writing to new-file.csv", writer.write_to("new-file.csv")
  end

  def make_me_a_directory
    writer = Writer.new
    writer.make_directory
    assert_equal true, File.directory?("./queue")
  end


end
