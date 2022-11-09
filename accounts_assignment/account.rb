class Account
  attr_accessor :amazon_discount
  def self.new(*args)
    raise NoMethodError, "cannot instantiate #{self.name}" if self == Account
    super
  end

  def initialize(amazon_discount)
    @amazon_discount = amazon_discount
  end

  def print_discounts
    puts "The amazon discount for a #{self.class.to_s.split("A")[0]} account is #{@amazon_discount}"
  end
end
