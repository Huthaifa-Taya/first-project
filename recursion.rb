def factorial_method(number)
  return 1 if number == 0
   number * factorial_method(number - 1)
end


print "Enter a number to calculate its factorial: "
entered_number = gets.chomp.to_i
puts "The factorial of #{entered_number} is #{factorial_method entered_number}"