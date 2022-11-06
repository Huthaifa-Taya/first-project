require 'csv'
class CSVFileOperations
  def read_file (file_name)
    CSV.open file_name, headers: true, header_converters: :symbol
  end

  def write_file (file_name, data)
    CSV.open file_name, 'w' do |csv|
      csv << %w[id product price]
      data.each { |row| csv << [row.product_id, row.product_name, row.product_price] }
      csv.close
    end

  end
end
