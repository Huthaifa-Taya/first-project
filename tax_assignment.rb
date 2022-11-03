def login (user_name, password)
  passing_user_name = "tHuthaifa"
  passing_password = "Admin123"
  password == passing_password and user_name == passing_user_name
end

def enter_validate_salary
  wasta_message = "You are a Wasta man"
  print "Kindly enter your monthly salary:  "
  monthly_salary = gets.chomp.to_f
  raise RangeError,"Invalid Salary" unless monthly_salary > 0
  raise RangeError,wasta_message if monthly_salary > 5000.0
  monthly_salary
end
