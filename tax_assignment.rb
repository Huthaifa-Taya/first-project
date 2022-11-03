def login (user_name, password)
  passing_user_name = "tHuthaifa" #the correct username
  passing_password = "Admin123"   #the correct password
  password == passing_password and user_name == passing_user_name
end

def enter_validate_salary (wasta_message)
  print "Kindly enter your monthly salary:  "
  monthly_salary = gets.chomp.to_i #takes the input from user as an integer
  raise RangeError, "Invalid Salary" unless monthly_salary > 0 # raises an error from range type if entered value is 0 or less
  raise RangeError, wasta_message if monthly_salary > 5000 # raises an error from range type if entered value is larger than 5000
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
  salary_and_tax_message = "Your total salary is #{salary} and your tax is #{tax_amount} net salary is #{salary - tax_amount}"
  puts salary_and_tax_message
end

def main (wasta_message)
  #prints greeting message to the user and asks to input username and password
  greeting_message = "Greetings dear citizen\n please enter your national account credentials to continue\nEnter your username"
  puts greeting_message
  entered_user_name = gets.chomp
  puts "Enter your password"
  entered_password = gets.chomp
  puts "press any key to continue ..."
  gets # to prevents the program to proceed until the user presses any key
  is_logged_in = login entered_user_name, entered_password
  puts "incorrect username or password" unless is_logged_in
  return unless is_logged_in # if credentials are incorrect return and halt the execution
  begin
    user_salary = enter_validate_salary wasta_message
    tax_percentage = map_salary_to_tax_cat user_salary
    calc_print_tax user_salary, tax_percentage
  rescue RangeError => error
    puts error.message
    return if error.message == wasta_message # stops the execution of the program retry if the salary is larger than 5000
    retry
  end
end

# a message to be used in raising an error if salary is greater than 5000 to stop the program
wasta_message = "You are a Wasta man"

main(wasta_message) #starts the execution of the program
