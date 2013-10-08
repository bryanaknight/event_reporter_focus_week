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
    instruction = parts[0]

    if instruction == "load"
      filename = parts[1] || default_filename
      runner.load(filename)
    elsif instruction == "queue"
      run_queue(parts[1..-1])
    end
  end

  def run_queue(parts)
    case parts.first
      when "print"
        order = parts.last
        runner.queue_print(order)
      when "count"
        runner.queue_count
      end
  end

end
