number_to_guess = 200
guessing_range = [0, 400]

guessed_number = 0

def guess_with_until(number_to_guess, guessed_number, range)
  until guessed_number == number_to_guess
    puts "Enter your guessing number between #{range[0]} and #{range[1]}"
    guessed_number = gets.chomp.to_i
    break if guessed_number == number_to_guess
    puts guessed_number > number_to_guess ? "Your number is High" : "Your number is Low"
  end
  puts "Congrats you guessed the correct number!"
end

def guess_with_while(number_to_guess, guess_number, range)
  while guess_number != number_to_guess
    puts "Enter your guessing number between #{range[0]} and #{range[1]}"
    guess_number = gets.chomp.to_i
    break if guess_number == number_to_guess
    puts guess_number > number_to_guess ? "Your number is High" : "Your number is Low"
  end
  puts "Congrats you guessed the correct number!"
end

def guess_with_do_while(number_to_guess, guess_number, range)
  while guess_number != number_to_guess do
    puts "Enter your guessing number between #{range[0]} and #{range[1]}"
    guess_number = gets.chomp.to_i
    break if guess_number == number_to_guess
    puts guess_number > number_to_guess ? "Your number is High" : "Your number is Low"
  end
  puts "Congrats you guessed the correct number!"
end


puts "guessing using until"
guess_with_until(number_to_guess, guessed_number, guessing_range)

puts "guessing using while"
guess_with_while(number_to_guess, guessed_number, guessing_range)

puts "guessing using do while"
guess_with_do_while(number_to_guess, guessed_number, guessing_range)