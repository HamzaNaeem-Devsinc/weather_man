# frozen_string_literal: true

# Read File Method
def load_data_from_file(date, file_path, element)
  year, month = date.split('/')
  file_pattern = verify_cmd_input(month, year, file_path, element)
  read_files(file_pattern)
end

def verify_cmd_input(month, year, file_path, element)
  if element == '-e' && !month
    "#{file_path}/#{file_path}_#{year}_*.txt"
  elsif ['-a', '-c'].include?(element) && month
    valid_month(month)
    month = convert_months(month.to_i - 1)
    "#{file_path}/#{file_path}_#{year}_#{month}.txt"
  else
    print_note
  end
end

def print_note
  puts 'if you want to get chart or average. Please enter month as well'
  puts 'OR'
  puts 'if you want to get year temperature report. Please enter only year'
  exit
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

def get_value_from_array(row, index)
  row.split(',')[index]
end
