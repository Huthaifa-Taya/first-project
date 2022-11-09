require_relative 'new_array_methods'
require "colorize"
require 'colorized_string'
test_string = ColorizedString.new "Test"
ColorizedString.mode_codes
puts ColorizedString["This is a colored string"]
puts test_string
puts  %w[ali ali samer mohammad mohammad khaled khaled osama huthaifa zaid raisa tommy name test ahmad samer].to_occur_h
module Tet
  def test_m
    puts "Module"
  end
end

class A

  def m1
    puts 'public method'
  end

  def m2
    puts "private method"
  end

  def m3
    puts "protected method"
  end
  # def test_m
  #   puts 'Parent'
  # end

  private :m2
  protected :m3
end


class B < A
  extend Tet
  def testing_method
    m1
    m2
    m3
  end

  def test_y
    puts "Child"
  end
end

new_instance_from_b = B.new
B.test_m
B.class_eval do
  def another_method
    puts "executing #{__method__}"
  end
  def self.test_class_method
    puts "added a new class method named: #{__method__}"
  end


end
# new_instance_from_b.another_method
# B.test_class_method


