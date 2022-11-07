class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  def get_user_input (message)
    p message
    gets.chomp.to_i
  end
end
