Array.class_eval do
  def to_occur_h (array = [])
    array == [] ? array = self : array
    result_occur_hash = Hash.new 0
    array.each do |element|
      result_occur_hash.key? element ? result_occur_hash[element] += 1 : result_occur_hash[element] = 1
    end
    result_occur_hash
  end
end

