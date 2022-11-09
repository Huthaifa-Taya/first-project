require_relative 'map_array_to_hash'
require_relative 'user'

class OccurrencesCalculator
  attr_accessor :input_array, :hashed_array_keys, :array_mapping_object, :unique_elements_array, :user

  def initialize
    @input_array = []
    @unique_elements_array = []
    @array_mapping_object = MapArrayToHash.new
    @user = User.new
  end

  def start
    get_user_input
    find_occurrences
  end

  def get_user_input
    number_of_elements = @user.get_user_input "How many elements you're willing to insert in an array", Integer
    puts "Number of elements is #{number_of_elements} and class is #{number_of_elements.class}"
    unless number_of_elements.class == Integer and number_of_elements > 0
      puts "please enter a valid number of elements"
      get_user_input
    end
    (1..number_of_elements).each { |number| @input_array.push user.get_user_input "Enter the element number #{number}" }
    print "\n"
  end

  def find_occurrences
    begin
      @hashed_array_keys = array_mapping_object.set_new_array @input_array
      @unique_elements_array = array_mapping_object.uniq_array
    rescue TypeError => error
      print "\n#{error}\n"
      abort "The above error occurred during the execution of #{__method__} inside #{self.class} class in #{File.basename(__FILE__)} file"
    else
      count_number_of_occurrences
      puts "in the list of words #{@input_array}.\nNumber f occurrences are listed inside a hash after counting as follows.\n#{@hashed_array_keys}"
    end

  end

  def count_number_of_occurrences
    @unique_elements_array.each { |ele| @hashed_array_keys[ele] = @input_array.count { |elem| elem == ele } }
  end
end

