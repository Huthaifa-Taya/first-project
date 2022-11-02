#Limits of number of attempts for the login and withdrawal functionalities
max_login_trial_count = 3
max_amount_trial_count = 3

#Has the user used all their login and withdrawal attempts?
out_of_amount_trials = false
out_of_login_trials = false

#The number of trials the user has already used so far for both login and withdrawal
login_trials = 0
amount_trials = 0

#The user's passphrase and balance total amount
password_phrase = "Admin123"
balance_total_amount = 9000

#The currently entered values by the user
entered_pass_phrase = ""
entered_amount = 0

#Flags to determine whether the user is currently logged in or did he/she withdrawn or not
is_logged_in = false
has_drawn = false

#As long the user did not exceed the limit number of attempts and the entered phrase isn't correct
#the loop continues
while entered_pass_phrase != password_phrase and !out_of_login_trials
  if login_trials < max_login_trial_count
    puts "Please enter the pass-phrase: "
    entered_pass_phrase = gets.chomp #gets rid of the newline for the input
    login_trials += 1
    if entered_pass_phrase == password_phrase
      is_logged_in = true
    else
      puts "Incorrect pass-phrase please try again you have #{max_login_trial_count - login_trials} attempts left"
    end
  else
    out_of_login_trials = true
  end
end


#Keeps asking the user to input a withdrawal amount as long as they do not exceed the max attempts
# for withdrawal and the amount is not correct or bigger than the limit of the balance.
while !has_drawn and is_logged_in and !out_of_amount_trials
  if amount_trials < max_amount_trial_count
    puts "Enter the desired amount"
    entered_amount = gets.chomp.to_f #Removes the new line and converts the string to float
    amount_trials += 1

    #Checks whether the entered amount is valid or not and act accordingly
    case
    when entered_amount > 0
      #if the entered amount is higher the current balance amount puts an error
      if entered_amount > balance_total_amount
        puts "insufficient balance please try again you have #{max_amount_trial_count - amount_trials} trials left"
      else
        #If the entered amount is valid the entered amount is subtracted from the balance
        # and a message is printed to the user and the user is logged out
        balance_total_amount -= entered_amount
        puts "thank you for banking with us the remaining balance is #{balance_total_amount}"
        has_drawn = true
        is_logged_in = false
      end
    else
      #Alerts to thw user that the entered value is not valid with the remaining number of attempts
      puts "Please Enter a valid amount number you have #{max_amount_trial_count - amount_trials} attempts left"
    end
  else
    #The user ran out of withdrawal attempts
    out_of_amount_trials = true
  end
end

