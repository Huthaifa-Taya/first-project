require_relative 'user'

class UserInput
  attr_accessor :user, :input_array_length, :user_inputs_array

  def initialize
    @user_inputs_array = []
    @input_array_length = 0
    p 'Enter your name please: '
    @user = User.new gets.chomp
  end

  def start
    puts "Hello #{@user.name}"
    get_elements_number
    get_user_inputs
    options_and_operations
  end

  def options_and_operations
    show_options_to_user
    operate_according_to_choice gets.chomp.to_i
    operate_again_or_exit
  end

  def operate_again_or_exit
    puts "Please enter Yes/Ok to make another operation or enter anything to exit"
    options_and_operations unless gets.chomp.downcase in ["ok", 'yes']
  end

  def operate_according_to_choice(choice_number)
    case choice_number
    when 1
      p @user_inputs_array
    when 2
      p @user_inputs_array.sort
    when 3
      p @user_inputs_array.sort.reverse
    when 4
      p @user_inputs_array.max
    when 5
      p @user_inputs_array.min
    when 7
      p "Kindly enter the desired index"
      entered_index = gets.chomp.to_i
      unless (0...@input_array_length).include? entered_index
        p "please enter a valid number between 0 - #{@input_array_length - 1}"
        entered_index = gets.chomp.to_i
      end
      p "#{@user_inputs_array[entered_index]} was deleted from the original array"
      @user_inputs_array.delete_at entered_index
      p "Result array is #{@user_inputs_array}"
    when 8
      @user_inputs_array = @user_inputs_array.uniq
      p @user_inputs_array
    when 9
      p @user_inputs_array.join ","
    when 10
      p "Enter a number: "
      edge_number = gets.chomp.to_i
      p @user_inputs_array.filter { |element| element > edge_number }
    when 6
      sixth_input_msg = "In which positions shall the element added to?\n1 - to the end?\n2- to the First\n3- at any index?"
      puts sixth_input_msg
      append_position_choice = gets.chomp.to_i
      until append_position_choice in 1..3
        puts "Kindly enter a valid number", sixth_input_msg
        append_position_choice = gets.chomp.to_i
      end
      p "Enter the new element: "
      new_element = gets.chomp.to_i
      case append_position_choice
      when 1
        p "Original array before appending #{new_element} is", @user_inputs_array
        @user_inputs_array.push new_element
        p "New array is:",@user_inputs_array
      when 2
        p "Original array before appending #{new_element} is", @user_inputs_array
        @user_inputs_array.unshift new_element
        p "New array is:",@user_inputs_array
      else
        p "Please enter the index at which: "
        target_index = gets.chomp.to_i
        until target_index >= -@input_array_length
          p "Kindly enter a valid index (positive integer number) or (negative number that is not less than -#{@input_array_length}"
          target_index = gets.chomp.to_i
        end
        p "Original array before appending #{new_element} at #{ target_index } index is", @user_inputs_array
        @user_inputs_array[target_index]
        p @user_inputs_array
      end
    else
    end
  end

  def show_options_to_user
    puts "Kindly enter the number of the option you desire from the following options:\n1- print array as it is\n2- Sort array ascending and print it\n3- Sort array descending and print it\n4- return the max number\n5- return the min number\n6- add elements\n7- delete element at any index\n8- remove duplicated and print the array\n9- print array as string , separated by comma\n10- print elements that bigger than following number: "
  end

  def get_elements_number
    @input_array_length = @user.get_user_input 'How many elements do you want to enter: '
  end

  def get_user_inputs
    (0...@input_array_length).each { |index| @user_inputs_array[index] = @user.get_user_input "Please enter value number #{index + 1}" }
  end

end
