def login (user_name, password)
  passing_user_name = "tHuthaifa"
  passing_password = "Admin123"
  password == passing_password and user_name == passing_user_name
end

def enter_validate_salary (wasta_message)
  print "Kindly enter your monthly salary:  "
  monthly_salary = gets.chomp.to_f
  raise RangeError, "Invalid Salary" unless monthly_salary > 0
  raise RangeError, wasta_message if monthly_salary > 5000.0
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
  greeting_message = "Greetings dear citizen\n please enter your national account credentials to continue\nEnter your username"
  puts greeting_message
  entered_user_name = gets.chomp
  puts "Enter your password"
  entered_password = gets.chomp
  puts "press any key to continue ..."
  gets
  is_logged_in = login entered_user_name, entered_password
  puts "incorrect username or password" unless is_logged_in
  return unless is_logged_in
  begin
    user_salary = enter_validate_salary wasta_message
    tax_percentage = map_salary_to_tax_cat user_salary
    calc_print_tax user_salary, tax_percentage
  rescue RangeError => error
    puts error.message
    return if error.message == wasta_message
    retry
  end
end

wasta_message = "You are a Wasta man"
main(wasta_message)
