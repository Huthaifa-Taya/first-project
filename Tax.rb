class Tax
  # @username = ""
  attr_writer :username
  # @password = ""
  attr_writer :password
  # @wasta_message = "You are a Wasta man"
  attr_accessor :wasta_message

  # def set_username (user_name)
  #   @username = user_name
  # end
  #
  # def set_password (user_password)
  #   @password = user_password
  # end
  #
  # def set_message
  #   @wasta_message = "Test"
  #   end

  def login (user_name, password)
    passing_user_name = "tHuthaifa" #the correct username
    passing_password = "Admin123"   #the correct password
    password == passing_password and user_name == passing_user_name
  end

  def enter_validate_salary
    print "Kindly enter your monthly salary:  "
    monthly_salary = gets.chomp.to_i #takes the input from user as an integer
    raise RangeError, "Invalid Salary" unless monthly_salary > 0 # raises an error from range type if entered value is 0 or less
    raise RangeError, @wasta_message if monthly_salary > 5000 # raises an error from range type if entered value is larger than 5000
    monthly_salary
  end

  def map_salary_to_tax_cat (salary)
    tax_percentage = 0
    case salary
    when 1..1000
      tax_percentage = 0.001
    when 1001..2000
      tax_percentage = 0.005
    when 2001..3000
      tax_percentage = 0.01
    else
      tax_percentage = 0.02
    end
    tax_percentage
  end

  def calc_print_tax (salary, tax_percentage)
    tax_amount = salary * tax_percentage
    puts "Your total salary is #{salary} and your tax is #{tax_amount} net salary is #{salary - tax_amount}"
  end

  def get_wasta_message
    puts @wasta_message
    @wasta_message
  end
end

def main
  user = Tax.new
  user.username = "tHuthaifa"
  user.password = "Admin123"
  user.wasta_message = "Man you're a Wasta!"
  #prints greeting message to the user and asks to input username and password
  puts "Greetings dear citizen\n please enter your national account credentials to continue\nEnter your username"
  entered_user_name = gets.chomp
  puts "Enter your password"
  entered_password = gets.chomp
  puts "press any key to continue ..."
  gets # to prevents the program to proceed until the user presses any key
  is_logged_in = user.login entered_user_name, entered_password
  unless is_logged_in
    puts "incorrect username or password"
    return
  end
  begin
    user_salary = user.enter_validate_salary
    tax_percentage = user.map_salary_to_tax_cat user_salary
    user.calc_print_tax user_salary, tax_percentage
  rescue RangeError => error
    puts error.message
    return if error.message == user.get_wasta_message # stops the execution of the program retry if the salary is larger than 5000
    retry
  end
end

main