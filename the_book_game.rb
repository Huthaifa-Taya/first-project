max_range_number = 0
min_range_number = 0
player_guess = 0
puts "Enter you name here: "
player_name = gets.chomp
game_levels = {
  1 => "Easy",
  2 => "Medium",
  3 => 'Hard'
}
level_number = 1
puts "Greetings #{player_name} this is a guessing game.... the after starting the game, you'll be asked to enter a number randomly to guess the randomly generated number you will be provided with hint messages whether your guessing is higher or lower also if it is close to the number. hope you will enjoy! \nLets us Begin\nPress any key to start"
gets
loop do
puts "Select the level of the game by entering the number of the level as follows\n1.Easy\n2.Medium\n3.Hard"
level_number = gets.chomp.to_i
  case level_number
  when 1
    max_range_number = 100
    break
  when 2
    max_range_number = 1000
    break
  when 3
    max_range_number = 5000
    break
  else
    puts "Please enter a valid level number"
  end
end
  randomly_gen_number = rand(min_range_number..max_range_number)
puts "Now the game is about to start in #{game_levels[level_number]}\nPress any key start"
gets
while player_guess != randomly_gen_number
  puts "Guess and enter any number between #{min_range_number} and #{max_range_number}"
  player_guess = gets.chomp.to_i
  break unless player_guess != randomly_gen_number
  puts player_guess > randomly_gen_number ? "Your guess is high" : "Your number is low"
  puts "Your guess is close" if (player_guess - randomly_gen_number).abs <= 10
end
puts "Congrats you've beaten the game press any key to exit!"
gets
