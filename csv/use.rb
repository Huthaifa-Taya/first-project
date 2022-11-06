require_relative 'CSVFileOperations'
require_relative 'csv_row'
class Use
  attr_accessor :csv_object, :file_name, :data, :data_array

  def initialize (file_name)
    @file_name = file_name
    @csv_object = CSVFileOperations.new
    self.data_array = []
  end
  def read_file
    data = @csv_object.read_file file_name
    data.each { |row| @data_array.append CSVRow.new row[:id], row[:product], row[:price] }
    p @data_array
  end
  def write_data_file (data_row_array)
    raise TypeError, "Expected an array of objects of CSVRow class" unless data_row_array.is_a? Array and data_row_array.all? {|item| item.instance_of? CSVRow}
    @csv_object.write_file file_name, data_row_array
  end
end


