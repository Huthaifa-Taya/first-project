class MapArrayToHash
  attr_accessor :uniq_array

  def initialize
    @uniq_array = []
  end

  def set_new_array(array, default_value = 0)
    a_type = array.class
    raise TypeError, "Expected first argument to be type of an array instead got #{ %w[a e i o u].include? a_type.to_s[0].downcase ? 'an' : 'a' } #{a_type}" unless array.is_a? Array
    @uniq_array = array.uniq
    array_to_hash_keys default_value
  end

  def array_to_hash_keys(default_value = 0)
    @uniq_array.to_h {|key_name| [key_name, default_value]}
  end

  private :array_to_hash_keys
end
