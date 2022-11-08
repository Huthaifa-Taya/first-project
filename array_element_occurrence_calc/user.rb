class User
  attr_accessor :name, :input

  def initialize
    puts "Kindly enter your name"
    @name = gets.chomp
  end

  def get_user_input(message, return_type = String)
    puts message
    return_type == String ? @input = gets.chomp.strip : @input = gets.chomp.strip.to_i
    @input
  end

end
