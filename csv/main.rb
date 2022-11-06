require_relative 'use'
use_csv = Use.new 'C:\Users\LENOVO\Work Directory\ruby\test_project\csv\products.csv'
use_csv.read_file

new_array = []
(1..20).each { |i|
  new_array.append CSVRow.new(i, "product_#{i}", i * 5)
}
use_csv.write_data_file new_array
use_csv_2 = Use.new 'C:\Users\LENOVO\Work Directory\ruby\test_project\csv\test.csv'
use_csv_2.write_data_file new_array