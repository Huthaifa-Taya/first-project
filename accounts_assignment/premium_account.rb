require_relative 'account'
require_relative 'udemy'
class PremiumAccount < Account
  include Udemy
  attr_accessor :aramex_discount
  def initialize(amazon_discount, udemy_discount, aramex_discount)
    super amazon_discount, udemy_discount
    @aramex_discount = aramex_discount
  end

  def print_discounts
    super
    puts "The aramex discount for a #{self.class.to_s.split("A")[0]} account is #{@aramex_discount}"
  end
end
