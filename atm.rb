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
    entered_pass_phrase = gets.chomp() #gets rid of the newline for the input
    login_trials += 1
    if entered_pass_phrase == password_phrase
      is_logged_in = true
    end
  else
    out_of_login_trials = true
  end
end
