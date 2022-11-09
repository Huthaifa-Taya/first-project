module Udemy
  attr_accessor :udemy_discount

  def initialize(amazon_discount, udemy_discount)
    super amazon_discount
    @udemy_discount = udemy_discount
  end

  def print_discounts
    super
    puts "The udemy discount for a #{self.class.to_s.split("A")[0]} account is #{@udemy_discount}"
  end
end
