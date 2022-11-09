require_relative 'account'
require_relative 'udemy'

class GoldenAccount < Account
  include Udemy
end
