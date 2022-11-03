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
def map_salary_to_tax_cat (salary)
  tax_percentage = 0
  case salary
  when 0..1000
    tax_percentage = 0.001
  when 1000..2000
    tax_percentage = 0.005
  when 2000..3001
    tax_percentage = 0.01
  else
    tax_percentage = 0.02
  end
  tax_percentage
end
