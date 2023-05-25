# frozen_string_literal: true

# Read File Method
def load_data_from_file(s_month, file_path)
  year, month = s_month.split('/')
  if !month.nil?
    mon = convert_months(month.to_i - 1)
    file_pattern = "#{file_path}/#{file_path}_#{year}_#{mon}.txt"
  else
    file_pattern = "#{file_path}/#{file_path}_#{year}_*.txt"
  end
  file_read(file_pattern, file_path)
end

def file_read(file_pattern, _filepath)
  data_array = []
  
    Dir.glob(file_pattern) do |filepath|
      File.open(filepath, 'r') do |file|
        file.each_line do |line|
          data_array << line.chomp
        end
      end
    end
  if data_array.empty?
      puts "File not found or File is empty"
      exit
  end
  data_array
end

def extract_elements(data_array, index)
  arr = []
  data_array.each do |row|
    next if row.to_i.zero? || row == '' || row[0] > '9'

    temp = row.split(',')[index]
    arr << temp.to_i if temp
  end
  arr
end

def extract_string_elements(data_array, index)
  arr = []
  data_array.each do |row|
    next unless row != 0 && !row.empty? && row[0] <= '9'

    temp = row.split(',')[index]
    arr << temp if temp
  end
  arr
end

def convert_months(month)
  arr = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
  arr[month]
end

def compute_average(arr)
  arr.inject { |sum, el| sum + el } / arr.size
end
