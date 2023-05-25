# frozen_string_literal: true

# Read File Method
def get_data_in_array(s_month, file_path)
  year, month = s_month.split('/')
  mon = convert_m(month.to_i - 1)
  file_pattern = "#{file_path}/#{file_path}_#{year}_#{mon}.txt"
  file_read(file_pattern, file_path)
end

def self.get_data_in_arr(s_year, filepath)
  file_pattern = "#{filepath}/#{filepath}_#{s_year}_*.txt"
  file_read(file_pattern, filepath)
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
  data_array
end

# Convert 2022/01 to 2022_Jan
def convert_m(month)
  arr = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
  arr[month]
end

def get_average_of_array(arr)
  arr.inject { |sum, el| sum + el } / arr.size
end

def fill_date_array(data_array, index, arr)
  data_array.each do |row|
    arr << row.split(',')[index]
  end
  arr
end
