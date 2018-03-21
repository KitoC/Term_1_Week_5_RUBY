


class StatsModel

  def initialize
    @numbers = []
  end

  def store(values)
    values.each { |x| @numbers.push(x) }
    # puts @numbers.inspect
  end

  def get
    @numbers.sort
  end

  def average
    # sum = 0
    # @numbers.each { |x| sum += x }
    # sum / @numbers.length
    @numbers.sum / @numbers.length
  end

end

class StatsView

  def greeting
    puts "\nWelcome to my MVC\nstatistics app."
  end

  def menu
    choice = 0
    # system('clear')
    while choice < 1 || choice > 4
      puts "_______________________"
      puts "\n       Main Menu"
      puts "_______________________"
      puts "\n1. Insert numbers"
      puts "2. List numbers"
      puts "3. Show average"
      puts "4. Quit"
      puts "_______________________"
      choice = gets.chomp.to_i
    end
    choice
  end

  def read_numbers
    values = []
    puts "Please enter positive numbers, one per line. Enter -1 when done"
    num = gets.chomp.to_i

    while num != -1 do
       values.push(num)
       num = gets.chomp.to_i
    end
    values
  end

  def display(numbers)
    puts "The numbers are #{numbers.inspect}"
  end

  def show_average(avg)
    puts "The average is #{avg}"
  end

  def quit
    puts "Thanks! Come again!"
  end

end

class StatsController

  def initialize
    @StatsModel = StatsModel.new
    @StatsView = StatsView.new
  end

  def run
    @StatsView.greeting
    the_choice = @StatsView.menu

    loop do
      # system('clear')
      case the_choice
        when 1
          numbers = @StatsView.read_numbers
          @StatsModel.store(numbers)
        when 2
          numbers = @StatsModel.get
          @StatsView.display(numbers)
        when 3
          avg = @StatsModel.average
          @StatsView.show_average(avg)
        when 4
          # system('clear')
          @StatsView.quit
          sleep 2
          break
      end
      the_choice = @StatsView.menu
    end
  end

end

#  Main entry point of the program
sc = StatsController.new
sc.run
