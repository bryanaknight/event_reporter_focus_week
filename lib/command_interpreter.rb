class CommandInterpreter
  attr_reader :runner

  def initialize(runner_input = CommandRunner)
    @runner = runner_input.new
  end

  def default_filename
    "event_attendees.csv"
  end

  def run(command)
    parts = command.split
    instruction = parts.first
    if instruction == "load"
      run_load(parts[1..-1])
    elsif instruction == "queue"
      run_queue(parts[1..-1])
    elsif instruction == "help"
      run_help(parts[1..-1])
    elsif instruction == "find"
      run_find(parts[1..-1])
    end
  end

  def run_load(parts)
    filename = parts.first || default_filename
    runner.load(filename)
  end

  def run_queue(parts)
    case parts.first
      when "print"
        order = parts[2]
        runner.queue_print(order)
      when "count"
        runner.queue_count
      when "clear"
        runner.queue_clear
      when "save"
        filename = parts[2]
        runner.queue_save(filename)
      end
  end

  def run_help(parts)
    case parts.first
      when nil
        runner.help
      else
        command = parts.join(" ")
        runner.help_for_command(command)
    end
  end

  def run_find(parts)
    attribute = parts.first 
    criteria = parts[1..-1].join(" ")
    runner.find(attribute, criteria)
  end

end
