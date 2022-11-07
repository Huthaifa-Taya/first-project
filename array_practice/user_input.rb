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
    puts "\nPlease enter Yes/Ok/yes/ok/Y/O/y/o to make another operation or enter anything to exit"
    abort "Good bye!" unless %w[ok yes y o].include? gets.chomp.downcase
    options_and_operations
  end

  def operate_according_to_choice(choice_number)
    case choice_number
    when 1
      print @user_inputs_array
    when 2
      print @user_inputs_array.sort
    when 3
      print @user_inputs_array.sort.reverse
    when 4
      print @user_inputs_array&.max
    when 5
      print @user_inputs_array&.min
    when 7
      print "Kindly enter the desired index"
      entered_index = gets.chomp.to_i
      unless (-@input_array_length...@input_array_length).include? entered_index
        p "please enter a valid number between -#{ @input_array_length } - #{@input_array_length - 1}"
        entered_index = gets.chomp.to_i
      end
      print "\n#{@user_inputs_array[entered_index]} was deleted from the original array"
      @user_inputs_array.delete_at entered_index
      print "\nResult array is \n#{@user_inputs_array}"
    when 8
      @user_inputs_array = @user_inputs_array.uniq
      print "\n", @user_inputs_array, "\n"
    when 9
      print "\n", (@user_inputs_array.join ","), "\n"
    when 10
      print "\nEnter a number: \n"
      edge_number = gets.chomp.to_i
      print "\n",(@user_inputs_array.filter { |element| element > edge_number })
    when 6
      sixth_input_msg = "In which positions shall the element added to?\n1 - to the end?\n2- to the First\n3- at any index?"
      puts sixth_input_msg
      append_position_choice = gets.chomp.to_i
      until append_position_choice in 1..3
        puts "Kindly enter a valid number", sixth_input_msg
        append_position_choice = gets.chomp.to_i
      end
      puts "Enter the new element: "
      new_element = gets.chomp.to_i
      case append_position_choice
      when 1
        array_push_or_unshift(new_element, :push)
      when 2
        array_push_or_unshift(new_element, :unshift)
      else
        p "Please enter the index at which: "
        target_index = gets.chomp.to_i
        until  (0..(@input_array_length - 1)).include? target_index
          p "Kindly enter a valid index (positive integer number) or (negative number that is not less than -#{@input_array_length}"
          target_index = gets.chomp.to_i
        end
        print "\nOriginal array before appending #{new_element} at index #{ target_index } is\n", @user_inputs_array
        @user_inputs_array.insert target_index, new_element
        print "\n", @user_inputs_array, "\n"
      end
    else
      puts "Invalid option"
      options_and_operations
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

  private

  def array_push_or_unshift(new_element, add_method)
    print "\nOriginal array before appending #{new_element} is\n", @user_inputs_array
    @user_inputs_array.method(add_method).call new_element
    print "\nNew array is:\n", @user_inputs_array
  end

end
