require './lib/attendee_parser'
require './lib/registry'
require './lib/queue'
require './lib/printer'
require './lib/writer'

class CommandRunner

  def initialize
     @help_keys = { 'queue clear' => 'clears out queue', 
      'queue count' => 'gives number of items in queue', 
      'queue print' => 'shows items in queue',
      'find' => 'finds item you searched and shows all information related to item',
      'load <filename>' => 'loads file so you can access the data',
      'queue save' => 'outputs queue to a csv file'
      }
  end

  def parser
    @parser ||= AttendeeParser.new
  end

  def registry
    @registry ||= Registry.new
  end

  def queue 
    @queue ||= Queue.new
  end

  def printer
    @printer ||= Printer.new
  end

  def writer
    @writer ||= Writer.new
  end

  def load(filename)
    parser.parse_file(filename)
    registry.attendees = parser.attendees
    "Loaded #{registry.count} attendees"
  end

  def attendee_count
    registry.count
  end

  def queue_count
    queue.count
  end

  def find_attendees_by_first_name(name)
    queue.replace(registry.find_all_by_first_name(name))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_last_name(name)
    queue.replace(registry.find_all_by_last_name(name))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_email(email)
    queue.replace(registry.find_all_by_email(email))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_home_phone(phone)
    queue.replace(registry.find_all_by_home_phone(phone))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_street(street)
    queue.replace(registry.find_all_by_street(street))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_city(city)
    queue.replace(registry.find_all_by_city(city))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_state(state)
    queue.replace(registry.find_all_by_state(state))
    "Found #{queue.count} attendees."
  end

  def find_attendees_by_zipcode(zipcode)
    queue.replace(registry.find_all_by_zipcode(zipcode))
    "Found #{queue.count} attendees."
  end

  def queue_print
    printer.print_attendees(queue_data)
  end

  def queue_data
    queue.data
  end

  def queue_save(filename)
    writer.write_to(filename, queue_data)
    "saved queue to #{filename}.csv"
  end

  def queue_clear
    queue.clear
    "cleared the queue"
  end

  def help
    printf @help_keys.keys
  end

  def help_for_command(command)
    printf @help_keys[command]
  end

end
