# frozen_string_literal: true

# Read File Method
def load_data_from_file(date, file_path)
  year, month = date.split('/')

  valid_month(month)
  if month
    month = convert_months(month.to_i - 1)
    file_pattern = "#{file_path}/#{file_path}_#{year}_#{month}.txt"
  else
    file_pattern = "#{file_path}/#{file_path}_#{year}_*.txt"
  end
  read_files(file_pattern)
end

def valid_month(month)
  return if month.to_i < 12

  puts 'invalid month'
  exit
end

def read_files(file_pattern)
  data_array = open_files(file_pattern)
  no_data_found(data_array)
  data_array
end

def open_files(file_pattern)
  data_array = []
  Dir.glob(file_pattern) do |filepath|
    File.open(filepath, 'r') do |file|
      file.each_line do |line|
        next if line.to_i.zero?

        data_array << line.chomp
      end
    end
  end
  data_array
end

def no_data_found(data_array)
  return unless data_array.empty?

  puts 'No data found'
  exit
end

def convert_months(month)
  %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec][month]
end
