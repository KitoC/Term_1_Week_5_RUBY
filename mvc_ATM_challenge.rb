# ** ATM **
# dispense money
# respond to user choice
# display balance
# retrieve balance
# prompt for user input
# respond to invalid pin

class ATM_Model

  def initialize
    @validate = false
    @accounts = {dfault:{pin: 0, balance: 0}}
    @active_account = ""
  end

  def username(username, pin)
    # @accounts.key?("username")
    @validate = true if @accounts[username][:pin] == pin
    @active_account = username if @accounts[username][:pin] == pin
  end

  def validate
     @validate
  end

  def add_new_account(account, username)
    @accounts[username] = account
  end

  def balance
    balance = @accounts[@active_account][:balance]
    name = @accounts[@active_account][:name]
    return balance, name
  end

  def transaction(value, transact)
    if transact == "withdraw" && @accounts[@active_account][:balance] >= value
      @accounts[@active_account][:balance] -= value
    elsif transact == "deposit"
        @accounts[@active_account][:balance] += value
    else
      puts "You don't have that much to withdraw dumb a$$!"
      sleep 2.5
    end
  end

end



class Controller

  def initialize
    @user_view = UserView.new
    @atm_Model = ATM_Model.new
  end

  def run
    @user_view.greeting
    # system('clear')

    loop do
      system('clear')
      choice = @user_view.login_menu

        case choice
          when 1
            username, pin = @user_view.login
            @atm_Model.username(username, pin)


              if @atm_Model.validate
                # user_menu = @user_view.user_menu
                loop do
                  system('clear')
                  balance, name = @atm_Model.balance
                  choice = @user_view.user_menu(balance, name)
                  case choice
                    when 1
                      value, transact = @user_view.transaction("withdraw")
                      @atm_Model.transaction(value, transact)

                    when 2
                      value, transact = @user_view.transaction("deposit")
                      @atm_Model.transaction(value, transact)


                    when 3
                      @user_view.logout
                      sleep 2
                      break
                    else
                      @user_view.wrong_input
                      sleep 2
                  end
                end
              else
                puts "Incorrect pin."
                sleep 2
            end

        when 2
          account, username = @user_view.create_account
          @atm_Model.add_new_account(account, username)
          system('clear')

        when 3
          @user_view.logout
          sleep 2
          break
        else
          @user_view.wrong_input
          sleep 2
      end
    end
  end




end



class UserView

  def greeting
    system('clear')
    puts "\nWelcome to my EvilCorp\nATM services."
    sleep 0.5
    system('clear')
  end

  def login_menu
    choice = 0
      puts "____________________________"
      puts "\n            ATM"
      puts "____________________________"
      puts "\n1. Enter pin"
      puts "2. Create account"
      puts "3. Quit"
      puts "____________________________"
      choice = gets.chomp.to_i
    choice
  end

  def user_menu(balance, name)
    choice = 0
      puts "____________________________"
      puts "\n            ATM"
      puts "\nHello #{name}."
      puts "\nYour account balance: $#{balance}"
      puts "____________________________"
      puts "\n1. Withdraw"
      puts "\n2. Deposit"
      puts "\n3. Quit"
      puts "____________________________"
      choice = gets.chomp.to_i
    choice
  end

  def create_account
    account = {}

    puts "Please enter your username."
    username = gets.chomp

    puts "Please enter your pin-code."
    account[:pin] = gets.chomp.to_i

    puts "Please enter your name."
    account[:name] = gets.chomp

    account[:balance] = 500

    return account, username
  end

  def login
    puts "Please enter your username."
    username = gets.chomp
    puts "Please enter your pin."
    pin = gets.chomp.to_i
    return username, pin
  end

  def logout
    puts "Thanks for using EvilCorp. Have a terible day!"
  end

  def transaction(transact)
    print "How much would you like to #{transact}? $ "
    value = gets.chomp.to_i
    return value, transact
  end

  def wrong_input
    puts "Wrong input"
  end



end

sc = Controller.new
sc.run
