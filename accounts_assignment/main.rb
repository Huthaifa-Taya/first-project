require_relative 'standard_account'
require_relative 'golden_account'
require_relative 'premium_account'

discount = 10
new_standard_account = StandardAccount.new(discount)
new_golden_account = GoldenAccount.new(discount, discount)
new_premium_account = PremiumAccount.new(discount, discount, discount)

new_standard_account.print_discounts
puts "\n"
new_golden_account.print_discounts
puts "\n"
new_premium_account.print_discounts
