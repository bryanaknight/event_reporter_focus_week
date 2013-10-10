require './lib/command_interpreter'

class Prompt

  def run
    puts "Welcome to EventReporter!"
    command_interpreter = CommandInterpreter.new

    input = nil
    while input != "exit"
      printf "enter command: "
      input = gets.chomp
      puts command_interpreter.run(input)
    end
  end

end

p = Prompt.new
p.run
