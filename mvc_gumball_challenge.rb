#
# ** GUMBALL MACHINE **
#
# Model
# keep track of number of gumballs
# accept gumball refills
# check if gumballs are available
#
# View
# provide gumballs
# prompt for user input
# inform user of result
#
# Controller
# process user input


class Gumball
  
end

class GumballMachineModel

  def initialize(gumballCount: 0)
    @gumballCount = gumballCount
  end

  def dispense
    if @gumballCount > 0
      @gumballCount -= 1
      return Gumball.new
    else
      return nil
    end
  end

  def refill(count)
    @gumballCount += count
  end

end

class GumballMachineView

  def greeting
    puts "Welcome to Gummy gum balls!"
  end

  def menu
    choice = nil
    while choice != "G" && choice != "R" && choice != "X"
      puts "Press G to get a gumball, R to refill, or X to exit"
      choice = gets.chomp.upcase
    end
    choice
  end

  def getGumball
    puts "Yum, here's your gumball"
  end

  def machineEmpty
    puts "Unfortunately you got greedy and there a no gumballs left!"
    # output an appropriate message to the console
  end

  def refill(count)
    puts "You now have #{count} many gumballs in the machine."

    # output an appropriate message to the console.
    # Make sure you tell the user how many gumballs there are now!
  end

  def exit
    puts "Thanks for giving us business! (your dentist)"
    # output an appropriate message to the console
  end

end

class GumballMachineController

  def initialize
    @gumballMachineModel = GumballMachineModel.new
    @gumballMachineView = GumballMachineView.new
  end

  def run
    @gumballMachineView.greeting
    choice = @gumballMachineView.menu

    while choice != "X"
      if choice == "G"
        gumball = @gumballMachineModel.dispense
        if gumball.nil?
          @gumballMachineView.machineEmpty
        else
          @gumballMachineView.getGumball
        end
      end
      if choice == "R"
        numGumballs = @gumballMachineModel.refill(6)
        @gumballMachineView.refill(numGumballs) # put something inside the brackets
      end
      choice = @gumballMachineView.menu
    end
    # call the exit method
  end
end

gumballMachineController = GumballMachineController.new
gumballMachineController.run
